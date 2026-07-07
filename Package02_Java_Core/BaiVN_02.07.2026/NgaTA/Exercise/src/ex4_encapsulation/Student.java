package ex4_encapsulation;

public class Student {
    private int id;
    private String name;
    private String hometown;
    private double gpa;

    public Student(String name, String hometown) {
        this.name = name;
        this.hometown = hometown;
        this.gpa = 0;
    }

    public void setGpa(double gpa) {
        if (gpa >= 0 && gpa <= 10) {
            this.gpa = gpa;
        } else {
            System.out.println("Điểm không hợp lệ!");
        }
    }

    public void bonusPoints(double points) {
        if (this.gpa + points <= 10) {
            this.gpa += points;
        } else {
            this.gpa = 10;
        }
    }

    public void print() {
        String rank;

        if (gpa < 4) {
            rank = "Yếu";
        } else if (gpa < 6) {
            rank = "Trung bình";
        } else if (gpa < 8) {
            rank = "Khá";
        } else {
            rank = "Giỏi";
        }

        System.out.println("Tên: " + name
                + ", Quê quán: " + hometown
                + ", Điểm: " + gpa
                + ", Học lực: " + rank);
    }
}