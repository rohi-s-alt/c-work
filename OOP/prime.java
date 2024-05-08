
import java.util.Random; 

public class prime {      
    public static void main(String[] args) {
        Random random=new Random(); 
        int n=random.nextInt(100); 
        System.out.println("random number is "+n); 
        boolean isPrime = true; 
        for(int i=2;i<=Math.sqrt(n);i++) { 
            if(n%i==0) {
                isPrime=false; 
                break; 
            }
        }
        
        if(isPrime==true) {
            System.out.println("number is prime"); 
        } else {
            System.out.println("number is not prime"); 
        }
    }
}
