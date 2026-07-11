package ex1_interface;

import ex1_interface.impl.InsertionSort;
import ex1_interface.impl.QuickSort;
import ex1_interface.impl.SelectionSort;
import ex1_interface.impl.SequenceNumber;

import java.util.Scanner;

public class Program {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        System.out.print("Nhập số lượng phần tử: ");
        int n = scanner.nextInt();

        System.out.println("Chọn thuật toán:");
        System.out.println("1. Selection Sort");
        System.out.println("2. Insertion Sort");
        System.out.println("3. Quick Sort");
        System.out.print("Lựa chọn của bạn: ");

        int choice = scanner.nextInt();

        SequenceNumber sequence;

        switch (choice) {
            case 1:
                sequence = new SelectionSort(n);
                break;

            case 2:
                sequence = new InsertionSort(n);
                break;

            case 3:
                sequence = new QuickSort(n);
                break;

            default:
                System.out.println("Lựa chọn không hợp lệ!");
                return;
        }

        sequence.input();

        System.out.println("Trước khi sắp xếp:");
        sequence.print();

        ISort sort = (ISort) sequence;
        sort.sort();

        System.out.println("Sau khi sắp xếp:");
        sequence.print();
    }
}