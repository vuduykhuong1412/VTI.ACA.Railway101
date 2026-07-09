package polymorphism.op2;

public class Program {

    public static void main(String[] args) {

        Student student = new Student();

        student.inputInfo();

        System.out.println("\nThông tin sinh viên");
        student.showInfo();

        if (student.isScholarship()) {
            System.out.println("Sinh viên được học bổng.");
        } else {
            System.out.println("Sinh viên không được học bổng.");
        }
    }
}
