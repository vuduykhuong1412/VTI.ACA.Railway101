package backend.ex1;

public class Student {
    public static final int MAX_STUDENT = 7;
    private static String college = "Đại học Bách Khoa";
    private static double moneyGroup = 0;
    private static int count = 0;
    private final int id;
    private String name;

    public Student(int id, String name) {
        if (count >= MAX_STUDENT) {
            throw new RuntimeException("Không thể tạo thêm Student. Tối đa là " + MAX_STUDENT);
        }

        this.id = id;
        this.name = name;

        count++;
    }

    public static String getCollege() {
        return college;
    }

    public static void setCollege(String college) {
        Student.college = college;
    }

    public static void contributeMoneyGroup(double money) {
        moneyGroup += money;
    }

    public static void spendMoneyGroup(double money) {
        if (moneyGroup > money) {
            moneyGroup -= money;
        } else {
            System.out.println("Quỹ lớp còn " + moneyGroup + " không đủ để dùng " + money);
        }
    }

    public static void showMoneyGroup() {
        System.out.println("Quỹ hiện tại: " + moneyGroup + "k");
    }

    public static void getStudentCount() {
        System.out.println("Tổng thành viên của group: " + count);
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getMoneyGroup() {
        return moneyGroup;
    }

    public final void study() {
        System.out.println("Đang học bài...");
    }

    public void display() {
        System.out.println("ID: " + id + ", Name: " + name + ", College: " + college);
    }
}
