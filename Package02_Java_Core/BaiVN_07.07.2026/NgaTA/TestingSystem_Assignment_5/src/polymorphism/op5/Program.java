package polymorphism.op5;

import polymorphism.op5.impl.ClassicPhone;
import polymorphism.op5.impl.SmartPhone;

public class Program {
    public static void main(String[] args) {

        ClassicPhone classicPhone = new ClassicPhone();

        classicPhone.call();
        classicPhone.receiveCall();
        classicPhone.sendMessage();
        classicPhone.receiveMessage();
        classicPhone.listenRadio();
        classicPhone.attack();

        System.out.println();

        SmartPhone smartPhone = new SmartPhone();

        smartPhone.call();
        smartPhone.receiveCall();
        smartPhone.sendMessage();
        smartPhone.receiveMessage();
        smartPhone.use3G();
        smartPhone.takePhoto();
        smartPhone.attack();
    }
}
