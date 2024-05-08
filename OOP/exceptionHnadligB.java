
class superClass {
    int a = 5;
    int b = 0;
    int div() {
        return a/b;
    }
}
class subClass extends superClass {
    void appnd() {
        int[] lst = {};
        lst = new int[5];
        lst[5] = 10;
    }
}
public class exceptionHnadligB {
    public static void main(String[] args) {
        subClass cls1 = new subClass();
        try {
            System.out.println("Calling funciton of Super Class...");
            System.out.println(cls1.div());
            System.out.println("Calling funciton of Sub Class...");
            cls1.appnd();
        } catch (ArithmeticException e) {
            System.out.println(e);
        } catch (IndexOutOfBoundsException e) {
            System.out.println(e);
        }
        System.out.println("Statement after try..catch block.");
    }
}
