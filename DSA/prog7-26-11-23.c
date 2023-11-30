// prog 7 - 26-11-2023
// Perform Linear Search and Binary Search on an array

#include <stdio.h>

int LinearSearch(int array[], int n, int x) {
	for (int i = 0; i < n; i++)
		if (array[i] == x)
			return i;
	return -1;
}
int binarySearch(int array[], int x, int low, int high) {
    while (low <= high) {
        int mid = low + (high - low) / 2;
 
        if (array[mid] == x)
            return mid;
 
        if (array[mid] < x)
            low = mid + 1;
 
        else
            high = mid - 1;
    }
 
    return -1;
}

int main() {
    int i, sizeofarray, toSearch, c, result;
    printf("Enter the size of array : ");
    scanf("%d", &sizeofarray);
	int array[sizeofarray];
    for(i=0;i<sizeofarray;i++) {
        printf("Enter Element %d : ", i+1);
        scanf("%d", &array[i]);
    }
    printf("Enter element to search : ");
    scanf("%d", &toSearch);

    printf("use (1)Binary search or (2)Linear Search? (1,2) : ");
    scanf("%d",&c);
    switch(c) {
        case 1:
            result = LinearSearch(array, sizeofarray, toSearch);
            break;
        case 2:
            result = binarySearch(array, toSearch, 0, sizeofarray - 1);
            break;
        default:
            return 0;
    }
	

	(result == -1)
		? printf("Element not found")
		: printf("Element found at index: %d", result);
    return 0;
}

