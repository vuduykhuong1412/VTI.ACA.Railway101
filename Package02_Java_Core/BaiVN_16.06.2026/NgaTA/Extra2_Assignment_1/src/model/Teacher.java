package model;

import common.enums.Sex;

public class Teacher extends Person {
    double salary;
    private String degree;
    private String specialization;

    public Teacher(double salary, String degree, String specialization) {
        this.salary = salary;
        this.degree = degree;
        this.specialization = specialization;
    }

    public Teacher(int id, String name, byte age, String address, Sex sex, String phone, String email, double salary, String degree, String specialization) {
        super(id, name, age, address, sex, phone, email);
        this.salary = salary;
        this.degree = degree;
        this.specialization = specialization;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    @Override
    public void work() {
        prepareLesson();
        System.out.println("Teacher " + getName() + " is working for lesson");
    }

    public void prepareLesson() {
        System.out.println("Teacher " + getName() + " is preparing lesson");
    }

    public void teach(Course course) {
        System.out.println("Teacher " + getName() + " is teaching " + course.getCourseName());
    }

    public void gradeHomework() {
        System.out.println("Teacher " + getName() + " is grading homework");
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "salary=" + salary +
                ", degree='" + degree + '\'' +
                ", specialization='" + specialization + '\'' +
                '}';
    }
}
