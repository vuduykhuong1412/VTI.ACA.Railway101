package model;

import common.enums.Sex;

public abstract class Person {
    private int id;
    private String name;
    private byte age;
    private String address;
    private Sex sex;
    private String phone;
    private String email;

    public Person() {
    }

    public Person(int id, String name, byte age, String address, Sex sex, String phone, String email) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.address = address;
        this.sex = sex;
        this.phone = phone;
        this.email = email;
    }

    public abstract void work();

    public void showInfo() {
        System.out.println(this);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public byte getAge() {
        return age;
    }

    public void setAge(byte age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Sex getSex() {
        return sex;
    }

    public void setSex(Sex sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Person{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", address='" + address + '\'' +
                ", sex=" + sex +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}

