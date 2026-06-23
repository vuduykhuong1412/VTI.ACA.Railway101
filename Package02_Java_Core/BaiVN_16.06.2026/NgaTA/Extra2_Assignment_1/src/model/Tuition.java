package model;

public class Tuition {
    private int id;
    private Student student;
    private double amount;
    private boolean paid;

    public Tuition() {
    }

    public Tuition(int id, Student student, double amount, boolean paid) {
        this.id = id;
        this.student = student;
        this.amount = amount;
        this.paid = paid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public boolean isPaid() {
        return paid;
    }

    public void setPaid(boolean paid) {
        this.paid = paid;
    }

    @Override
    public String toString() {
        return "Tuition{" +
                "id=" + id +
                ", student=" + student +
                ", amount=" + amount +
                ", paid=" + paid +
                '}';
    }

    public void pay() {
        paid = true;
    }

    public void checkPaymentStatus() {
        if (paid) {
            System.out.println(student.getName() + " has paid tuition.");
        } else {
            System.out.println(student.getName() + " has not paid tuition.");
        }
    }
}
