package ex4_encapsulation;

public class Account {
    private final String id;
    private final String name;
    private double balance;

    public Account(String id, String name, double balance) {
        this.id = id;
        this.name = name;
        this.balance = balance;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getBalance() {
        return balance;
    }

    public void credit(int amount) {
        this.balance += amount;
    }

    public void debit(int amount) {
        this.balance -= amount;
    }

    public void transfer(Account account, double amount) {
        this.balance += amount;
    }
}
