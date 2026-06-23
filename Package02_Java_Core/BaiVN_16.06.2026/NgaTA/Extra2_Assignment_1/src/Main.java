import common.enums.EducationLevel;
import common.enums.Sex;
import model.*;

import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {

        Subject subject1 = new Subject(1, "Java Core", 3);

        Teacher teacher1 = new Teacher(
                1,
                "Nguyen Van Minh",
                (byte) 35,
                "Da Nang",
                Sex.MALE,
                "0909000001",
                "minh@example.com",
                25000000,
                "Master",
                "Java Backend"
        );

        Student student1 = new Student(
                1,
                "Truong Ai Nga",
                (byte) 22,
                "Ho Chi Minh",
                Sex.FEMALE,
                "0909000002",
                "nga@example.com",
                "SV001",
                EducationLevel.UNIVERSITY,
                80
        );

        Student student2 = new Student(
                2,
                "Pham Thi Linh",
                (byte) 21,
                "Can Tho",
                Sex.FEMALE,
                "0909000003",
                "linh@example.com",
                "SV002",
                EducationLevel.COLLEGE,
                60
        );

        ArrayList<Student> students = new ArrayList<>();

        students.add(student1);
        students.add(student2);

        Course course1 = new Course(
                1,
                "Java Core 01",
                subject1,
                teacher1,
                "Monday - Wednesday, 18:00 - 20:00",
                30,
                students
        );

        ArrayList<Student> members = new ArrayList<>();

        members.add(student1);
        members.add(student2);

        Club club1 = new Club(
                1,
                "IT Club",
                "Club for students who love programming",
                members
        );

        Tuition tuition1 = new Tuition(
                1,
                student1,
                12000000,
                true
        );

        Classroom classroom1 = new Classroom(
                1,
                "A101",
                40,
                20,
                40
        );

        System.out.println("===== STUDENT INFO =====");
        student1.showInfo();
        student1.work();
        student1.registerCourse(course1);
        student1.doHomework();
        student1.joinClub(club1);
        student1.payTuition(tuition1);

        System.out.println("\n===== TEACHER INFO =====");
        teacher1.showInfo();
        teacher1.work();
        teacher1.teach(course1);
        teacher1.gradeHomework();

        System.out.println("\n===== COURSE INFO =====");
        course1.startCourse();
        student2.registerCourse(course1);

        System.out.println("\n===== CLUB INFO =====");
        club1.organizeEvent("Java Workshop");

        System.out.println("\n===== TUITION INFO =====");
        tuition1.checkPaymentStatus();

        System.out.println("\n===== CLASSROOM INFO =====");
        System.out.println("Enough seats: " + classroom1.hasEnoughSeats(course1.getStudents().size()));

        System.out.println("\n===== POLYMORPHISM DEMO =====");
        Person person1 = student1;
        Person person2 = teacher1;

        person1.work();
        person2.work();
    }
}