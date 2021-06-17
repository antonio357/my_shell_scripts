#!/bin/python3
# this scrit controls swap consig https://linuxhint.com/understanding_vm_swappiness/ for information
import os

dit = {
	0: "A value of 0 instructs the kernel not to initiate swap until the amount of free and file-backed pages is less than the high water mark in a zone. not recomended it may cause OOM(https://docs.couchbase.com/server/current/install/install-swap-space.html)",
	1: "minimum amount of swapping without disabling it entirely",
	3: "uses swap only to hibernate or to suspend",
	10: "recommended value to improve performance when sufficient memory exists in a system, when ram mem gets >= 90%",
	60: "default swap config",
	100: "aggressive swapping"
} 

def reload_swap():
	print("reloading swap and sysctl configuration")
	command_turn_off_swap = "sudo swapoff -a -v"
	command_reload_sysctl = "sudo sysctl -p"
	command_turn_on_swap = "sudo swapon -a -v"
	print("running $ {}".format(command_turn_off_swap))
	print("run $ htop on another terminal to check turning off swap progress")
	os.system(command_turn_off_swap)
	print("running $ {}".format(command_reload_sysctl))
	os.system(command_reload_sysctl)
	print("running $ {}".format(command_turn_on_swap))
	os.system(command_turn_on_swap)

print("type one of the following arguments")
print("(p) persistent swap config")
print("(t) temporary swap config")
persistent = str(input())
	
if persistent in ["p", "t"]:
	if persistent == "p":
		persistent = True
	elif  persistent == "t":
		persistent = False
		
	print("type one of the following arguments")
	for i in dit.keys():
		print("({}) {}".format(i, dit[i]))
	num = int(input())
	
	if num in dit.keys():
		command_persistent = "sudo sysctl -w vm.swappiness={}".format(num)
		command_temporary = "echo {} | sudo tee /proc/sys/vm/swappiness".format(num)
		if persistent:
			print("running $ {}".format(command_temporary))
			os.system(command_temporary)
			print("running $ {}".format(command_persistent))
			os.system(command_persistent)
		else:
			print("running $ {}".format(command_temporary))
			os.system(command_temporary)
		reload_swap()	
	else:
		print("argument invalid")
else:
	print("argument invalid")
