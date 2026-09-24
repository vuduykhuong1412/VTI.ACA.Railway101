package org.example.fa.training.controller;

import org.example.fa.training.dto.GroupDTO;
import org.example.fa.training.service.IGroupService;
import org.example.fa.training.service.impl.GroupServiceImpl;

import java.util.List;

public class GroupController {

    private IGroupService service;

    public GroupController() {
        this.service = new GroupServiceImpl();
    }

    public void createGroup(String name) {
        service.createGroup(name);
    }

    public List<GroupDTO> getAllGroups() {
        return service.getAllGroups();
    }

    public GroupDTO getGroupByID(short id) {
        return service.getGroupByID(id);
    }

    public GroupDTO getGroupByName(String name) {
        return service.getGroupByName(name);
    }

    public void updateGroup(short id, String newName) {
        service.updateGroup(id, newName);
    }

    public void deleteGroup(short id) {
        service.deleteGroup(id);
    }

    public boolean isGroupExistsByID(short id) {
        return service.isGroupExistsByID(id);
    }

    public boolean isGroupExistsByName(String name) {
        return service.isGroupExistsByName(name);
    }
}
