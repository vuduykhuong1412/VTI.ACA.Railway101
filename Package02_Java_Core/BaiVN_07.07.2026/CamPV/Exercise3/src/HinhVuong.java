public class HinhVuong extends HinhChuNhat {

    public HinhVuong(float canh) {
        super(canh, canh);
    }

    @Override
    public void tinhChuVi() {
        System.out.println("Tính chu vi theo Hình Vuông");
        super.tinhChuVi();
    }

    @Override
    public void tinhDienTich() {
        System.out.println("Tính diện tích theo Hình Vuông");
        super.tinhDienTich();
    }
}