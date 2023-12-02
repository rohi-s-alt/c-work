// Create a LL with nodes having information about student. 
// Insert new node at the specified position.
#include<stdio.h>
#include<stdlib.h>

struct student {
	int rollno;
	char name[20];
	int atd;
	struct student *nxt;
};
typedef struct student S;
S *pretemp = NULL;
S *temp = NULL;
S *ptr = NULL;
S *fst = NULL;
S *nw = NULL;

void create() {
	printf("Create And Insert Elements to the linked list\n");

	temp = (S*) malloc(sizeof(S*));
	if(temp==NULL) {
		printf("No Space");
		exit(0);
	}
	printf("Enter Roll Number:");
	scanf("%d", &temp->rollno);
	printf("Enter Name:");
	scanf("%s", &temp->name);
	printf("Enter Attendance:");
	scanf("%d", &temp->atd);
	temp->nxt = NULL;
	if (fst==NULL) {
		fst = temp;
	} else {
		ptr->nxt=temp;
	}
	ptr=temp;
	printf("Record Entered Successfully.\n");	
}

void display() {
	printf("Display the Linked List\n");
	int count;
	for(temp=fst;temp!=NULL;temp=temp->nxt) {
		printf("Record %d\n", count+1);
		printf("Roll Number : %d\n", temp->rollno);
		printf("Name : %s\n", temp->name);
		printf("Attendance : %d\n\n", temp->atd);
		count++;
	}
}
void insert_pos() {
	printf("Inserting at certain position\n");
	int i=0, pos;
	printf("Enter Position : ");
	scanf("%d", &pos);
	for(pretemp=fst;pretemp!=NULL;pretemp=pretemp->nxt) {
		if(i==pos-1) {
			break;
		} else {
			i++;
		}
	}
	nw = (S*) malloc(sizeof(S*));
	if(nw==NULL) {
		printf("No Space");
		exit(0);
	}
	printf("Enter Roll Number:");
	scanf("%d", &nw->rollno);
	printf("Enter Name:");
	scanf("%s", &nw->name);
	printf("Enter Attendance:");
	scanf("%d", &nw->atd);
	
	temp = pretemp->nxt;
	pretemp->nxt=nw; //
	nw->nxt=temp;
	printf("Record Inserted Successfully\n");
}
int main(){
	int c;
	do {
		printf("Enter 1 to Create\nEnter 2 to display\nEnter 3 to insert at specific position\nEnter 4 to Exit the Program\n");
		printf("Input Choice (1,2,3,4) : ");
		scanf("%d",&c);
		switch(c) {
			case 1:
				create();
				break;
			case 2:
				display();
				break;
			case 3:
				insert_pos();
				break;
			default:
				exit(0);
		}
	} while(1);
	return 0;
}
