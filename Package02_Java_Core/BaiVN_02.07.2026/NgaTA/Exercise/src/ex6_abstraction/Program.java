package ex6_abstraction;

public class Program {
    public static void main(String[] args) {

        VietnamesePhone phone = new VietnamesePhone();

        phone.insertContact("Nga", "0123456789");
        phone.insertContact("An", "099999999");

        phone.showContacts();

        phone.updateContact("Nga", "088888888");

        phone.searchContact("Nga");

        phone.removeContact("An");

        phone.showContacts();
    }
}
