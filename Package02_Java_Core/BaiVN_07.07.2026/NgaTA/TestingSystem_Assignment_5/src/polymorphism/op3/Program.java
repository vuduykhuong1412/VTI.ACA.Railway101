package polymorphism.op3;

public class Program {

    public static void main(String[] args) {

        HinhChuNhat hcn = new HinhChuNhat(5, 3);

        System.out.println("Chu vi: " + hcn.tinhChuVi());
        System.out.println("Diện tích: " + hcn.tinhDienTich());

        System.out.println();

        HinhVuong hv = new HinhVuong(4);

        System.out.println("Chu vi: " + hv.tinhChuVi());
        System.out.println("Diện tích: " + hv.tinhDienTich());
    }
}