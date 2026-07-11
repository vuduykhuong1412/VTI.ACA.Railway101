package ex1_interface.impl;

import ex1_interface.ISequenceNumber;

import java.util.Scanner;

public class SequenceNumber implements ISequenceNumber{

    private int[] numbers;

    public SequenceNumber(int n) {
        if (n <= 0) {
            throw new IllegalArgumentException(
                    "Số lượng phần tử phải lớn hơn 0"
            );
        }

        this.numbers = new int[n];
    }

    public void input() {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Nhập " + numbers.length + " phần tử:");

        for (int i = 0; i < numbers.length; i++) {
            System.out.print("numbers[" + i + "] = ");
            numbers[i] = scanner.nextInt();
        }
    }

    public void print() {
        System.out.print("Dãy số: ");

        for (int number : numbers) {
            System.out.print(number + " ");
        }

        System.out.println();
    }

    protected int[] getNumbers() {
        return numbers;
    }
}
