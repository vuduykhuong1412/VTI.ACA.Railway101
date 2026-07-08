public class Exercise2 {

    public void question1() {

        Student[] students = {
                new Student(1, "Lê Minh Anh", 1),
                new Student(2, "Trần Quốc Bảo", 1),
                new Student(3, "Nguyễn Gia Huy", 1),

                new Student(4, "Nguyễn Khánh Đan", 2),
                new Student(5, "Đặng Hoàng Nam", 2),
                new Student(6, "Võ Thanh Tùng", 2),

                new Student(7, "Bùi Ngọc Mai", 3),
                new Student(8, "Đỗ Đức Long", 3),
                new Student(9, "Hoàng Hải Yến", 3),

                new Student(10, "Phan Tuấn Hưng", 3)
        };

        System.out.println("===== Điểm danh =====");
        for (Student student : students) {
            student.diemDanh();
        }

        System.out.println("\n===== Nhóm 1 học bài =====");
        for (Student student : students) {
            if (student.getGroup() == 1) {
                student.hocBai();
            }
        }

        System.out.println("\n===== Nhóm 2 dọn vệ sinh =====");
        for (Student student : students) {
            if (student.getGroup() == 2) {
                student.donVeSinh();
            }
        }

    }

}