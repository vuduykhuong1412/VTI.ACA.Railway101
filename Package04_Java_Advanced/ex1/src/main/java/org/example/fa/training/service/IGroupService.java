package org.example.fa.training.service;

import org.example.fa.training.dto.GroupDTO;
import java.util.List;

public interface IGroupService {
    void createGroup(String name);
    List<GroupDTO> getAllGroups();
    GroupDTO getGroupByID(short id);
    GroupDTO getGroupByName(String name);
    void updateGroup(short id, String newName);
    void deleteGroup(short id);
    boolean isGroupExistsByID(short id);
    boolean isGroupExistsByName(String name);
}
