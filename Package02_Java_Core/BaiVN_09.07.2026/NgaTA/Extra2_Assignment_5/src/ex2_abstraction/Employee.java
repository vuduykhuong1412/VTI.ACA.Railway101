package ex2_abstraction;

public abstract class Employee {
    private int salary;
    private String name;
    private String address;

    public Employee(int salary, String name, String address) {
        this.salary = salary;
        this.name = name;
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String nm) {
        name = nm;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String add) {
        address = add;
    }

    public int getBasicSalary() {
        return salary;

    }

    public void setBasicSalary(int sal) {
        salary = sal;
    }

    public abstract int getMonthlySalary();
}
