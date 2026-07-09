package polymorphism.op3;

public class HinhChuNhat {

    protected double chieuDai;
    protected double chieuRong;

    public HinhChuNhat(double chieuDai, double chieuRong) {
        this.chieuDai = chieuDai;
        this.chieuRong = chieuRong;
    }

    public double tinhChuVi() {
        System.out.println("Tính chu vi theo Hình Chữ Nhật");
        return (chieuDai + chieuRong) * 2;
    }

    public double tinhDienTich() {
        System.out.println("Tính diện tích theo Hình Chữ Nhật");
        return chieuDai * chieuRong;
    }
}