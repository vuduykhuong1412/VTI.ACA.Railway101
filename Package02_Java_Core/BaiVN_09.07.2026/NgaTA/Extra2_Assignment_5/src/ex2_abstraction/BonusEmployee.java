package ex2_abstraction;

public class BonusEmployee extends Employee {

    private int bonus;

    public BonusEmployee(int salary, String name, String address, int bonus) {

        super(salary, name, address);

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
}
