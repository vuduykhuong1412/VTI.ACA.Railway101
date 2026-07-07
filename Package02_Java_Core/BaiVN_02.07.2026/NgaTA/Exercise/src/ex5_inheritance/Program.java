package ex5_inheritance;

public class Program {
    public static void main(String[] args) {
        PersonnelManagement qlcb = new PersonnelManagement();

        qlcb.addPerson(new Worker("Nguyễn Văn A", 25, Gender.MALE, "Hà Nội", 5));
        qlcb.addPerson(new Engineer("Trần Thị B", 28, Gender.FEMALE, "Đà Nẵng", "CNTT"));
        qlcb.addPerson(new Staff("Lê Văn C", 22, Gender.MALE, "Hồ Chí Minh", "Kế toán"));

        System.out.println("Danh sách cán bộ:");
        qlcb.showListPerson();

        System.out.println("Tìm kiếm cán bộ tên Trần Thị B:");
        qlcb.searchByName("Trần Thị B");

        System.out.println("Xóa cán bộ tên Lê Văn C:");
        qlcb.deleteByName("Lê Văn C");

        System.out.println("Danh sách sau khi xóa:");
        qlcb.showListPerson();
    }
}