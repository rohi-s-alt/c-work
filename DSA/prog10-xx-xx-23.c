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

void preOrderTraversal(N* root) {
    if (root != NULL) {
        printf("%d ", root->data);
        preOrderTraversal(root->left);
        preOrderTraversal(root->right);
    }
}

void postOrderTraversal(N* root) {
    if (root != NULL) {
        postOrderTraversal(root->left);
        postOrderTraversal(root->right);
        printf("%d ", root->data);
    }
}

int main() {
    int c, value;
	printf("Enter 1 to Create\nEnter 2 For InOrder Traversal\nEnter 3 For PreOrder Traversal\nEnter 4 For PostOrder Traversal\nEnter 5 to Exit the Program\n");
	do {
		printf(" \nInput Choice (1,2,3,4,5) : ");
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
                preOrderTraversal(root);
                printf("\n");
				break;
            case 4:
                postOrderTraversal(root);
                printf("\n");
				break;
			case 5:
				exit(0);
			default:
				printf("Enter Valid Choice.\n");
                break;
		}
	} while(1);
    return 0;
}
