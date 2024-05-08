public class Constructor {
    int x;
    static class DefaultConst{
        int first, second;
    }
    Constructor(int x){
        this.x=x; // Parameter
    }
    Constructor(Constructor old){
        this(old.x); // Clone
    }

    public static void main(String[] args) {
        DefaultConst defaultCon = new DefaultConst();
        Constructor ParamCon = new Constructor(5);
        Constructor CloneCon = new Constructor(ParamCon);
        System.out.print("Default : ");
        System.out.println(defaultCon.first+" "+defaultCon.second);
        System.out.print("Parameterized : ");
        ParamCon.display();
        System.out.print("Copy : ");
        CloneCon.display();
    }
    void display() {
        System.out.println(this.x);
    }
}