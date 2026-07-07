package ex5_inheritance.q4;

import java.util.ArrayList;

public class QuanLySach {
    private ArrayList<Document> documents = new ArrayList<>();

    public void addDocument(Document document) {
        documents.add(document);
    }

    public void removeDocumentById(String id) {
        documents.removeIf(p -> p.getId().equals(id));
    }

    public void showAllDocuments() {
        for (Document document : documents) {
            System.out.println(document);
        }
    }

    public void searchByType(String type) {
        for (Document document : documents) {
            if (type.equalsIgnoreCase("book") && document instanceof Book) {
                System.out.println(document);
            } else if (type.equalsIgnoreCase("magazine") && document instanceof Magazine) {
                System.out.println(document);
            } else if (type.equalsIgnoreCase("newspaper") && document instanceof Newspaper) {
                System.out.println(document);
            }
        }
    }

}
