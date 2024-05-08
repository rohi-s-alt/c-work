import java.util.Scanner;

public class string {
    public static void main(String[] args) {
        Scanner input= new Scanner(System.in);
        System.out.print("Enter String 1 : ");
        String str1= input.nextLine();

        System.out.print("Enter String 2 : ");
        String str2= input.nextLine();
        
        if (isEqual(str1, str2)) {
            System.out.println("Entered Strings are Equal.");
            System.out.println("String reversed : "+reveString(str1));
            System.out.println("String after changing case : "+changeCase(str1));
            
        } else {
            System.out.println("Entered Strings are not Equal.");
            System.out.println("String 1 reversed : "+reveString(str1));
            System.out.println("String 2 reversed : "+reveString(str2));
            System.out.println("String 1 after changing case : "+changeCase(str1));
            System.out.println("String 2 after changing case : "+changeCase(str2));
        }

    }
    static boolean isEqual(String x, String y) {
        return x.equals(y);
    }
    static String reveString(String x) {
        char[] charArray = x.toCharArray();
        int left = 0;
        int right = charArray.length - 1;
        
        while (left < right) {
            char temp = charArray[left];
            charArray[left] = charArray[right];
            charArray[right] = temp;
            
            left++;
            right--;
        }
        
        return new String(charArray);
    }
    static String changeCase(String x) {
        char[] charArray = x.toCharArray();
        for (int i = 0; i < charArray.length; i++) {
            if (Character.isLowerCase(charArray[i])) {
                charArray[i] = Character.toUpperCase(charArray[i]);
            } else if (Character.isUpperCase(charArray[i])) {
                charArray[i] = Character.toLowerCase(charArray[i]);
            }
        }
        return new String(charArray);
    }
}
