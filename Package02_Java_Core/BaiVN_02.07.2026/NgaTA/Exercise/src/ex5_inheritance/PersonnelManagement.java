package ex5_inheritance;

import java.util.ArrayList;

public class PersonnelManagement {
    private ArrayList<Person> persons = new ArrayList<>();

    void addPerson(Person person) {
        persons.add(person);
    }

    public void searchByName(String name) {
        for (Person p : persons) {
            if(p.getName().equals(name)) {
                System.out.println(p);
            }
        }
    }

    public void showListPerson() {
        for (Person p : persons) {
            System.out.println(p);
        }
    }

    public void deleteByName(String name) {
        persons.removeIf(p -> p.getName().equals(name));
    }

    @Override
    public String toString() {
        return "PersonnelManagement{" +
                "persons=" + persons +
                '}';
    }
}
