package backend;

import entity.Student;

import java.util.*;

public class Exercise1 {

    public void question1() {
        ArrayList<Student> students = new ArrayList<>();

        students.add(new Student("Nga"));
        students.add(new Student("An"));
        students.add(new Student("Nga"));
        students.add(new Student("Bình"));
        students.add(new Student("Bình"));
        students.add(new Student("Nga"));

        System.out.println("===== Danh sách ban đầu =====");
        printList(students);

        // 1
        System.out.println("\nTổng số phần tử:");
        System.out.println(students.size());

        // 2
        System.out.println("\nPhần tử thứ 4:");
        System.out.println(students.get(3));

        // 3
        System.out.println("\nPhần tử đầu:");
        System.out.println(students.get(0));

        System.out.println("\nPhần tử cuối:");
        System.out.println(students.get(students.size() - 1));

        // 4
        students.add(0, new Student("Đầu danh sách"));

        // 5
        students.add(new Student("Cuối danh sách"));
        System.out.println("\nSau khi thêm đầu và cuối:");
        printList(students);

        // 6
        Collections.reverse(students);
        System.out.println("\nSau khi đảo ngược:");
        printList(students);

        // 7
        System.out.println("\nTìm ID = 3");
        Student s = findById(students, 3);
        System.out.println(s);

        // 8
        System.out.println("\nTìm tên Nga");
        findByName(students, "Nga");

        // 9
        System.out.println("\nDanh sách tên bị trùng:");
        printDuplicateName(students);

        //10
        System.out.println("\nXóa tên của id = 2");
        Student st = findById(students, 2);
        if (st != null) {
            st.setName("");
        }
        printList(students);

        //11
        System.out.println("\nXóa Student id = 5");
        Student delete = findById(students, 5);
        if (delete != null) {
            students.remove(delete);
        }
        printList(students);

        //12
        ArrayList<Student> studentCopies = new ArrayList<>();
        studentCopies.addAll(students);
        System.out.println("\nDanh sách copy:");
        printList(studentCopies);

    }

    private void printList(ArrayList<Student> students) {
        for (Student s : students) {
            System.out.println(s);
        }
    }


    public Student findById(ArrayList<Student> students, int id) {
        for (Student s : students) {
            if (s.getId() == id) {
                return s;
            }
        }
        return null;
    }

    public void findByName(ArrayList<Student> students, String name) {
        for (Student s : students) {
            if (s.getName().equals(name)) {
                System.out.println(s);
            }
        }
    }

    public void printDuplicateName(ArrayList<Student> students) {
        for (int i = 0; i < students.size(); i++) {
            Student s1 = students.get(i);
            int count = 0;

            for (int j = 0; j < students.size(); j++) {
                Student s2 = students.get(j);
                if (s1.getName().equals(s2.getName())) {
                    count++;
                }
            }

            if (count > 1) {
                System.out.println(s1);
            }
        }
    }

    public void question2() {
        System.out.println();
        Stack<String> stack = new Stack<>();

        stack.push("Nguyễn Văn Nam");
        stack.push("Nguyễn Văn Huyên");
        stack.push("Trần Văn Nam");
        stack.push("Nguyễn Văn A");

        System.out.println("===== Stack =====");
        printStack(stack);
        System.out.println();
        Queue<String> queue = new LinkedList<>();

        queue.offer("Nguyễn Văn Nam");
        queue.offer("Nguyễn Văn Huyên");
        queue.offer("Trần Văn Nam");
        queue.offer("Nguyễn Văn A");

        System.out.println("===== Queue =====");
        printQueue(queue);
    }

    public void printStack(Stack<String> stack) {
        while (!stack.isEmpty()) {
            System.out.println(stack.pop());
        }
    }

    public void printQueue(Queue<String> queue) {
        while (!queue.isEmpty()) {
            System.out.println(queue.poll());
        }
    }
}