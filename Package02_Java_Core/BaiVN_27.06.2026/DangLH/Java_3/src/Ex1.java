import java.util.Scanner;
import java.util.Arrays;

public class Ex1 {
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);

        // 1. Nhập số lượng phần tử N
        System.out.print("Nhập vào số lượng phần tử N của mảng: ");
        int n = scanner.nextInt();

        int[] arr = new int[n];

        // 2. Nhập giá trị từng phần tử
        for (int i = 0; i < n; i++) {
            System.out.print("Nhập phần tử thứ " + (i + 1) + ": ");
            arr[i] = scanner.nextInt();
        }

        System.out.println("\nMảng ban đầu: " + Arrays.toString(arr));
        System.out.println("--- BẮT ĐẦU SẮP XẾP (BUBBLE SORT) ---");

        // 3. Thuật toán Bubble Sort và in kết quả sau mỗi bước
        int step = 1;
        for (int i = 0; i < n - 1; i++) {
            boolean swapped = false; // Tối ưu: Kiểm tra xem vòng lặp này có hoán đổi nào không

            for (int j = 0; j < n - 1 - i; j++) {
                if (arr[j] > arr[j + 1]) {
                    // Hoán đổi arr[j] và arr[j+1]
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                    swapped = true;
                }
            }

            // In ra trạng thái mảng sau mỗi lượt quét lớn
            System.out.println("Bước " + (step++) + " (Đưa số lớn nhất về cuối): " + Arrays.toString(arr));

            // Nếu không có hoán đổi nào xảy ra, mảng đã sắp xếp xong, dừng sớm để tối ưu
            if (!swapped) {
                System.out.println("(Mảng đã ổn định ổn định sớm, dừng vòng lặp)");
                break;
            }
        }

        // 4. In kết quả cuối cùng
        System.out.println("\n=> Mảng sau khi đã sắp xếp xong: " + Arrays.toString(arr));
        scanner.close();
    }
}