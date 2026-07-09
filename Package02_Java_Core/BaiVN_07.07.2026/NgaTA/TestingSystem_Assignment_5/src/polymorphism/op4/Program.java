package polymorphism.op4;

public class Program {

    public static void main(String[] args) {

        MyMath math = new MyMath();

        System.out.println(math.sum(10, 20));

        byte a = 5;
        byte b = 7;
        System.out.println(math.sum(a, b));

        System.out.println(math.sum(2.5f, 3.6f));
    }
}
