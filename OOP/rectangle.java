import java.util.Scanner;
public class rectangle {
    public static void main(String[] args) {
        Scanner input= new Scanner(System.in);
        System.out.print("Enter length:");
        float len= input.nextFloat();
        System.out.print("Enter breadth:");
        float brd= input.nextFloat();
        System.out.println("Area = " + area(len, brd));
        System.out.println("Perimeter = " + perimeter(len, brd));
    }
    static float area(float x, float y) {
        return x * y;
    }
    static float perimeter(float x, float y) {
        return x*2 + y*2;
    }
}
