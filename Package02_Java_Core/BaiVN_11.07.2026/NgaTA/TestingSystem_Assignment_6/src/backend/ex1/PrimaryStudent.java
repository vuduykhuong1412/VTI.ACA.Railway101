package backend.ex1;

public final class PrimaryStudent extends Student {

    private static int primaryCount = 0;

    public PrimaryStudent(int id, String name) {

        super(id, name);

        primaryCount++;
    }

    public static void getPrimaryCount() {
        System.out.println("Tổng thành viên Primary của group: " + primaryCount);
    }
}