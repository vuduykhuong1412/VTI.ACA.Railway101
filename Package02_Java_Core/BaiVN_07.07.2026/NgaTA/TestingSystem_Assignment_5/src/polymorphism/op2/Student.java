package polymorphism.op2;

import java.util.Scanner;

public class Student extends Person {

    private String studentId;
    private double gpa;
    private String email;

    public Student() {
    }

    public Student(String name, String gender, String birthday, String address,
                   String studentId, double gpa, String email) {

        super(name, gender, birthday, address);
        this.studentId = studentId;
        this.gpa = gpa;
        this.email = email;
    }

    @Override
    public void inputInfo() {

        super.inputInfo();

        Scanner sc = new Scanner(System.in);

        System.out.print("Nhập mã sinh viên: ");
        studentId = sc.nextLine();

        while (true) {
            System.out.print("Nhập GPA: ");
            gpa = sc.nextDouble();

            if (gpa >= 0 && gpa <= 10) {
                break;
            }

            System.out.println("GPA phải từ 0 đến 10!");
        }

        sc.nextLine();

        System.out.print("Nhập Email: ");
        email = sc.nextLine();
    }

    @Override
    public void showInfo() {
        super.showInfo();

        System.out.println("Mã SV: " + studentId);
        System.out.println("GPA: " + gpa);
        System.out.println("Email: " + email);
    }

    public boolean isScholarship() {
        return gpa >= 8.0;
    }
}
