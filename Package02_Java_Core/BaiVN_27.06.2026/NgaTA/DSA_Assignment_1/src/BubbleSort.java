//Exersice 1: Viết một chương trình thực hiện các công việc sau:
//Cho phép người dùng nhập vào N phần tử của mảng
//Sau đó nhập vào giá trị cho lần lượt từng phần tử
//Thực hiện sắp xếp mảng tăng dần sử dụng Bubble Sort và in ra giá trị của mảng sau mỗi bước
//In ra mảng sau khi đã sắp xếp xong.

import java.util.Scanner;

public class BubbleSort {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhập vào số phần tủ của mảng");
        int n = sc.nextInt();

        int[] arr = new int[n];
        for (int i = 0; i < n; i++) {
            System.out.printf("Nhập giá trị cho phần tử thứ %d%n", i + 1);
            arr[i] = sc.nextInt();
        }

        bubbleSort(arr);
    }

    public static void bubbleSort(int[] arr) {
        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    Common.swap(arr, j, j + 1);
                }
            }

            System.out.printf("Sau bước %d: ", i + 1);
            Common.printArray(arr);
        }
    }
}
