package org.example.fa.training.repository;

import org.example.fa.training.entity.Group;
import org.example.fa.training.utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class GroupRepository {

    private HibernateUtils hibernateUtils;

    public GroupRepository() {
        hibernateUtils = HibernateUtils.getInstance();
    }

    // a. createGroups
    public void createGroup(Group group) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = hibernateUtils.openSession();
            transaction = session.beginTransaction();
            session.persist(group);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
    }

    // b. getAllGroups
    public List<Group> getAllGroups() {
        Session session = null;
        try {
            session = hibernateUtils.openSession();
            return session.createQuery("FROM GroupEntity", Group.class).list();
        } finally {
            if (session != null) session.close();
        }
    }

    // c. getGroupByID
    public Group getGroupByID(short id) {
        Session session = null;
        try {
            session = hibernateUtils.openSession();
            return session.get(Group.class, id);
        } finally {
            if (session != null) session.close();
        }
    }

    // d. getGroupByName
    public Group getGroupByName(String name) {
        Session session = null;
        try {
            session = hibernateUtils.openSession();
            String hql = "FROM GroupEntity WHERE name = :name";
            Query<Group> query = session.createQuery(hql, Group.class);
            query.setParameter("name", name);
            return query.uniqueResult();
        } finally {
            if (session != null) session.close();
        }
    }

    // e. updateGroup
    public void updateGroup(short id, String newName) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = hibernateUtils.openSession();
            transaction = session.beginTransaction();
            Group group = session.get(Group.class, id);
            if (group != null) {
                group.setName(newName);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
    }

    // f. deleteGroup
    public void deleteGroup(short id) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = hibernateUtils.openSession();
            transaction = session.beginTransaction();
            Group group = session.get(Group.class, id);
            if (group != null) {
                session.remove(group);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
    }

    // g. isGroupExistsByID
    public boolean isGroupExistsByID(short id) {
        return getGroupByID(id) != null;
    }

    // h. isGroupExistsByName
    public boolean isGroupExistsByName(String name) {
        return getGroupByName(name) != null;
    }
}
