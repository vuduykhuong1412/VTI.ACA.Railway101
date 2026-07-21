package Interface;

import java.util.Scanner;

public class Main {

    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {

        System.out.println("========= SORT PROGRAM =========");

        System.out.print("Nhập số lượng phần tử: ");
        int n = scanner.nextInt();

        SequenceNumber sequence = chooseAlgorithm(n);

        if (sequence == null) {
            System.out.println("Lựa chọn không hợp lệ!");
            return;
        }

        sequence.input();

        System.out.println("\nTrước khi sắp xếp:");
        sequence.print();

        ((Sort) sequence).sort();

        System.out.println("\nSau khi sắp xếp:");
        sequence.print();
    }

    private static SequenceNumber chooseAlgorithm(int n) {

        System.out.println("\n===== MENU =====");
        System.out.println("1. Selection Sort");
        System.out.println("2. Insertion Sort");
        System.out.println("3. Quick Sort");
        System.out.print("Chọn: ");

        int choice = scanner.nextInt();

        switch (choice) {

            case 1:
                return new SelectionSort(n);

            case 2:
                return new InsertSort(n);

            case 3:
                return new QuickSort(n);

            default:
                return null;
        }
    }
}