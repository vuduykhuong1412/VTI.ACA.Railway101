public class Exercise1 {

    public void question1() {

        // Constructor không tham số
        Department department1 = new Department();

        // Constructor có 1 tham số
        Department department2 = new Department("Sale");

        department1.display();
        department2.display();
    }

    public void question2() {

        Account account1 = new Account();

        System.out.println("Tạo Account thành công!");
    }
}