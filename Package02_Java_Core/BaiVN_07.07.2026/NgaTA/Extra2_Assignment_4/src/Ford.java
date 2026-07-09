public class Ford extends Car{
    private int year;
    private int manufactureDiscount;

    public Ford(int speed, double regularPrice, String color, int year, int manufactureDiscount) {
        super(speed, regularPrice, color);
        this.year = year;
        this.manufactureDiscount = manufactureDiscount;
    }

    @Override
    public double getSalePrice(){
        return super.getSalePrice() - manufactureDiscount;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getManufactureDiscount() {
        return manufactureDiscount;
    }

    public void setManufactureDiscount(int manufactureDiscount) {
        this.manufactureDiscount = manufactureDiscount;
    }
}
