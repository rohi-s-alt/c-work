// prog no 5
// create linear queue using linked list and implement different operations such as insert delete and display the queue element

#include <stdio.h>
#include <stdlib.h>

struct queue {
    int data;
    struct queue *nxt;
};
typedef struct queue q;
q *temp = NULL;
q *ptr = NULL;
q *front = NULL;
q *rear = NULL;

void enqueue() {
    temp = (q*)malloc(sizeof(q));
    if(temp==NULL) {
		printf("No Space");
		exit(0);
	}
    printf("Enter Data : ");
    scanf("%d", &temp->data);
    temp->nxt = NULL;
    if(front==NULL) {
        front = temp;
	} else {
		rear->nxt = temp;
	}
	rear=temp;
}
int dequeue() {
	if(front == NULL) {
		return -1;
	}
	temp = front;
	front = front->nxt;
	int dt = temp->data;
	free(temp);
	return dt;
}

void display() {
	if(front == NULL) {
		printf("No element to diplay.\n");
	} else {	
		printf("queue : \n");
		for(temp=front; temp!=NULL; temp=temp->nxt) {
			printf("%d\n", temp->data);
		}
	}	
}

int main() {
	int c;
	int del;
	printf("Enter 1 to Enqueue\nEnter 2 to Dequeue\nEnter 3 to display the queue\nEnter 4 to Exit the Program\n");
	do {
		printf(" \nInput Choice (1,2,3,4) : ");
		scanf("%d",&c);
		switch(c) {
			case 1:
				enqueue();
				break;
			case 2:
				del = dequeue();
				if (del == -1) {
					printf("queue is empty.\n");
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
