
public class circle {
    double areaCalculated;
    double circumferenceCalculated; 
    double area(double x) {
        return Math.PI * x * x;
    }
    double circumference(double x) {
        return 2 * Math.PI * x ;
    }
    public void display() {
        System.out.println("Area = " + areaCalculated);
        System.out.println("Circumference = " + circumferenceCalculated);
    }
    
}
