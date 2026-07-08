public class HinhChuNhat {

    protected float chieuDai;
    protected float chieuRong;

    public HinhChuNhat(float chieuDai, float chieuRong) {
        this.chieuDai = chieuDai;
        this.chieuRong = chieuRong;
    }

    public void tinhChuVi() {
        System.out.println("Tính chu vi theo Hình Chữ Nhật");
        System.out.println("Chu vi = " + (chieuDai + chieuRong) * 2);
    }

    public void tinhDienTich() {
        System.out.println("Tính diện tích theo Hình Chữ Nhật");
        System.out.println("Diện tích = " + (chieuDai * chieuRong));
    }
}