package ex5_inheritance.q4;

public class Book extends Document {
    private String author;
    private int pageNumber;

    public Book(String id, String publisher, int releaseNumber, String author, int pageNumber) {
        super(id, publisher, releaseNumber);
        this.author = author;
        this.pageNumber = pageNumber;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    @Override
    public String toString() {
        return "Book{" +
                "author='" + author + '\'' +
                ", pageNumber=" + pageNumber +
                '}';
    }
}
