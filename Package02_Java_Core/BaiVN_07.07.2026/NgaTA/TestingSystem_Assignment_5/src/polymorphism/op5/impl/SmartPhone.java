package polymorphism.op5.impl;

import polymorphism.op5.ISmartPhone;

public class SmartPhone extends Phone implements ISmartPhone {
    @Override
    public void use3G() {
        System.out.println("Điện thoại thông minh đang sử dụng 3G...");
    }

    @Override
    public void takePhoto() {
        System.out.println("Điện thoại thông minh đang chụp hình...");
    }

    @Override
    public void attack() {
        System.out.println("Dùng điện thoại thông minh để tấn công kẻ xấu!");
    }
}