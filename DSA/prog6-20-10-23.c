// Create DLL with nodes having information about the employee 
// and perform insertion at the front & deletion at the end

#include<stdio.h>
#include<stdlib.h>

struct emp {
    int empID;
    int deptID;
    struct emp*nxt;
    struct emp*prv;
};
typedef struct emp E;
E*fst = NULL;
E*temp = NULL;
E*ptr = NULL;

void create() {
    printf("Create And Insert Elements to the doubly linked list\n");
	
	temp = (E*) malloc(sizeof(E*));
	if(temp==NULL) {
		printf("No Space");
		exit(0);
	}
	printf("Enter Employee ID :");
	scanf("%d", &temp->empID);
	printf("Enter Department ID :");
	scanf("%d", &temp->deptID);
	temp->nxt = NULL;
	if (fst==NULL) {
        temp->prv = NULL;
		fst = temp;
	} else {
        temp->prv = ptr;
		ptr->nxt = temp;
	}
	ptr=temp;
}

void display() {
	printf("Display the Doubly Linked List\n");
	int count;
	for(temp=fst;temp!=NULL;temp=temp->nxt) {
		printf("\nRecord %d\n", count+1);
		printf("Employee ID : %d\n", temp->empID);
		printf("Department ID : %d\n", temp->deptID);
		count++;
	}
}

void insert() {
	printf("Inserting at the front\n");
	
	temp = (E*) malloc(sizeof(E*));
	if(temp==NULL) {
		printf("No Space");
		exit(0);
	}
	printf("Enter Employee ID :");
	scanf("%d", &temp->empID);
	printf("Enter Department ID :");
	scanf("%d", &temp->deptID);

    fst->prv = temp;
    temp->prv = NULL;
    temp->nxt = fst;
    fst = temp;
}

void delete() {
    printf("Deleting at the end\n");
    
	for(temp=fst;temp->nxt!=NULL;temp=temp->nxt);
    printf("Employee ID %d deleted successfully.\n", temp->empID);
    ptr = temp->prv;
    free(temp);
    ptr->nxt=NULL;
}

int main(){
	int c;
	printf("Enter 1 to Create\nEnter 2 to display\nEnter 3 to insert at the front\nEnter 4 to delete at the end\nEnter 5 to Exit the Program\n");
	do {
		printf("Input Choice (1,2,3,4,5) : ");
		scanf("%d",&c);
		switch(c) {
			case 1:
				create();
				break;
			case 2:
				display();
				break;
			case 3:
				insert();
				break;
            case 4:
                delete();
                break;
			default:
				exit(0);
		}
	} while(1);
    return 0;
}
