package ex2_abstraction;

public class NormalEmployee extends Employee {
    public NormalEmployee(int salary, String name, String address) {
        super(salary, name, address);
    }

    @Override
    public int getMonthlySalary() {
        return getBasicSalary() / 12;

    }
}
