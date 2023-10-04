// AIM - prog3 (8th of lab man) Create circular link list having information about a college and perform insertion at the front end and deletion at the end.

#include<stdio.h>
#include<stdlib.h>

struct college {
	int id;
	char name[50];
	struct college *nxt;
};
typedef struct college S;
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
	printf("Enter College ID:");
	scanf("%d", &temp->id);
	printf("Enter College Name:");
	scanf("%s", temp->name);
	if (fst==NULL) {
		fst = temp;
	} else {
		ptr->nxt=temp;
	}
	temp->nxt = fst;
	ptr=temp;
	
}

void display() {
	printf("\nDisplay the Linked List\n");
	int count;
	temp=fst;
    if(temp==NULL) {
		printf("\nList is Empty.\n");
	} else {
        do {
            printf("\nRecord %d\n", count+1);
            printf("College ID : %d\n", temp->id);
            printf("College Name : %s\n", temp->name);
            count++;
            temp=temp->nxt;
        } while(temp!=fst);
    }	
}

void insert() {
	printf("insertion at the front\n");
    pretemp=fst;
	do {
		pretemp=pretemp->nxt;
	} while(pretemp->nxt!=fst);
	
	nw = (S*) malloc(sizeof(S*));
	if(nw==NULL) {
		printf("No Space");
		exit(0);
	}
	printf("Enter College ID:");
	scanf("%d", &nw->id);
	printf("Enter College Name:");
	scanf("%s", nw->name);
	
    
	nw->nxt=fst;
    fst = nw;
	pretemp->nxt=fst;
}

void delete() {
    printf("Deleting at the end\n");
    pretemp=fst;
	do {
		pretemp=pretemp->nxt;
	} while((pretemp->nxt)->nxt!=fst);
    printf("Element with college ID %d deleted successfully.\n", (pretemp->nxt)->id);
    free(pretemp->nxt);
    pretemp->nxt=fst;
}

int main(){
	int c;
	do {
		printf("Enter 1 to Create\nEnter 2 to display\nEnter 3 to insert at the front\nEnter 4 to delete at the end\nEnter 5 to Exit the Program\n");
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
