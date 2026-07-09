package abstraction.op1;

import abstraction.op1.impl.News;

import java.util.ArrayList;
import java.util.Scanner;

public class MyNews {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        ArrayList<News> news = new ArrayList<News>();

        boolean flag = true;
        while(flag){
            System.out.println("Enter Your Option!");
            System.out.println(
                    "1. Insert news \n" +
                    "2. View list news \n" +
                    "3. Average rate \n" +
                    "0. Exit \n"
            );
            int option = sc.nextInt();
            sc.nextLine();

            if(option==0){
                flag = false;
            }
            else {
                String title = "";
                String publishDate = "";
                String author = "";
                String content = "";
                int a;
                int b;
                int c;

                if(option==1){
                    System.out.println("Enter title");
                    title = sc.nextLine();
                    System.out.println("Enter publish date ");
                    publishDate = sc.nextLine();
                    System.out.println("Enter author");
                    author = sc.nextLine();
                    System.out.println("Enter content");
                    content = sc.nextLine();

                    int[] rates = new int[3];

                    for (int i = 0; i < rates.length; i++) {
                        System.out.println("Enter rate " + (i + 1) + ":");
                        rates[i] = sc.nextInt();
                    }

                    News n = new News(title, publishDate, author, content, rates);
                    news.add(n);

                    System.out.println("News Inserted!");
                }else if(option==2){
                    for(News n : news){
                        n.display();
                    }
                }else if(option==3){
                    for(News n : news){
                        n.calculate();
                        n.display();
                    }
                }
                else {
                    System.out.println("Invalid option!");
                    flag = false;
                }
            }

        };
    }
}
