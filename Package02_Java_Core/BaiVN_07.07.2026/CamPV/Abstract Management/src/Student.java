import java.util.Scanner;

public class Student extends Person {

    private String studentId;
    private double averageScore;
    private String email;

    public Student() {

    }

    public Student(String name, String gender, String birthDate, String address,
                   String studentId, double averageScore, String email) {

        super(name, gender, birthDate, address);

        this.studentId = studentId;
        this.averageScore = averageScore;
        this.email = email;
    }

    @Override
    public void inputInfo() {

        super.inputInfo();

        Scanner sc = new Scanner(System.in);

        System.out.print("Nhập mã sinh viên: ");
        studentId = sc.nextLine();

        System.out.print("Nhập điểm trung bình: ");
        averageScore = sc.nextDouble();
        sc.nextLine();

        System.out.print("Nhập Email: ");
        email = sc.nextLine();
    }

    @Override
    public void showInfo() {

        super.showInfo();

        System.out.println("Mã sinh viên: " + studentId);
        System.out.println("Điểm trung bình: " + averageScore);
        System.out.println("Email: " + email);
    }

    public void hocBong() {

        if (averageScore >= 8.0) {
            System.out.println("Sinh viên được học bổng.");
        } else {
            System.out.println("Sinh viên không được học bổng.");
        }
    }
}