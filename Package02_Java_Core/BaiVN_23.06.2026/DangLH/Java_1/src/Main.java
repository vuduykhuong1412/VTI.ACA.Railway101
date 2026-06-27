import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Bài 1: Nhập từ bàn phím từ 1-12, kiểm tra tháng tương ứng trong năm
        System.out.println("--- BÀI 1: KIỂM TRA THÁNG ---");
        System.out.print("Nhập vào một số từ 1 đến 12: ");
        int thang = scanner.nextInt();
        scanner.nextLine(); // Đọc bỏ dòng trống sau khi nhập số để tránh lỗi nuốt dòng ở bài sau

        switch (thang) {
            case 1:  System.out.println("Tháng 1 (January)"); break;
            case 2:  System.out.println("Tháng 2 (February)"); break;
            case 3:  System.out.println("Tháng 3 (March)"); break;
            case 4:  System.out.println("Tháng 4 (April)"); break;
            case 5:  System.out.println("Tháng 5 (May)"); break;
            case 6:  System.out.println("Tháng 6 (June)"); break;
            case 7:  System.out.println("Tháng 7 (July)"); break;
            case 8:  System.out.println("Tháng 8 (August)"); break;
            case 9:  System.out.println("Tháng 9 (September)"); break;
            case 10: System.out.println("Tháng 10 (October)"); break;
            case 11: System.out.println("Tháng 11 (November)"); break;
            case 12: System.out.println("Tháng 12 (December)"); break;
            default:
                System.out.println("Số nhập vào không hợp lệ! Vui lòng nhập từ 1 đến 12.");
        }

        System.out.println();

        // Bài 2: Kiểm tra vai trò (Role) nhập vào từ bàn phím
        System.out.println("--- BÀI 2: KIỂM TRA VAI TRÒ (ROLE) ---");
        System.out.print("Nhập vào role của bạn (administrator, user, ...): ");
        String role = scanner.nextLine();
        switch (role) {
            case "administrator":
                System.out.println("Quyền truy cập: Administrator");
                break;
            case "user":
                System.out.println("Quyền truy cập: User");
                break;
            default:
                System.out.println("Quyền truy cập: Unknown Role");
        }

        System.out.println(); // Dòng trống ngăn cách

        // Bài 3: Máy tính đơn giản (+, -, *, /) cho 2 số a và b
        System.out.println("--- BÀI 3: MÁY TÍNH ĐƠN GIẢN ---");
        System.out.print("Nhập số thứ nhất (a): ");
        double a = scanner.nextDouble();

        System.out.print("Nhập phép toán (+, -, *, /): ");
        char phepToan = scanner.next().charAt(0);

        System.out.print("Nhập số thứ hai (b): ");
        double b = scanner.nextDouble();

        switch (phepToan) {
            case '+':
                System.out.printf("Kết quả: %.2f + %.2f = %.2f\n", a, b, (a + b));
                break;
            case '-':
                System.out.printf("Kết quả: %.2f - %.2f = %.2f\n", a, b, (a - b));
                break;
            case '*':
                System.out.printf("Kết quả: %.2f * %.2f = %.2f\n", a, b, (a * b));
                break;
            case '/':
                if (b != 0) {
                    System.out.printf("Kết quả: %.2f / %.2f = %.2f\n", a, b, (a / b));
                } else {
                    System.out.println("Lỗi: Không thể chia cho số 0!");
                }
                break;
            default:
                System.out.println("Phép toán không hợp lệ! Chỉ hỗ trợ +, -, *, /");
        }

        scanner.close();
    }
}