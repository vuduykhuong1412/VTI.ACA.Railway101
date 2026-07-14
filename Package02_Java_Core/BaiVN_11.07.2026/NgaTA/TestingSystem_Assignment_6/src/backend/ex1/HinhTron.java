package backend.ex1;

public class HinhTron extends HinhHoc {
    private double r;

    public HinhTron(double r)
            throws HinhHocException {
        super();
        this.r = r;
    }

    @Override
    public double chuVi() {
        return 2 * Math.PI * r;
    }

    @Override
    public double dienTich() {
        return Math.PI * r * r;
    }
}
