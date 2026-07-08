public class Department {

    int id;
    String name;

    // Constructor không tham số
    public Department() {
    }

    // Constructor có 1 tham số
    public Department(String nameDepartment) {
        this.id = 0;
        this.name = nameDepartment;
    }

    public void display() {
        System.out.println("ID: " + id + ", Name: " + name);
    }
}