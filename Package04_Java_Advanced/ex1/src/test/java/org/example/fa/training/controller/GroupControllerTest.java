package org.example.fa.training.controller;

import org.example.fa.training.dto.GroupDTO;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class GroupControllerTest {

    private static GroupController controller;

    @BeforeAll
    public static void setup() {
        controller = new GroupController();
    }

    @Test
    @Order(1)
    public void testCreateGroup() {
        // Create a new group
        String groupName = "TestGroupAPI";
        
        // If it exists from previous run, delete it first
        if (controller.isGroupExistsByName(groupName)) {
            GroupDTO existing = controller.getGroupByName(groupName);
            controller.deleteGroup(existing.getId());
        }

        assertDoesNotThrow(() -> controller.createGroup(groupName));
        
        assertTrue(controller.isGroupExistsByName(groupName), "Group should exist after creation");
    }

    @Test
    @Order(2)
    public void testGetAllGroups() {
        List<GroupDTO> groups = controller.getAllGroups();
        assertNotNull(groups);
        assertFalse(groups.isEmpty(), "Groups list should not be empty");
    }

    @Test
    @Order(3)
    public void testGetGroupByName() {
        GroupDTO group = controller.getGroupByName("TestGroupAPI");
        assertNotNull(group);
        assertEquals("TestGroupAPI", group.getName());
    }

    @Test
    @Order(4)
    public void testUpdateGroup() {
        GroupDTO group = controller.getGroupByName("TestGroupAPI");
        assertNotNull(group);

        String newName = "TestGroupAPI_Updated";
        assertDoesNotThrow(() -> controller.updateGroup(group.getId(), newName));

        GroupDTO updatedGroup = controller.getGroupByID(group.getId());
        assertEquals(newName, updatedGroup.getName());
    }

    @Test
    @Order(5)
    public void testDeleteGroup() {
        GroupDTO group = controller.getGroupByName("TestGroupAPI_Updated");
        assertNotNull(group);

        assertDoesNotThrow(() -> controller.deleteGroup(group.getId()));

        assertFalse(controller.isGroupExistsByID(group.getId()), "Group should not exist after deletion");
    }

    @AfterAll
    public static void teardown() {
        // Close Hibernate session factory after tests
        org.example.fa.training.utils.HibernateUtils.getInstance().closeFactory();
    }
}
