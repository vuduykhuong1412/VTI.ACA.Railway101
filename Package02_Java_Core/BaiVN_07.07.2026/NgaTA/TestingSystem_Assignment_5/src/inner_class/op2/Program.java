package inner_class.op2;

public class Program {

    public static void main(String[] args) {

        Car car = new Car("Mazda", "8WD");

        Car.Engine engine = car.new Engine("Crysler");

        System.out.println("Car Name: " + car.getName());
        System.out.println("Car Type: " + car.getType());
        System.out.println("Engine Type: " + engine.getEngineType());
    }
}