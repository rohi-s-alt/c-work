public class Abs {
    public interface Parent {
        void introduce();
    }
    public abstract static class Manners implements Parent {
        abstract void greet();
    }
    public static class Human extends Manners {
        String name;
        public Human(String name) {
            this.name = name;
        }
        void greet() {
            System.out.println("Hello!");
        }
        public void introduce() {
            System.out.println("Myself " + name);
        }
    }
    public static void main(String[] args) {
        Human boy = new Human("Test");
        boy.greet();
        boy.introduce();
    }
}
