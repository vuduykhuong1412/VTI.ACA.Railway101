package abstraction.op2;

public class Candidate {
    private String id;
    private String name;
    private String address;
    private int priority;

    public Candidate(String id, String name, String address, int priority) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.priority = priority;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public String getBlock() {
        return "";
    }

    @Override
    public String toString() {
        return "SBD: " + id +
                ", Họ tên: " + name +
                ", Địa chỉ: " + address +
                ", Ưu tiên: " + priority;
    }
}
