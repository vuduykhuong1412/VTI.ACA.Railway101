package frontend;

import backend.ex1.MyMath;
import backend.ex1.PrimaryStudent;
import backend.ex1.SecondaryStudent;
import backend.ex1.Student;

public class Exercise2 {
    public static void main(String[] args) {
        question1();
        question3();
    }

    public static void question1(){
        MyMath math = new MyMath();

        System.out.println(math.sum(5));
    }

    public static void question3(){
        Student s1 = new PrimaryStudent(1,"A");
        Student s2 = new SecondaryStudent(2,"B");

        s1.study();
        s2.study();
    }
}
