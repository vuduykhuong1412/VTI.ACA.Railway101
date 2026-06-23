package model;

public class Classroom {
    private int id;
    private String classroomName;
    private int capacity;
    private int desks;
    private int chairs;

    public boolean hasEnoughSeats(int studentQuantity) {
        return studentQuantity <= capacity;
    }

    public void addDesk(int quantity) {
        desks += quantity;
    }

    public void addChair(int quantity) {
        chairs += quantity;
    }

    public Classroom(){};

    public Classroom(int id, String classroomName, int capacity, int desks, int chairs) {
        this.id = id;
        this.classroomName = classroomName;
        this.capacity = capacity;
        this.desks = desks;
        this.chairs = chairs;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getClassroomName() {
        return classroomName;
    }

    public void setClassroomName(String classroomName) {
        this.classroomName = classroomName;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getDesks() {
        return desks;
    }

    public void setDesks(int desks) {
        this.desks = desks;
    }

    public int getChairs() {
        return chairs;
    }

    public void setChairs(int chairs) {
        this.chairs = chairs;
    }

    @Override
    public String toString() {
        return "Classroom{" +
                "id=" + id +
                ", classroomName='" + classroomName + '\'' +
                ", capacity=" + capacity +
                ", desks=" + desks +
                ", chairs=" + chairs +
                '}';
    }
}
