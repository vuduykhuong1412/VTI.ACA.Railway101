import java.util.Locale;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        // Bài 1 : Nhập từ bàn phím từ 1-12, kiểm tra tháng tương ứng trong năm
        Scanner sc = new Scanner(System.in);
        int month;
        System.out.println("Nhập Tháng: ");
        month = sc.nextInt();
        switch (month) {
            case 1, 3, 5, 7, 8, 10, 12:
                System.out.println("Tháng " + month + " có 31 ngày!");
                break;
            case 2:
                System.out.println("Nhập năm: ");
                int year = sc.nextInt();
                if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) {
                    System.out.println("Tháng " + month + " Năm " + year + " có 29 ngày!");
                } else {
                    System.out.println("Tháng " + month + " Năm " + year + " có 28 ngày!");
                }
                break;
            case 4, 6, 9, 11:
                System.out.println("Tháng " + month + " có 30 ngày!");
                break;
            default:
                System.out.println("Tháng nhập vào không hợp lệ!");
                break;
        }

        sc.close();

        // Bài 2 : Có 3 role "administrator" "User", và "Unknown Role". Kiểm tra role nhập vào từ bàn phím
        // Sử dụng switch case
        Scanner sc2 = new Scanner(System.in);
        String role;
        role = sc2.nextLine().toUpperCase();
        switch (role) {
            case "ADMINISTRATOR":
                System.out.println("Người dùng thuộc role administrator!");
                break;
            case "USER":
                System.out.println("Người dùng thuộc role User!");
                break;
            default:
                System.out.println("Unknown Role!");
                break;
        }

        sc2.close();


        // Bài 3 : Thực hiện làm máy tính đơn giản với các phép toán +, -, * ,/ nhập từ bàn phím cho 2 số a, b cũng nhập
        // từ bàn phím
        Scanner sc3 = new Scanner(System.in);

        int num1, num2;
        double result;
        char operation;

        while (true) {
            System.out.print("Tiếp tục? (Y/N): ");
            char choose = sc3.next().toUpperCase(Locale.ROOT).charAt(0);

            if (choose == 'N') {
                break;
            } else if (choose == 'Y') {

                System.out.println("Nhập số a: ");
                num1 = sc3.nextInt();
                System.out.println("Nhập số b: ");
                num2 = sc3.nextInt();
                System.out.println("Nhập phép toán: ");
                operation = sc3.next().charAt(0);

                switch (operation) {
                    case '+':
                        result = num1 + num2;
                        System.out.println(num1 + " " + operation + " " + num2 + " = " + result);
                        break;
                    case '-':
                        result = num1 - num2;
                        System.out.println(num1 + " " + operation + " " + num2 + " = " + result);
                        break;
                    case '*':
                        result = num1 * num2;
                        System.out.println(num1 + " " + operation + " " + num2 + " = " + result);
                        break;
                    case '/':
                        if (num2 == 0) {
                            System.out.println("Không được chia cho " + num2);
                            break;
                        } else {
                            result = num1 * 1.0 / num2;
                            System.out.println(num1 + " " + operation + " " + num2 + " = " + result);
                            break;
                        }
                    default:
                        System.out.println("Phép toán không hợp lệ!");
                }
            } else {
                System.out.println("Lựa chọn không hợp lệ!");
            }
        }
        sc3.close();
    }
}