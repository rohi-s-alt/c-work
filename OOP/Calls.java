public class Calls {
    int val = 10;
    public static void callByValue(int x) {
        x = 70;
    }
    public static void callByReference(Calls num) {
        num.val = 120;
    }
    public static void main(String[] args) {
        int x = 20;
        Calls num = new Calls();
        System.out.println("Value: " + x);
        callByValue(x);
        System.out.println("Value(After calling the function): " + x);

        System.out.println("Reference: " + num.val);
        callByReference(num);
        System.out.println("Reference(After calling the function): " + num.val);
    }
}
