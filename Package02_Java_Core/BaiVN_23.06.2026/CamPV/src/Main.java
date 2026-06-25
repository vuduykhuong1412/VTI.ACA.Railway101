import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        // ==========================
        // BÀI 1: KIỂM TRA THÁNG
        // ==========================
        Scanner sc1 = new Scanner(System.in);

        System.out.print("Nhập tháng (1-12): ");
        int month = sc1.nextInt();

        switch (month) {
            case 1, 3, 5, 7, 8, 10, 12:
                System.out.println("Tháng " + month + " có 31 ngày");
                break;

            case 4, 6, 9, 11:
                System.out.println("Tháng " + month + " có 30 ngày");
                break;

            case 2:
                System.out.println("Tháng 2 có 28 hoặc 29 ngày");
                break;

            default:
                System.out.println("Tháng không hợp lệ");
        }

        // ==========================
        // BÀI 2: KIỂM TRA ROLE
        // ==========================
        Scanner sc2 = new Scanner(System.in);

        System.out.print("\nNhập role: ");
        String role = sc2.nextLine().toUpperCase();

        switch (role) {
            case "ADMINISTRATOR":
                System.out.println("Bạn là Administrator");
                break;

            case "USER":
                System.out.println("Bạn là User");
                break;

            default:
                System.out.println("Unknown Role");
        }

        // ==========================
        // BÀI 3: MÁY TÍNH
        // ==========================
        Scanner sc3 = new Scanner(System.in);

        System.out.print("\nNhập số a: ");
        double a = sc3.nextDouble();

        System.out.print("Nhập số b: ");
        double b = sc3.nextDouble();

        System.out.print("Nhập phép toán (+, -, *, /): ");
        char op = sc3.next().charAt(0);

        switch (op) {
            case '+':
                System.out.println("Kết quả = " + (a + b));
                break;

            case '-':
                System.out.println("Kết quả = " + (a - b));
                break;

            case '*':
                System.out.println("Kết quả = " + (a * b));
                break;

            case '/':
                if (b == 0) {
                    System.out.println("Không thể chia cho 0");
                } else {
                    System.out.println("Kết quả = " + (a / b));
                }
                break;

            default:
                System.out.println("Phép toán không hợp lệ");
        }
    }
}