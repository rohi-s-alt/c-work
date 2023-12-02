#include <stdio.h>

int main() {
    int row, column, i, j;
    int temp = 0, numelem = 0, numzero = 0;

    printf("Enter the number of rows: ");
    scanf("%d", &row);
    printf("Enter the number of columns: ");
    scanf("%d", &column);

    int arr[row][column];

    for (i = 0; i < row; i++) {
        for (j = 0; j < column; j++) {
            printf("Enter Row %d - Column %d : ", i, j);
            scanf("%d", &arr[i][j]);
        }
    }

    numelem = row * column;

    for (i = 0; i < row; i++) {
        for (j = 0; j < column; j++) {
            if (arr[i][j] == 0) {
                numzero++;
            }
        }
    }

    numelem -= numzero;

    int res[numelem + 1][3];

    if (numzero > numelem) {
        printf("\nThe given matrix is a sparse matrix.\n");
        for (i = 0; i < row; i++) {
            for (j = 0; j < column; j++) {
                if (arr[i][j] != 0) {
                    res[temp][0] = i;
                    res[temp][1] = j;
                    res[temp][2] = arr[i][j];
                    temp++;
                }
            }
        }
        printf("row\tcolumn\telement\n");
        for (i = 0; i < numelem; i++) {
            for (j = 0; j < 3; j++) {
                printf(" %d\t", res[i][j]);
                if (j == 2) {
                    printf("\n");
                }
            }
        }
    } else {
        printf("The given matrix is not a sparse matrix.\n");
    }

    return 0;
}
