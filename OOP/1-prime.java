import java.util.Random;
public class Main {
    public static void main(String[] args) {
        Random gen = new Random();
        int num=gen.nextInt(100);
        boolean prime=true;
        for (int i=2;i<Math.sqrt(num)+1;i++){
            if (num%i==0){
                prime=false;
                break;
            }
        }
        if (prime==true){
            System.out.println(num+ " is prime.");
        } else {
            System.out.println(num+" is not prime.");
        }
    }
}