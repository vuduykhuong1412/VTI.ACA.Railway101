package backend.ex1;

public final class SecondaryStudent extends Student {

    private static int secondaryCount = 0;

    public SecondaryStudent(int id, String name) {

        super(id, name);

        secondaryCount++;
    }

    public static void getSecondaryCount() {
        System.out.println("Tổng thành viên Primary của group: " + secondaryCount);
    }
}
