package backend.ex1;

public class HinhChuNhat extends HinhHoc {
    private double dai;
    private double rong;

    public HinhChuNhat(double dai,
                       double rong)
            throws HinhHocException {
        super();
        this.dai = dai;
        this.rong = rong;
    }

    @Override
    public double chuVi() {
        return (dai + rong) * 2;
    }

    @Override
    public double dienTich() {
        return dai * rong;
    }
}