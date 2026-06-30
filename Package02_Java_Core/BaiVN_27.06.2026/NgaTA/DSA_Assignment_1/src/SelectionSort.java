//Exersice 2: Viết một chương trình thực hiện các công việc sau:
//Cho phép người dùng nhập giá trị cho một mảng, sau mỗi lần nhập chương trình hỏi có nhập tiếp không? Tiếp tục/Dừng lại khi người dùng nhập Y/N.
//Thực hiện sắp xếp mảng tăng dần sử dụng Selection Sort và in ra giá trị của mảng sau mỗi bước
//In ra mảng sau khi đã sắp xếp xong.

import java.util.ArrayList;
import java.util.Scanner;

public class SelectionSort {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        ArrayList<Integer> list = new ArrayList<>();

        boolean flag = true;
        char choice;
        do {
            System.out.print("Nhập giá trị: ");
            list.add(sc.nextInt());

            System.out.print("Tiếp tục? (Y/N): ");
            choice = sc.next().toUpperCase().charAt(0);

            flag = choice == 'Y';

        } while (flag);

        int n = list.size();
        int[] arr = new int[n];
        convertArray(arr, list);

        selectionSort(arr);
    }

    public static void convertArray(int[] arr, ArrayList<Integer> list) {
        for (int i = 0; i < list.size(); i++) {
            arr[i] = list.get(i);
        }
    }

    public static void selectionSort(int[] arr) {
        for (int i = 0; i < arr.length - 1; i++) {
            int minIdx = i;
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[j] < arr[minIdx]) {
                    minIdx = j;
                }
            }
            Common.swap(arr, i, minIdx);
            System.out.printf("Sau bước %d: ", i + 1);
            Common.printArray(arr);
        }
    }
}
