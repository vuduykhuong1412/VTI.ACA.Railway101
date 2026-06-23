package model;

import java.util.ArrayList;

public class Club {
    private int id;
    private String clubName;
    private String description;
    private ArrayList<Student> members;

    public Club(){};

    public Club(int id, String clubName, String description, ArrayList<Student> members) {
        this.id = id;
        this.clubName = clubName;
        this.description = description;
        this.members = members;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getClubName() {
        return clubName;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ArrayList<Student> getMembers() {
        return members;
    }

    public void setMembers(ArrayList<Student> members) {
        this.members = members;
    }

    @Override
    public String toString() {
        return "Club{" +
                "id=" + id +
                ", clubName='" + clubName + '\'' +
                ", description='" + description + '\'' +
                ", members=" + members +
                '}';
    }

    public void addMember(Student student) {
        members.add(student);
    }

    public void organizeEvent(String eventName) {
        System.out.println(clubName + " organized event: " + eventName);
    }
}
