package rohit;

public class Arithmetic {

	public static void main(String[] args) {
		int res = 11 + 25; 
		System.out.println("11 + 25 = " + res);
		int ogRes = res;
		
		res = res - 5;
		System.out.println(ogRes + " - 5 = " + res);
		ogRes = res;
		
		res = res * 7;
		System.out.println(ogRes + " * 7 = " + res);
		ogRes = res;
		
		res = res / 2;
		System.out.println(ogRes + " / 2 = " + res);
		ogRes = res;

		res = res % 7;
		System.out.println(ogRes + " % 2 = " + res);
		ogRes = res;
		

	}

}
