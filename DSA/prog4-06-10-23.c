// prog 4 - 06-10-2023
// create stack and perform push, pop and traverse operation on stack using a linear linked list.

#include<stdio.h>
#include<stdlib.h>

struct stack {
	int data;
	struct stack *nxt;
};
typedef struct stack S;
S *top = NULL;
S *temp = NULL;

void push() {
	temp = (S*) malloc (sizeof(S*));
	if(temp==NULL) {
		printf("No Space");
		exit(0);
	}
	printf("Enter data to push : ");
	scanf("%d", &temp->data);
	if(top==NULL) {
		temp->nxt=NULL;
	} else {
		temp->nxt = top;
	}
	top=temp;
}
int pop() {
	if(top == NULL) {
		return -1;
	}
	temp = top;
	top = top->nxt;
	int dt = temp->data;
	free(temp);
	return dt;
}
void display() {
	if(top == NULL) {
		printf("No element to diplay.\n");
	} else {	
		printf("Stack : \n");
		for(temp=top; temp!=NULL; temp=temp->nxt) {
			printf("%d\n", temp->data);
		}
	}	
}
int main() {
	int c;
	int del;
	printf("Enter 1 to Push\nEnter 2 to Pop\nEnter 3 to display the stack\nEnter 4 to Exit the Program\n");
	do {
		printf(" \nInput Choice (1,2,3,4) : ");
		scanf("%d",&c);
		switch(c) {
			case 1:
				push();
				break;
			case 2:
				del = pop();
				if (del == -1) {
					printf("Underflow.\n");
				} else {
					printf("%d deleted Successfully.\n", del);
				}
				break;
			case 3:
				display();
				break;
			default:
				exit(0);
		}
	} while(1);
	return 0;
}
