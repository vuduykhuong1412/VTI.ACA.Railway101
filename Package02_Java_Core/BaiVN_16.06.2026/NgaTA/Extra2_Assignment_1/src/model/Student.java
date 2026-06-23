package model;

import common.enums.EducationLevel;
import common.enums.Sex;

public class Student extends Person {
    private String studentId;
    private EducationLevel educationLevel;
    private int trainingYear;
    private int accumulatedCredits;

    public Student(String studentId, EducationLevel educationLevel, int trainingYear, int accumulatedCredits) {
        this.studentId = studentId;
        this.educationLevel = educationLevel;
        this.trainingYear = trainingYear;
        this.accumulatedCredits = accumulatedCredits;
    }

    public Student(int id, String name, byte age, String address, Sex sex, String phone, String email, String studentId, EducationLevel educationLevel, int trainingYear, int accumulatedCredits) {
        super(id, name, age, address, sex, phone, email);
        this.studentId = studentId;
        if (educationLevel == EducationLevel.UNIVERSITY) {
            this.trainingYear = 4;
        } else {
            this.trainingYear = 3;
        }
        this.trainingYear = trainingYear;
        this.accumulatedCredits = accumulatedCredits;
    }

    public Student(int i, String truongAiNga, byte b, String hoChiMinh, Sex sex, String number, String mail, String sv001, EducationLevel educationLevel, int i1) {
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public EducationLevel getEducationLevel() {
        return educationLevel;
    }

    public void setEducationLevel(EducationLevel educationLevel) {
        this.educationLevel = educationLevel;
    }

    public int getTrainingYear() {
        return trainingYear;
    }

    public void setTrainingYear(int trainingYear) {
        this.trainingYear = trainingYear;
    }

    public int getAccumulatedCredits() {
        return accumulatedCredits;
    }

    public void setAccumulatedCredits(int accumulatedCredits) {
        this.accumulatedCredits = accumulatedCredits;
    }

    @Override
    public void work() {
        study();
    }

    public void registerCourse(Course course) {
        course.addStudent(this);
        System.out.println("Student " + getName() + " is registering course " + course.getCourseName());
    }

    public void study() {
        System.out.println("Student " + getName() + " is studying");
    }

    public void doHomework() {
        System.out.println("Student " + getName() + " is studying homework");
    }

    public void joinClub(Club club) {
        club.addMember(this);
        System.out.println("Student " + getName() + " is joining Club " + club.getClubName());
    }

    public void payTuition(Tuition tuition) {
        tuition.pay();
        System.out.println("Student " + getName() + " is paying tuition");
    }

    @Override
    public String toString() {
        return "Student{" +
                "studentId='" + studentId + '\'' +
                ", educationLevel=" + educationLevel +
                ", trainingYear=" + trainingYear +
                ", accumulatedCredits=" + accumulatedCredits +
                '}';
    }
}
