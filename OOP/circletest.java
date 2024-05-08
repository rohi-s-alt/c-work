import java.util.Scanner;

public class circletest {
    public static void main(String[] args) {
        circle obj1= new circle();
        
        Scanner input= new Scanner(System.in);
        System.out.print("Enter the Radius:");
        double rad= input.nextDouble();

        System.out.println("Calculating area...");
        obj1.areaCalculated = obj1.area(rad);

        System.out.println("Calculating circumference...");
        obj1.circumferenceCalculated = obj1.circumference(rad);

        System.out.println("Displaying area and circumference...");
        obj1.display();
    }
}
