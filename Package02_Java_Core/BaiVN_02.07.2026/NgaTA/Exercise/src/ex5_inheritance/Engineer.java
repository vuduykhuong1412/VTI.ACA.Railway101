package ex5_inheritance;

public class Engineer extends Person {
    private String training;

    public Engineer(String name, int age, Gender gender, String address, String training) {
        super(name, age, gender, address);
        this.training = training;
    }

    public String getTraining() {
        return training;
    }

    public void setTraining(String training) {
        this.training = training;
    }

    @Override
    public String toString() {
        return super.toString() + "Engineer{" + "training=" + training + '}';
    }
}
