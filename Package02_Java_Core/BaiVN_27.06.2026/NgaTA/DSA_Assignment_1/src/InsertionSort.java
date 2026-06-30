//Exersice 1: Viết một chương trình thực hiện các công việc sau:
//Cho phép người dùng nhập vào N phần tử của mảng
//Sau đó nhập vào giá trị cho mảng
//Thực hiện sắp xếp mảng tăng dần sử dụng Insertion Sort và in ra giá trị của mảng sau mỗi bước
//In ra mảng sau khi đã sắp xếp xong.

import java.util.Scanner;

public class InsertionSort {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the size of the array");
        int n = sc.nextInt();

        System.out.println("Enter the elements of the array");
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) {
            arr[i] = sc.nextInt();
        }

        insertionSort(arr);

        System.out.println("Array after sorting:");
        Common.printArray(arr);
    }

    public static void insertionSort(int[] arr) {
        for (int i = 1; i < arr.length; i++) {
            int key = arr[i];
            int j = i - 1;

            while (j >= 0 && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }

            arr[j + 1] = key;

            System.out.println("----------------");
            System.out.println("Step " + i);
            System.out.println("Key = " + key);
            System.out.println("Insert at index = " + (j + 1));
            Common.printArray(arr);
        }
    }
}
