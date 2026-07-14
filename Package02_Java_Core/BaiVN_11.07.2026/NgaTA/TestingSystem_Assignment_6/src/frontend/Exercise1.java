package frontend;

import backend.ex1.*;

public class Exercise1 {

    public static void main(String[] args) {
//        question1();
//        question2();
//        question3();
//        question6();
//        question7();
//        question8();
        question9();
    }

    public static void question1() {
        Student[] students = {new Student(1, "Nguyễn Văn A"), new Student(2, "Nguyễn Văn B"), new Student(3, "Nguyễn Văn C")};

        System.out.println("===== Ban đầu =====");

        for (Student s : students) {
            s.display();
        }

        Student.setCollege("Đại học Công nghệ");

        System.out.println("\n===== Sau khi đổi =====");

        for (Student s : students) {
            s.display();
        }
    }

    public static void question2() {
        // B1
        System.out.println("B1: Mỗi sinh viên nộp 100k");

        Student.contributeMoneyGroup(100);
        Student.contributeMoneyGroup(100);
        Student.contributeMoneyGroup(100);

        Student.showMoneyGroup();

        // B2
        System.out.println("\nB2: Student 1 lấy 50k mua bim bim");

        Student.spendMoneyGroup(50);

        Student.showMoneyGroup();

        // B3
        System.out.println("\nB3: Student 2 lấy 20k mua bánh mì");

        Student.spendMoneyGroup(20);

        Student.showMoneyGroup();

        // B4
        System.out.println("\nB4: Student 3 lấy 150k mua đồ dùng");

        Student.spendMoneyGroup(350);

        Student.showMoneyGroup();

        // B5
        System.out.println("\nB5: Mỗi sinh viên góp thêm 50k");

        Student.contributeMoneyGroup(50);
        Student.contributeMoneyGroup(50);
        Student.contributeMoneyGroup(50);

        Student.showMoneyGroup();
    }

    public static void question3() {
        int result = MyMath.min(5, 7);
        System.out.println(result);

        int result2 = MyMath.max(9, 7);
        System.out.println(result2);

        int result3 = MyMath.sum(5, 7);
        System.out.println(result3);
    }

    public static void question6() {
        new PrimaryStudent(1, "A");
        new PrimaryStudent(2, "B");

        new SecondaryStudent(3, "C");
        new SecondaryStudent(4, "D");
        new SecondaryStudent(5, "E");
        new SecondaryStudent(6, "F");

        Student.getStudentCount();
        PrimaryStudent.getPrimaryCount();
        SecondaryStudent.getSecondaryCount();
    }

    public static void question7() {
        try {
            for (int i = 1; i <= 8; i++) {
                Student s = new Student(i, "Student " + i);
                s.display();
                Student.getStudentCount();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public static void question8() {
        try {
            new HinhTron(5);
            new HinhChuNhat(2, 3);
            new HinhTron(4);
            new HinhChuNhat(6, 7);
            new HinhTron(3);

            // hình thứ 6
            new HinhChuNhat(8, 9);
        } catch (HinhHocException e) {
            System.out.println(e.getMessage());
        }
    }

    public static void question9() {
        System.out.print("Nhập tuổi: ");

        int age = ScannerUtils.inputInt();

        System.out.print("Nhập tên: ");

        String name = ScannerUtils.inputString();

        System.out.println(name);

        System.out.println(age);
    }
}
