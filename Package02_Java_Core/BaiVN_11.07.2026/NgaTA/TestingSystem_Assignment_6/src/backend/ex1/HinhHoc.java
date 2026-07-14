package backend.ex1;

public abstract class HinhHoc {
    // Đếm số hình
    private static int count = 0;

    public HinhHoc() throws HinhHocException {
        if (count >= Configs.SO_LUONG_HINH_TOI_DA) {
            throw new HinhHocException(
                    "Số lượng hình tối đa là: "
                            + Configs.SO_LUONG_HINH_TOI_DA);
        }

        count++;
        System.out.println("Đã tạo hình thứ "
                + count);
    }

    public abstract double chuVi();

    public abstract double dienTich();
}
