package rohit;
import java.util.Scanner;

public class scanf {

	public static void main(String[] args) {
		Scanner scanner = new Scanner (System.in);
		System.out.print("Enter Name : ");
		String name = scanner.nextLine();
		System.out.print("Enter ID : ");
		String id = scanner.nextLine();
		System.out.println("Student Name = " + name);
		System.out.println("Student ID = " + id);
		scanner.close();
	}
}
