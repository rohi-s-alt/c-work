import java.util.Scanner;
public class fib {
    public static void main(String[] args) {
        int terms= 10;
        int prev=1, pprev=0,curr;
        System.out.print(pprev+" "+prev+" ");
        while (terms>2){
            curr=prev+pprev;
            System.out.print(curr+" ");
            pprev=prev;
            prev=curr;
            terms--;
        }
        System.out.println();
    }
}
