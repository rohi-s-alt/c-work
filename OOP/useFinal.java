final class FinalClass {
    final int finalVariable;

    FinalClass(int value) {
        this.finalVariable = value;
    }

    final void display() {
        System.out.println("The final variable value is: " + finalVariable);
    }
}
// Attempt to extend the final class would cause a compile-time error
class ExtendedClass extends FinalClass {
    ExtendedClass(int value) {
        super(value);
    }
}


public class useFinal {
    public static void main(String[] args) {
        FinalClass obj = new FinalClass(10);
        obj.display();

        // the following line will cause a compile-time error 
        // because the final variable cannot be changed
        obj.finalVariable = 20;

        // this would also result in a compile error 
        // because a final class cannot be extended
        ExtendedClass ext = new ExtendedClass(15);
    }
}
