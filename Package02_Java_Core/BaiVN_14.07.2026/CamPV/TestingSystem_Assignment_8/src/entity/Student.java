package entity;

public class Student {

    private static int AUTO_ID = 1;

    private int id;
    private String name;

    public Student(String name) {
        this.id = AUTO_ID++;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}