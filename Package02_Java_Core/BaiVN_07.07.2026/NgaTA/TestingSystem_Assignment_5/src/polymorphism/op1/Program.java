package polymorphism.op1;

import polymorphism.op1.impl.Student;

public class Program {

    public static void main(String[] args) {

        Student[] students = {
                new Student(1, "Nguyễn Văn A", 1),
                new Student(2, "Nguyễn Văn B", 1),
                new Student(3, "Nguyễn Văn C", 1),

                new Student(4, "Nguyễn Văn D", 2),
                new Student(5, "Nguyễn Văn E", 2),
                new Student(6, "Nguyễn Văn F", 2),

                new Student(7, "Nguyễn Văn G", 3),
                new Student(8, "Nguyễn Văn H", 3),
                new Student(9, "Nguyễn Văn I", 3),
                new Student(10, "Nguyễn Văn K", 3)
        };

        // Điểm danh cả lớp
        System.out.println("Điểm danh");
        for (Student student : students) {
            student.diemDanh();
        }

        // Nhóm 1 học bài
        System.out.println("\nNhóm 1 học bài");
        for (Student student : students) {
            if (student.getGroup() == 1) {
                student.hocBai();
            }
        }

        // Nhóm 2 dọn vệ sinh
        System.out.println("\n Nhóm 2 đi dọn vệ sinh");
        for (Student student : students) {
            if (student.getGroup() == 2) {
                student.donVeSinh();
            }
        }
    }
}
