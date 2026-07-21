package backend;

import entity.Student;

import java.util.*;

public class Exercise1 {

    private ArrayList<Student> students = new ArrayList<>();

    public Exercise1() {

        students.add(new Student("Nam"));
        students.add(new Student("Huy"));
        students.add(new Student("Nam"));
        students.add(new Student("Hoa"));
        students.add(new Student("Nam"));
        students.add(new Student("An"));
    }

    // a
    public void question1a() {
        System.out.println("Tong so phan tu: " + students.size());
    }

    // b
    public void question1b() {
        System.out.println("Phan tu thu 4:");
        System.out.println(students.get(3));
    }

    // c
    public void question1c() {
        System.out.println("Phan tu dau:");
        System.out.println(students.get(0));

        System.out.println("Phan tu cuoi:");
        System.out.println(students.get(students.size() - 1));
    }

    // d
    public void question1d() {
        students.add(0, new Student("First Student"));
        printStudents();
    }

    // e
    public void question1e() {
        students.add(new Student("Last Student"));
        printStudents();
    }

    // f
    public void question1f() {
        Collections.reverse(students);
        printStudents();
    }

    // g
    public void findById(int id) {

        for (Student student : students) {
            if (student.getId() == id) {
                System.out.println(student);
                return;
            }
        }

        System.out.println("Khong tim thay!");
    }

    // h
    public void findByName(String name) {

        boolean found = false;

        for (Student student : students) {

            if (student.getName().equalsIgnoreCase(name)) {
                System.out.println(student);
                found = true;
            }

        }

        if (!found) {
            System.out.println("Khong tim thay!");
        }

    }

    // i
    public void printDuplicateName() {

        for (Student s1 : students) {

            int count = 0;

            for (Student s2 : students) {

                if (s1.getName().equalsIgnoreCase(s2.getName())) {
                    count++;
                }

            }

            if (count > 1) {
                System.out.println(s1);
            }

        }

    }

    // j
    public void removeNameById2() {

        for (Student student : students) {

            if (student.getId() == 2) {
                student.setName("");
            }

        }

        printStudents();
    }

    // k
    public void deleteStudentId5() {

        students.removeIf(student -> student.getId() == 5);

        printStudents();
    }

    // l
    public void copyStudents() {

        ArrayList<Student> studentCopies = new ArrayList<>();

        studentCopies.addAll(students);

        System.out.println("Danh sach copy:");

        for (Student student : studentCopies) {
            System.out.println(student);
        }

    }

    public void printStudents() {

        for (Student student : students) {
            System.out.println(student);
        }

    }

    public void question2() {

        String[] names = {
                "Nguyễn Văn Nam",
                "Nguyễn Văn Huyên",
                "Trần Văn Nam",
                "Nguyễn Văn A"
        };

        System.out.println("===== STACK =====");

        Stack<String> stack = new Stack<>();

        for (String name : names) {
            stack.push(name);
        }

        while (!stack.isEmpty()) {
            System.out.println(stack.pop());
        }

        System.out.println();

        System.out.println("===== QUEUE =====");

        Queue<String> queue = new LinkedList<>();

        Collections.addAll(queue, names);

        while (!queue.isEmpty()) {
            System.out.println(queue.poll());
        }

    }

}