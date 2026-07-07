package ex5_inheritance;

public class Worker extends Person {
    private int level;

    public Worker(String name, int age, Gender gender, String address, int level) {
        super(name, age, gender, address);
        this.level = level;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        if(level < 0 || level >= 10)
            this.level = level;
        else
            System.out.println("Level out of range");
    }

    @Override
    public String toString() {
        return super.toString() + "Worker{" + "level=" + level + '}';
    }
}
