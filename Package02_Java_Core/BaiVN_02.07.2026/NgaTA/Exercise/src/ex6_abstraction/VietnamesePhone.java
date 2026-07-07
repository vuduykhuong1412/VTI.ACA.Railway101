package ex6_abstraction;

public class VietnamesePhone extends Phone{
    @Override
    public void insertContact(String name, String phone) {

        for (Contact contact : contacts) {
            if (contact.getName().equalsIgnoreCase(name)) {
                System.out.println("Tên đã tồn tại!");
                return;
            }
        }

        contacts.add(new Contact(name, phone));
    }

    @Override
    public void removeContact(String name) {

        contacts.removeIf(contact ->
                contact.getName().equalsIgnoreCase(name));
    }

    @Override
    public void updateContact(String name, String newPhone) {

        for (Contact contact : contacts) {
            if (contact.getName().equalsIgnoreCase(name)) {
                contact.setNumber(newPhone);
                return;
            }
        }

        System.out.println("Không tìm thấy!");
    }

    @Override
    public void searchContact(String name) {

        for (Contact contact : contacts) {
            if (contact.getName().equalsIgnoreCase(name)) {
                System.out.println(contact);
                return;
            }
        }

        System.out.println("Không tìm thấy!");
    }

    public void showContacts() {
        for (Contact contact : contacts) {
            System.out.println(contact);
        }
    }
}
