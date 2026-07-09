package abstraction.op2;

import abstraction.op2.impl.TuyenSinh;

public class Program {
    public static void main(String[] args) {
        TuyenSinh tuyenSinh = new TuyenSinh();

        tuyenSinh.addCandidate(
                new CandidateA("A01", "Nguyễn Văn A", "Hà Nội", 1)
        );

        tuyenSinh.addCandidate(
                new CandidateB("B01", "Trần Thị B", "Đà Nẵng", 2)
        );

        tuyenSinh.addCandidate(
                new CandidateC("C01", "Lê Văn C", "Hồ Chí Minh", 3)
        );

        tuyenSinh.showCandidates();

        System.out.println("Tìm kiếm SBD A01:");
        tuyenSinh.findCandidateById("A01");
    }
}