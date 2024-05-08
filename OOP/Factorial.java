import java.util.Scanner;
public class Factorial {
    public static void main(String[] args) {
        Scanner input= new Scanner(System.in);
        System.out.print("Enter the number:");
        int num= input.nextInt();
        System.out.println("Factorial of "+ num +" is "+ fact(num));
    }
    static int fact(int num){
        if (num==1 || num==0){
            return 1;
        }
        return num*fact(num-1);
    }
}
