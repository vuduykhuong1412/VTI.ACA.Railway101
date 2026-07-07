package ex5_inheritance.q3;

public class Student extends Person {
    private String id;

    public Student(String name, String id) {
        super(name);
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id + ", Name=" +
                 super.toString() + '}';
    }
}
