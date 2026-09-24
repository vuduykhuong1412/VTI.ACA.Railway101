package org.example.fa.training;

import org.example.fa.training.entity.Group;
import org.example.fa.training.repository.GroupRepository;
import org.example.fa.training.utils.HibernateUtils;

import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        GroupRepository repository = new GroupRepository();
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("\n============= MENU =============");
            System.out.println("1. Create Group");
            System.out.println("2. Get all Groups");
            System.out.println("3. Get Group by ID");
            System.out.println("4. Get Group by Name");
            System.out.println("5. Update Group");
            System.out.println("6. Delete Group");
            System.out.println("7. Check Group exists by ID");
            System.out.println("8. Check Group exists by Name");
            System.out.println("0. Exit");
            System.out.print("Mời bạn chọn chức năng (0-8): ");

            int choice = -1;
            try {
                choice = Integer.parseInt(scanner.nextLine());
            } catch (NumberFormatException e) {
                System.out.println("Vui lòng nhập một số hợp lệ!");
                continue;
            }

            try {
                switch (choice) {
                    case 1:
                        System.out.print("Nhập tên Group: ");
                        String name = scanner.nextLine();
                        repository.createGroup(new Group(name));
                        System.out.println("=> Tạo thành công!");
                        break;
                    case 2:
                        System.out.println("Danh sách Group:");
                        List<Group> list = repository.getAllGroups();
                        for (Group g : list) {
                            System.out.println(g);
                        }
                        break;
                    case 3:
                        System.out.print("Nhập ID: ");
                        short id = Short.parseShort(scanner.nextLine());
                        Group gById = repository.getGroupByID(id);
                        if (gById != null) {
                            System.out.println("=> Tìm thấy: " + gById);
                        } else {
                            System.out.println("=> Không tìm thấy Group nào với ID " + id);
                        }
                        break;
                    case 4:
                        System.out.print("Nhập tên Group: ");
                        String searchName = scanner.nextLine();
                        Group gByName = repository.getGroupByName(searchName);
                        if (gByName != null) {
                            System.out.println("=> Tìm thấy: " + gByName);
                        } else {
                            System.out.println("=> Không tìm thấy Group nào với tên " + searchName);
                        }
                        break;
                    case 5:
                        System.out.print("Nhập ID cần update: ");
                        short updateId = Short.parseShort(scanner.nextLine());
                        System.out.print("Nhập tên mới: ");
                        String newName = scanner.nextLine();
                        repository.updateGroup(updateId, newName);
                        System.out.println("=> Cập nhật hoàn tất!");
                        break;
                    case 6:
                        System.out.print("Nhập ID cần xoá: ");
                        short deleteId = Short.parseShort(scanner.nextLine());
                        repository.deleteGroup(deleteId);
                        System.out.println("=> Đã xoá (nếu tồn tại)!");
                        break;
                    case 7:
                        System.out.print("Nhập ID cần kiểm tra: ");
                        short checkId = Short.parseShort(scanner.nextLine());
                        System.out.println("=> Tồn tại: " + repository.isGroupExistsByID(checkId));
                        break;
                    case 8:
                        System.out.print("Nhập tên cần kiểm tra: ");
                        String checkName = scanner.nextLine();
                        System.out.println("=> Tồn tại: " + repository.isGroupExistsByName(checkName));
                        break;
                    case 0:
                        System.out.println("=> Đang thoát chương trình...");
                        HibernateUtils.getInstance().closeFactory();
                        scanner.close();
                        return;
                    default:
                        System.out.println("Vui lòng chọn từ 0 đến 8!");
                        break;
                }
            } catch (Exception e) {
                System.out.println("Lỗi: " + e.getMessage());
            }
        }
    }
}