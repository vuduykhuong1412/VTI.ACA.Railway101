package org.example.fa.training.entity;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Date;

@Entity(name="GroupEntity")
@Table(name="`Group`")
public class Group implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "GroupID")
    private short id;

    @Column(name = "GroupName", length = 50, nullable = false, unique = true)
    private String name;

    @Column(name = "CreateDate", updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;

    // Hook tự động gán ngày hiện tại trước khi persist nếu chưa có giá trị
    @PrePersist
    public void prePersist() {
        if (createDate == null) {
            createDate = new Date();
        }
    }

    public Group() {
    }

    public Group(String name) {
        this.name = name;
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
        return "Group [id=" + id + ", name=" + name + ", createDate=" + createDate + "]";
    }
}
