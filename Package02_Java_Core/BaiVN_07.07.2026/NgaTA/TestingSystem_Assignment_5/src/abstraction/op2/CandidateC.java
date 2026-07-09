package abstraction.op2;

public class CandidateC extends Candidate {
    public CandidateC(String id, String name, String address, int priority) {
        super(id, name, address, priority);
    }

    @Override
    public String getBlock() {
        return "Khối C - Văn, Sử, Địa";
    }
}