package polymorphism.op5.impl;

import polymorphism.op5.IRadio;

public class ClassicPhone extends Phone implements IRadio {
    @Override
    public void listenRadio() {
        System.out.println("Điện thoại cổ điển đang nghe radio...");
    }

    @Override
    public void attack() {
        System.out.println("Dùng điện thoại cổ điển để tấn công kẻ xấu!");
    }
}
