// prog 8 - xx-xx-2023
// Implement the following sorting techniques:
//      a. Insertion sort
//      b. Bubble sort
//      c. Selection sort

#include <stdio.h>

void insertionSort(int arr[], int n) {
    int i, key, j;
    for (i = 1; i < n; i++) {
        key = arr[i];
        j = i - 1;

        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j = j - 1;
        }
        arr[j + 1] = key;
    }
}
void selectionSort(int arr[], int n) {
    int i, j, min_idx;
    for (i = 0; i < n - 1; i++) {
        min_idx = i;
        for (j = i + 1; j < n; j++)
            if (arr[j] < arr[min_idx])
                min_idx = j;

        int temp = arr[min_idx];
        arr[min_idx] = arr[i];
        arr[i] = temp;
    }
}
void bubbleSort(int arr[], int n) {
    int i, j;
    for (i = 0; i < n - 1; i++) {
        for (j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

void printArray(int arr[], int size) {
    int i;
    for (i = 0; i < size; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

int main() {
    int i, sizeofarray, c;
    printf("Enter the size of array : ");
    scanf("%d", &sizeofarray);
	int array[sizeofarray];
    for(i=0;i<sizeofarray;i++) {
        printf("Enter Element %d : ", i+1);
        scanf("%d", &array[i]);
    }

    printf("Original array: \n");
    printArray(array, sizeofarray);

    printf("use (1)Insertion Sort or (2)Selection Sort or (3) Bubble Sort? (1,2,3) : ");
    scanf("%d",&c);
    switch(c) {
        case 1:
            insertionSort(array, sizeofarray);
            break;
        case 2:
            selectionSort(array, sizeofarray);
            break;
        case 3:
            bubbleSort(array, sizeofarray);
            break;
        default:
            return 0;
    }

    printf("Sorted array: \n");
    printArray(array, sizeofarray);
    return 0;
}
