package frontend;

import backend.Exercise1;

public class Program1 {

    public static void main(String[] args) {

        Exercise1 exercise = new Exercise1();

        System.out.println("========== Question 1 ==========");

        exercise.question1a();

        exercise.question1b();

        exercise.question1c();

        exercise.question1d();

        exercise.question1e();

        exercise.question1f();

        exercise.findById(3);

        exercise.findByName("Nam");

        exercise.printDuplicateName();

        exercise.removeNameById2();

        exercise.deleteStudentId5();

        exercise.copyStudents();

        System.out.println("\n========== Question 2 ==========");

        exercise.question2();

    }

}