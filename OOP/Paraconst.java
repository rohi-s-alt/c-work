public class Paraconst {
    int id;
    String name;
    public Paraconst(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public static void main(String[] args) {
        Paraconst obj1= new Paraconst(111,"Abc");
        Paraconst obj2= new Paraconst(121,"Def");
        obj1.display();
        obj2.display();
    }
    public void display(){
        System.out.println("ID:" + this.id + "\nNAME:"+ this.name);
    }
}



