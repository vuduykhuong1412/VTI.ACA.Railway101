package abstraction.op2.impl;

import abstraction.op2.Candidate;
import abstraction.op2.ITuyenSinh;

import java.util.ArrayList;

public class TuyenSinh implements ITuyenSinh {
    private ArrayList<Candidate> candidates = new ArrayList<Candidate>();

    @Override
    public void addCandidate(Candidate candidate) {
        candidates.add(candidate);
    }

    @Override
    public void showCandidates() {
        for (Candidate candidate : candidates) {
            System.out.println(candidate);
            System.out.println(candidate.getBlock());
        }
    }

    @Override
    public void findCandidateById(String id) {
        for (Candidate candidate : candidates) {
            if(candidate.getId().equalsIgnoreCase(id)) {
                System.out.println(candidate);
                System.out.println(candidate.getBlock());
                return;
            }
        }
        System.out.println("Không tìm thấy thí sinh!");
    }
}
