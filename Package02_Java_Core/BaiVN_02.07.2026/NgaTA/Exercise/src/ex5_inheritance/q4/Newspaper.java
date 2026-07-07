package ex5_inheritance.q4;

public class Newspaper extends Document {
    private String releaseDate;

    public Newspaper(String id, String publisher, int releaseNumber, String releaseDate) {
        super(id, publisher, releaseNumber);
        this.releaseDate = releaseDate;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    @Override
    public String toString() {
        return "Newspaper{" +
                "releaseDate='" + releaseDate + '\'' +
                '}';
    }
}
