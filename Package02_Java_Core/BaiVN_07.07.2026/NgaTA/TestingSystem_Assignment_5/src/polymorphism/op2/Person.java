package polymorphism.op2;

import java.util.Scanner;

public class Person {
    private String name;
    private String gender;
    private String birthday;
    private String address;

    public Person() {
    }

    public Person(String name, String gender, String birthday, String address) {
        this.name = name;
        this.gender = gender;
        this.birthday = birthday;
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void inputInfo() {
        Scanner sc = new Scanner(System.in);

        System.out.print("Nhập tên: ");
        name = sc.nextLine();

        System.out.print("Nhập giới tính: ");
        gender = sc.nextLine();

        System.out.print("Nhập ngày sinh: ");
        birthday = sc.nextLine();

        System.out.print("Nhập địa chỉ: ");
        address = sc.nextLine();
    }

    public void showInfo() {
        System.out.println("Tên: " + name);
        System.out.println("Giới tính: " + gender);
        System.out.println("Ngày sinh: " + birthday);
        System.out.println("Địa chỉ: " + address);
    }
}