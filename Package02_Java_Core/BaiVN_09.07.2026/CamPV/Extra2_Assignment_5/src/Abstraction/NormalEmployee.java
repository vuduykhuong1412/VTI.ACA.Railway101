package Abstraction;

public class NormalEmployee extends Employee {

    public NormalEmployee(String name, String address, int basicSalary) {
        super(name, address, basicSalary);
    }

    @Override
    public int getMonthlySalary() {
        return getBasicSalary() / 12;
    }
}