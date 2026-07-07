package ex4_encapsulation;

public class Program {
    public static void main(String[] args) {
        Student student1 = new Student("Nguyễn Văn A", "Hà Nội");

        student1.print();

        student1.setGpa(5.5);
        student1.print();

        student1.bonusPoints(2);
        student1.print();
    }
}
