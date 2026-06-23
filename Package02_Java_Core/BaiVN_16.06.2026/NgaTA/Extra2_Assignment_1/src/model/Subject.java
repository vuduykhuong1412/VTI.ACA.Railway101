package model;

public class Subject {
    private int id;
    private String subjectName;
    private int credit;

    public Subject() {
    }

    public Subject(int id, String subjectName, int credit) {
        this.id = id;
        this.subjectName = subjectName;
        this.credit = credit;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public int getCredit() {
        return credit;
    }

    public void setCredit(int credit) {
        this.credit = credit;
    }

    @Override
    public String toString() {
        return "Subject{" +
                "id=" + id +
                ", subjectName='" + subjectName + '\'' +
                ", credit=" + credit +
                '}';
    }
}
