package polymorphism.op5.impl;

import polymorphism.op5.IWeapon;

public abstract class Phone implements IWeapon {
    public void call() {
        System.out.println("Đang gọi điện thoại...");
    }

    public void receiveCall() {
        System.out.println("Đang nghe điện thoại...");
    }

    public void sendMessage() {
        System.out.println("Đang gửi tin nhắn...");
    }

    public void receiveMessage() {
        System.out.println("Đang nhận tin nhắn...");
    }
}
