package org.example.fa.training.dto;

import java.util.Date;

public class GroupDTO {
    private short id;
    private String name;
    private Date createDate;

    public GroupDTO() {
    }

    public GroupDTO(short id, String name, Date createDate) {
        this.id = id;
        this.name = name;
        this.createDate = createDate;
    }

    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "GroupDTO [id=" + id + ", name=" + name + ", createDate=" + createDate + "]";
    }
}
