package ex5_inheritance.q4;

public class Document {
    private String id;
    private String publisher;
    private int releaseNumber;

    public Document(String id, String publisher, int releaseNumber) {
        this.id = id;
        this.publisher = publisher;
        this.releaseNumber = releaseNumber;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getReleaseNumber() {
        return releaseNumber;
    }

    public void setReleaseNumber(int releaseNumber) {
        this.releaseNumber = releaseNumber;
    }

    @Override
    public String toString() {
        return "Document{" +
                "id='" + id + '\'' +
                ", publisher='" + publisher + '\'' +
                ", releaseNumber=" + releaseNumber +
                '}';
    }
}
