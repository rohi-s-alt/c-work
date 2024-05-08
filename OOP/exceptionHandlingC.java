import java.util.Scanner;
public class exceptionHandlingC {
    public static void main(String[] args) {
        Scanner input= new Scanner(System.in);
        boolean run = true;
        while (run) {
            try {
                System.out.print("Enter a : ");
                int a = Integer.parseInt(input.next());
                System.out.print("Enter b : ");
                int b = Integer.parseInt(input.next());
                System.out.println("a = "+a+", b = "+b);
                System.out.println("a / b = "+a/b);
                run = false;
            } catch (NumberFormatException e) {
                System.out.println("Enter Valid Integer...");
            } catch (ArithmeticException e) {
                System.out.print("Arithmetic Error... ");
                System.out.println("Enter valid expression");
            }
        }
    }
}
