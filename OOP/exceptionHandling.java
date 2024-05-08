import java.util.Scanner;
public class exceptionHandling {
    public static void main(String[] args) {
        Scanner input= new Scanner(System.in);
        System.out.println(
            "1. Arithmetic Exception\n"+
            "2. Index Out of Bound Exception\n"+
            "3. Null Pointer Exception\n"+
            "4. Number Format Exception\n"+
            "5. End"
            );
        int ch;
        boolean run = true;
        while (run) {
            System.out.print("Enter choice (1,2,3,4,5) : ");
            ch = input.nextInt();
            switch (ch) {
                case 1:
                    System.out.println("Arithmetic Exception.");
                    int a = 4;
                    int b = 0;
                    int c;
                    try {
                        c = a/b;
                    } catch (ArithmeticException e) {
                        System.out.println(e);
                    }
                    break;
                case 2:
                    System.out.println("Index Out of Bound Exception.");
                    int[] lst = {};
                    lst = new int[5];
                    try {
                        lst[5] = 10;
                    } catch (IndexOutOfBoundsException e) {
                        System.out.println(e);
                    }
                    break;
                case 3:
                    System.out.println("Null Pointer Exception.");
                    String str = null;
                    try {
                        System.out.println(str.length());
                    } catch (NullPointerException e) {
                        System.out.println(e);
                    }
                    break;
                case 4:
                    System.out.println("Number Format Exception.");
                    try {
                        int charaNum = Integer.parseInt("abc");
                    } catch (NumberFormatException e) {
                        System.out.println(e);
                    }
                    break;
                case 5:
                    System.out.println("Exiting...");
                    run = false;
                    break;
                default:
                    break;
            }
        }
    }
}
