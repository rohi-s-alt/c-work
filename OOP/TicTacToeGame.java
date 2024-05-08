import java.util.Scanner;

public class TicTacToeGame {
    private static final char EMPTY = '-';
    private static final char PLAYER_X = 'X';
    private static final char PLAYER_O = 'O';
    private char[][] board;
    private char currentPlayer;
    private boolean gameEnded;

    public TicTacToeGame() {
        board = new char[3][3];
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                board[i][j] = EMPTY;
            }
        }
        currentPlayer = PLAYER_X;
        gameEnded = false;
    }

    public void play() {
        Scanner scanner = new Scanner(System.in);
        while (!gameEnded) {
            printBoard();
            boolean validInput = false;
            while (!validInput) {
                System.out.println("Player " + currentPlayer + "'s turn (enter row and column [1-3]):");
                int row = scanner.nextInt() - 1;
                int col = scanner.nextInt() - 1;
                if (row >= 0 && row < 3 && col >= 0 && col < 3 && board[row][col] == EMPTY) {
                    board[row][col] = currentPlayer;
                    validInput = true;
                } else {
                    System.out.println("This move at (" + (row + 1) + "," + (col + 1) + ") is not valid. Try again...");
                }
            }
            gameEnded = checkForWin() || checkForDraw();
            currentPlayer = (currentPlayer == PLAYER_X) ? PLAYER_O : PLAYER_X;
        }
        scanner.close();
        printBoard();
        if (checkForWin()) {
            System.out.println("Player " + (currentPlayer == PLAYER_X ? PLAYER_O : PLAYER_X) + " wins!");
        } else {
            System.out.println("The game ended in a draw!");
        }
    }

    private void printBoard() {
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                System.out.print(board[i][j]);
                if (j < 2) System.out.print("|");
            }
            System.out.println();
            if (i < 2) System.out.println("-----");
        }
        System.out.println();
    }

    private boolean checkForWin() {
        return (checkRowsForWin() || checkColumnsForWin() || checkDiagonalsForWin());
    }

    private boolean checkRowsForWin() {
        for (int i = 0; i < 3; i++) {
            if (board[i][0] != EMPTY && board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
                return true;
            }
        }
        return false;
    }

    private boolean checkColumnsForWin() {
        for (int j = 0; j < 3; j++) {
            if (board[0][j] != EMPTY && board[0][j] == board[1][j] && board[1][j] == board[2][j]) {
                return true;
            }
        }
        return false;
    }

    private boolean checkDiagonalsForWin() {
        return ((board[0][0] != EMPTY && board[0][0] == board[1][1] && board[1][1] == board[2][2]) ||
                (board[0][2] != EMPTY && board[0][2] == board[1][1] && board[1][1] == board[2][0]));
    }

    private boolean checkForDraw() {
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                if (board[i][j] == EMPTY) {
                    return false;
                }
            }
        }
        return true;
    }

    public static void main(String[] args) {
        TicTacToeGame game = new TicTacToeGame();
        game.play();
    }
    
}
