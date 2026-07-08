import java.util.Scanner;

public class Exercise1 {

    Scanner sc = new Scanner(System.in);

    News news = new News();

    public void question1() {

        while (true) {

            System.out.println("========= MENU =========");
            System.out.println("1. Insert news");
            System.out.println("2. View list news");
            System.out.println("3. Average rate");
            System.out.println("4. Exit");
            System.out.print("Chọn: ");

            int choose = sc.nextInt();
            sc.nextLine();

            switch (choose) {

                case 1:

                    System.out.print("Title: ");
                    news.setTitle(sc.nextLine());

                    System.out.print("Publish Date: ");
                    news.setPublishDate(sc.nextLine());

                    System.out.print("Author: ");
                    news.setAuthor(sc.nextLine());

                    System.out.print("Content: ");
                    news.setContent(sc.nextLine());

                    int[] rates = new int[3];

                    for (int i = 0; i < 3; i++) {
                        System.out.print("Rate " + (i + 1) + ": ");
                        rates[i] = sc.nextInt();
                    }

                    news.setRates(rates);

                    break;

                case 2:

                    news.Display();

                    break;

                case 3:

                    news.Calculate();
                    news.Display();

                    break;

                case 4:

                    System.out.println("Thoát chương trình!");
                    return;

                default:

                    System.out.println("Lựa chọn không hợp lệ!");

            }

        }

    }

}