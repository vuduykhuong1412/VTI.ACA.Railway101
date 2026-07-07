package ex5_inheritance;

public class Staff extends Person {
    private String work;

    public Staff(String name, int age, Gender gender, String address, String work) {
        super(name, age, gender, address);
        this.work = work;
    }

    public String getWork() {
        return work;
    }
    public void setWork(String work) {
        this.work = work;
    }

    @Override
    public String toString() {
        return super.toString() + "Staff{" + "work=" + work + '}';
    }
}
