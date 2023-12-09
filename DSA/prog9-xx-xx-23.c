#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node *left;
    struct Node *right;
};
typedef struct Node N;
N *newNode = NULL;
N *root = NULL;

N* insert(N *root, int value) {
    if (root == NULL) {
        newNode = (N*)malloc(sizeof(N));
        newNode->data = value;
        newNode->left = NULL;
        newNode->right = NULL;
        return newNode;
    }

    if (value < root->data) {
        root->left = insert(root->left, value);
    } else if (value > root->data) {
        root->right = insert(root->right, value);
    }

    return root;
}

void inOrderTraversal(N* root) {
    if (root != NULL) {
        inOrderTraversal(root->left);
        printf("%d ", root->data);
        inOrderTraversal(root->right);
    }
}

int main() {
    int c, value;
	printf("Enter 1 to Create\nEnter 2 to Print BST(InOrder Traversal)\nEnter 3 to Exit the Program\n");
	do {
		printf(" \nInput Choice (1,2,3) : ");
		scanf("%d",&c);
		switch(c) {
			case 1:
                printf("Enter data to Insert : ");
                scanf("%d", &value);
				root = insert(root, value);
				break;
			case 2:
                inOrderTraversal(root);
                printf("\n");
				break;
			case 3:
				exit(0);
			default:
				printf("Enter Valid Choice.\n");
                break;
		}
	} while(1);

    return 0;
}
