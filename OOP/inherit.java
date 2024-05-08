import java.util.Scanner;
class Box {
    float width;
    float height;
    float depth;
}
class BoxWeight extends Box {
    float weight;
}

public class inherit {
    public static void main(String[] args) {
        Scanner input= new Scanner(System.in);
        BoxWeight b1 = new BoxWeight();
        System.out.print("Enter width : ");
        b1.width = input.nextFloat();
        System.out.print("Enter height : ");
        b1.height = input.nextFloat();
        System.out.print("Enter depth : ");
        b1.depth = input.nextFloat();
        
        float volume = b1.width * b1.height * b1.depth;
        System.out.println("Volume = " + volume + " unit sq");
        
        System.out.print("Enter weight : ");
        b1.weight = input.nextFloat();
        System.out.println("Weight = " + b1.weight + " unit");
    }
    
}
