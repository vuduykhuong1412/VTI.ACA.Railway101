package Abstraction;

public class BonusEmployee extends Employee {

    private int bonus;

    public BonusEmployee(String name, String address, int basicSalary, int bonus) {
        super(name, address, basicSalary);
        this.bonus = bonus;
    }

    public int getBonus() {
        return bonus;
    }

    public void setBonus(int bonus) {
        this.bonus = bonus;
    }

    @Override
    public int getMonthlySalary() {
        return getBasicSalary() / 12 + bonus;
    }

    @Override
    public void displayInfo() {

        System.out.println("Tên nhân viên : " + getName());
        System.out.println("Địa chỉ       : " + getAddress());
        System.out.println("Lương năm     : " + getBasicSalary());
        System.out.println("Bonus         : " + bonus);
        System.out.println("Lương tháng   : " + getMonthlySalary());
    }
}