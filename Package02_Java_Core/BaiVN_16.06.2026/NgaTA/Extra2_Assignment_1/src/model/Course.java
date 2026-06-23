package model;

import java.util.ArrayList;

public class Course {
    private int id;
    private String courseName;
    private Subject subject;
    private Teacher teacher;
    private String schedule;
    private int maxStudents;
    private ArrayList<Student> students;

    public Course() {
        students = new ArrayList<>();
    }

    public Course(int id, String courseName, Subject subject, Teacher teacher, String schedule, int maxStudents, ArrayList<Student> students) {
        this.id = id;
        this.courseName = courseName;
        this.subject = subject;
        this.teacher = teacher;
        this.schedule = schedule;
        this.maxStudents = maxStudents;
        this.students = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }

    public int getMaxStudents() {
        return maxStudents;
    }

    public void setMaxStudents(int maxStudents) {
        this.maxStudents = maxStudents;
    }

    public ArrayList<Student> getStudents() {
        return students;
    }

    public void setStudents(ArrayList<Student> students) {
        this.students = students;
    }

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", courseName='" + courseName + '\'' +
                ", subject=" + subject +
                ", teacher=" + teacher +
                ", schedule='" + schedule + '\'' +
                ", maxStudents=" + maxStudents +
                ", students=" + students +
                '}';
    }

    public void addStudent(Student student) {
        if (students.size() < maxStudents) {
            students.add(student);
            System.out.println("Added student: " + student.getName());
        } else {
            System.out.println("Course is full.");
        }
    }

    public void removeStudent(Student student) {
        students.remove(student);
        System.out.println("Removed student: " + student.getName());
    }

    public void startCourse() {
        System.out.println(courseName + " has started.");
    }
}
