package org.example.fa.training.service.impl;

import org.example.fa.training.dto.GroupDTO;
import org.example.fa.training.entity.Group;
import org.example.fa.training.repository.GroupRepository;
import org.example.fa.training.service.IGroupService;

import java.util.ArrayList;
import java.util.List;

public class GroupServiceImpl implements IGroupService {

    private GroupRepository repository;

    public GroupServiceImpl() {
        this.repository = new GroupRepository();
    }

    @Override
    public void createGroup(String name) {
        if (isGroupExistsByName(name)) {
            throw new IllegalArgumentException("Tên Group đã tồn tại!");
        }
        repository.createGroup(new Group(name));
    }

    @Override
    public List<GroupDTO> getAllGroups() {
        List<Group> entities = repository.getAllGroups();
        List<GroupDTO> dtos = new ArrayList<>();
        for (Group entity : entities) {
            dtos.add(new GroupDTO(entity.getId(), entity.getName(), entity.getCreateDate()));
        }
        return dtos;
    }

    @Override
    public GroupDTO getGroupByID(short id) {
        Group entity = repository.getGroupByID(id);
        if (entity == null) {
            return null;
        }
        return new GroupDTO(entity.getId(), entity.getName(), entity.getCreateDate());
    }

    @Override
    public GroupDTO getGroupByName(String name) {
        Group entity = repository.getGroupByName(name);
        if (entity == null) {
            return null;
        }
        return new GroupDTO(entity.getId(), entity.getName(), entity.getCreateDate());
    }

    @Override
    public void updateGroup(short id, String newName) {
        if (!isGroupExistsByID(id)) {
            throw new IllegalArgumentException("Không tìm thấy Group để cập nhật!");
        }
        if (isGroupExistsByName(newName)) {
            throw new IllegalArgumentException("Tên Group mới bị trùng lặp!");
        }
        repository.updateGroup(id, newName);
    }

    @Override
    public void deleteGroup(short id) {
        if (!isGroupExistsByID(id)) {
            throw new IllegalArgumentException("Không tìm thấy Group để xoá!");
        }
        repository.deleteGroup(id);
    }

    @Override
    public boolean isGroupExistsByID(short id) {
        return repository.isGroupExistsByID(id);
    }

    @Override
    public boolean isGroupExistsByName(String name) {
        return repository.isGroupExistsByName(name);
    }
}
