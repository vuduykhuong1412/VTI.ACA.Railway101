public class Exercise2 {

    public void question3() {

        HinhChuNhat hcn = new HinhChuNhat(10, 5);

        System.out.println("===== HÌNH CHỮ NHẬT =====");
        hcn.tinhChuVi();
        hcn.tinhDienTich();

        System.out.println();

        HinhVuong hv = new HinhVuong(6);

        System.out.println("===== HÌNH VUÔNG =====");
        hv.tinhChuVi();
        hv.tinhDienTich();
    }
}