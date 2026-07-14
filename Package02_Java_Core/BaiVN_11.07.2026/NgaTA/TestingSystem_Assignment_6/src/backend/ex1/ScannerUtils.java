package backend.ex1;

import java.util.Scanner;

public class ScannerUtils {

    private static final Scanner scanner = new Scanner(System.in);

    public static int inputInt() {
        return scanner.nextInt();
    }

    public static double inputDouble() {
        return scanner.nextDouble();
    }

    public static String inputString() {
        scanner.nextLine();
        return scanner.nextLine();
    }
}
