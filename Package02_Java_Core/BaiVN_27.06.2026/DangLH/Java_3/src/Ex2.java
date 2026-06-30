import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

public class Ex2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ArrayList<Integer> inputList = new ArrayList<>();

        // 1. Nhập giá trị mảng liên tục cho đến khi người dùng chọn 'N'
        while (true) {
            System.out.print("Nhập giá trị cho phần tử tiếp theo: ");
            int value = scanner.nextInt();
            inputList.add(value);

            System.out.print("Bạn có muốn nhập tiếp không? (Y/N): ");
            char choice = scanner.next().trim().toUpperCase().charAt(0);

            if (choice == 'N') {
                break;
            }
        }

        // Chuyển ArrayList sang mảng int[] để dễ xử lý thuật toán sắp xếp
        int n = inputList.size();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) {
            arr[i] = inputList.get(i);
        }

        System.out.println("\nMảng ban đầu: " + Arrays.toString(arr));
        System.out.println("--- BẮT ĐẦU SẮP XẾP (SELECTION SORT) ---");

        // 2. Thuật toán Selection Sort và in kết quả sau mỗi bước
        int step = 1;
        for (int i = 0; i < n - 1; i++) {
            int minIndex = i; // Giả định phần tử đầu tiên của đoạn chưa sắp xếp là nhỏ nhất

            // Tìm phần tử nhỏ nhất trong đoạn còn lại [i+1 xuớng cuối]
            for (int j = i + 1; j < n; j++) {
                if (arr[j] < arr[minIndex]) {
                    minIndex = j; // Cập nhật chỉ số của phần tử nhỏ nhất
                }
            }

            // Hoán đổi phần tử nhỏ nhất tìm được với phần tử vị trí i
            if (minIndex != i) {
                int temp = arr[minIndex];
                arr[minIndex] = arr[i];
                arr[i] = temp;
            }

            // In ra trạng thái mảng sau mỗi bước tìm kiếm vị trí nhỏ nhất
            System.out.println("Bước " + (step++) + " (Tìm số nhỏ thứ " + (i + 1) + " đưa lên đầu): " + Arrays.toString(arr));
        }

        // 3. In kết quả cuối cùng
        System.out.println("\n=> Mảng sau khi đã sắp xếp xong: " + Arrays.toString(arr));
        scanner.close();
    }
}