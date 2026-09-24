package Abstraction;

import java.util.Scanner;

public class Main {

    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {

        while (true) {

            System.out.println("\n========== EMPLOYEE MANAGEMENT ==========");
            System.out.println("1. Normal Employee");
            System.out.println("2. Bonus Employee");
            System.out.println("0. Exit");
            System.out.print("Lựa chọn: ");

            int choice = scanner.nextInt();
            scanner.nextLine();

            switch (choice) {

                case 1:
                    createNormalEmployee();
                    break;

                case 2:
                    createBonusEmployee();
                    break;

                case 0:
                    System.out.println("Kết thúc chương trình!");
                    return;

                default:
                    System.out.println("Lựa chọn không hợp lệ!");
            }
        }
    }

    private static void createNormalEmployee() {

        System.out.print("Tên: ");
        String name = scanner.nextLine();

        System.out.print("Địa chỉ: ");
        String address = scanner.nextLine();

        System.out.print("Lương năm: ");
        int salary = scanner.nextInt();

        Employee employee = new NormalEmployee(name, address, salary);

        System.out.println("\n===== THÔNG TIN NHÂN VIÊN =====");
        employee.displayInfo();
    }

    private static void createBonusEmployee() {

        System.out.print("Tên: ");
        String name = scanner.nextLine();

        System.out.print("Địa chỉ: ");
        String address = scanner.nextLine();

        System.out.print("Lương năm: ");
        int salary = scanner.nextInt();

        System.out.print("Bonus hàng tháng: ");
        int bonus = scanner.nextInt();

        Employee employee = new BonusEmployee(name, address, salary, bonus);

        System.out.println("\n===== THÔNG TIN NHÂN VIÊN =====");
        employee.displayInfo();
    }
}