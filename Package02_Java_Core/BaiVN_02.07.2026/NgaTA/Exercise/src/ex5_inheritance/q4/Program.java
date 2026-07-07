package ex5_inheritance.q4;

public class Program {
    public static void main(String[] args) {
        QuanLySach qls = new QuanLySach();

        qls.addDocument(new Book("B01", "NXB Kim Đồng", 1000, "Nguyễn Nhật Ánh", 250));
        qls.addDocument(new Magazine("M01", "NXB Trẻ", 500, 12, 7));
        qls.addDocument(new Newspaper("N01", "Tuổi Trẻ", 2000, "07/07/2026"));

        qls.showAllDocuments();

        System.out.println("Tìm sách:");
        qls.searchByType("book");

        System.out.println("Xóa mã M01:");
        qls.removeDocumentById("M01");

        qls.showAllDocuments();
    }
}
