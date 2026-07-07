package ex6_abstraction;

import java.util.ArrayList;

public abstract class Phone {
    protected ArrayList<Contact> contacts = new ArrayList<>();

    public void insertContact(String name, String phone){
    }

    public void removeContact(String name){
    }

    public void updateContact(String name, String newPhone){
    }

    public void searchContact(String name){
    }
}
