package inner_class.op1;

public class Program {

    public static void main(String[] args) {

        CPU cpu = new CPU(1500);

        CPU.Processor processor = cpu.new Processor(8, "Intel");
        CPU.Ram ram = cpu.new Ram(16, "Kingston");

        System.out.println("CPU Price: " + cpu.getPrice());

        System.out.println("Processor Cache: " + processor.getCache());

        System.out.println("RAM Clock Speed: " + ram.getClockSpeed());
    }
}
