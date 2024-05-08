import java.util.Scanner;
public class SumOfArray {
    public static void main(String[] args) {
        Scanner sin= new Scanner(System.in);
        System.out.print("Enter Number of Elements : ");
        int t=sin.nextInt();
        int[] arr= new int[t];
        for (int i = 0; i < t; i++) {
            System.out.print("Enter Element " + (i+1) + " : ");
            arr[i]=sin.nextInt();
        }
        System.out.println("Sum: "+sum(arr)+"\nAverage: "+average(arr));
    }
    static int sum(int[] arr){
        int res=0;
        for (int x:arr) {
            res+=x;
        }
        return res;
    }
    static int average(int[] arr){
        return sum(arr)/arr.length;
    }
}
