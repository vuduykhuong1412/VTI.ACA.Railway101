package Abstraction;

public abstract class Employee {

    private String name;
    private String address;
    protected int basicSalary;

    public Employee() {

    }

    public Employee(String name, String address, int basicSalary) {
        this.name = name;
        this.address = address;
        this.basicSalary = basicSalary;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public int getBasicSalary() {
        return basicSalary;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setBasicSalary(int basicSalary) {
        this.basicSalary = basicSalary;
    }

    public abstract int getMonthlySalary();

    public void displayInfo() {
        System.out.println("Tên nhân viên : " + name);
        System.out.println("Địa chỉ       : " + address);
        System.out.println("Lương năm     : " + basicSalary);
        System.out.println("Lương tháng   : " + getMonthlySalary());
    }
}