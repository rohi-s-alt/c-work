#include <stdio.h>
int main() {
	int i, j, k, SUM[3][3], TRANS[3][3], MULTI[3][3];
	int X[3][3] = {
	{1, 2, 3}, 
	{4, 5, 6},
	{7, 8, 9}
	};
	int Y[3][3] = {
	{1, 2, 3}, 
	{4, 5, 6},
	{7, 8, 9}
	};
	/*
	for(i=0; i<3; i++) {
		for(j=0; j<3; j++){
			printf("Enter row %d : column %d - ", i, j);
			scanf("%d", &X[i][j]);
			printf("\n")	;
		}
	}
	
	for(i=0; i<3; i++) {
		for(j=0; j<3; j++){
			printf("%d ", X[i][j]);
		}
		printf("\n\n")	;
	}
	*/
	
	// SUM
	for(i=0; i<3; i++) {
		for(j=0; j<3; j++){
			SUM[i][j] = X[i][j] + Y[i][j];
		}
	}
	printf("\n\nSum of X and Y :\n");
	for(i=0; i<3; i++) {
		for(j=0; j<3; j++){
			printf("%d ", SUM[i][j]);
		}
		printf("\n\n")	;
	}
	
	// TRANSPOSE
	for(i=0; i<3; i++) {
		for(j=0; j<3; j++){
			TRANS[i][j] = X[j][i];
		}
	}
	printf("\n\nTranspose of X :\n");
	for(i=0; i<3; i++) {
		for(j=0; j<3; j++){
			printf("%d ", TRANS[i][j]);
		}
		printf("\n\n")	;
	}
	
	// MULTIPLICATION
	for(i=0; i<3; i++) {
		for(j=0; j<3; j++){
			MULTI[i][j] = 0;
			for(k=0; k<3; k++) {
				MULTI[i][j] = MULTI[i][j] + X[i][k] * Y[k][j];
			}
		}
	}
	printf("\n\nMultiplicatin of X and Y :\n");
	for(i=0; i<3; i++) {
		for(j=0; j<3; j++){
			printf("%d ", MULTI[i][j]);
		}
		printf("\n\n")	;
	}
	return 0;	
}
