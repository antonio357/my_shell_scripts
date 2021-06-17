#include<iostream>
#include <bits/stdc++.h>
#include <stack>

using namespace std;
#define MAX 100 

class rStack { 
	int top; 

public: 
	int a[MAX]; // Maximum size of Stack 

	rStack() { top = -1; } 
	bool push(int x); 
	int pop(); 
	int peek(); 
	bool isEmpty(); 
    void rotate();
    int size();
}; 

void rStack::rotate() {
    int newFirst = a[top];
    for (int i = top; i > 0; i--) {
        a[i] = a[i - 1];
    }
    a[0] = newFirst;
}

bool rStack::push(int x) 
{ 
	if (top >= (MAX - 1)) { 
		// cout << "Stack Overflow"; 
		return false; 
	} 
	else { 
		a[++top] = x; 
		// cout << x << " pushed into stack\n"; 
		return true; 
	} 
} 

int rStack::pop() 
{ 
	if (top < 0) { 
		// cout << "Stack Underflow"; 
		return 0; 
	} 
	else { 
		int x = a[top--]; 
		return x; 
	} 
} 
int rStack::peek() 
{ 
	if (top < 0) { 
		// cout << "Stack is Empty"; 
		return 0; 
	} 
	else { 
		int x = a[top]; 
		return x; 
	} 
} 

bool rStack::isEmpty() 
{ 
	return (top < 0); 
}

int rStack::size() { 
	return (top + 1); 
}

int main() {
    int size;
    rStack rst;
    while (true){
        cin >> size;
        if (size == 0) break;
        // esvaziando a pilha
        while (rst.isEmpty() == false) rst.pop();
        // populando apilha
        for (int i = size; i > 0; i--) {
            rst.push(i);
        }
        // processando os resultados
        cout << "Discarded cards:";
        while (rst.size() > 2) {
            cout << ' ' << rst.pop() <<  ',';
            rst.rotate();
        }
        cout << ' ' << rst.pop() << endl;
        cout << "Remaining card: " << rst.peek() << endl;
    }
    return 0;
}
