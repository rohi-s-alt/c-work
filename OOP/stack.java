import java.util.Scanner;
public class stack {
    int len;
    int[] stack = {};
    int top = -1;
    Scanner input = new Scanner(System.in);
    public void main(String[] args) {
        System.out.print("Enter lenght of the stack : ");
        this.len = input.nextInt();
        stack = new int[this.len];
        System.out.println("Enter 1 to push\n"+
                        "Enter 2 to pop\n"+
                        "Enter 3 to display\n"+
                        "Enter 4 to exit");
        boolean run = true;
        while (run) {
            System.out.print("Enter Choice (1,2,3,4) : ");
            int ch = input.nextInt();
            switch (ch) {
                case 1:
                    push();
                    break;
                case 2:
                    pop();
                    break;
                case 3:
                    display();
                    break;
                case 4:
                    System.out.println("Exiting...");
                    run = false;
                    break;
                default:
                    System.out.println("Invalid input.");
                    break;
            }
        }
       
    }
    void push() {
        if (top == len-1) {
            System.out.println("Overflow.");
        } else {
            System.out.print("Enter data : ");
            int data = input.nextInt();
            stack[++top] = data;
        }
    }
    void pop() {
        if (top == -1) {
            System.out.println("Underflow.");
        } else {
            System.out.println(stack[top--] + " popped successfulyy.");
        }
    }
    void display() {
        if (top == -1) {
            System.out.println("No data to show.");
        } else {
            System.out.println("Stack : ");
            for (int i = top; i >= 0; i--) {
                System.out.println(stack[i]);  
            }
        }
    }  
}