package Interface;

import java.util.Scanner;

public class SequenceNumber {

    protected int[] numbers;

    public SequenceNumber(int n) {
        numbers = new int[n];
    }

    public void input() {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Nhap cac phan tu:\n");

        for (int i = 0; i < numbers.length; i++) {
            System.out.print("numbers[" + i + "] = ");
            numbers[i] = scanner.nextInt();
        }
    }

    public void print() {
        for (int number : numbers) {
            System.out.print(number + " ");
        }
        System.out.println();
    }
}