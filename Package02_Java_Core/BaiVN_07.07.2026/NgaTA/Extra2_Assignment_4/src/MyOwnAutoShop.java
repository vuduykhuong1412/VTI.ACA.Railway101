public class MyOwnAutoShop {
    public static void main(String[] args) {

        Sedan sedan = new Sedan(120, 20000, "Black", 25);

        Ford ford1 = new Ford(150, 30000, "White", 2023, 2000);
        Ford ford2 = new Ford(160, 35000, "Red", 2024, 3000);

        Car car = new Car(100, 18000, "Blue");

        System.out.println("Sedan sale price: " + sedan.getSalePrice());
        System.out.println("Ford 1 sale price: " + ford1.getSalePrice());
        System.out.println("Ford 2 sale price: " + ford2.getSalePrice());
        System.out.println("Car sale price: " + car.getSalePrice());
    }
}