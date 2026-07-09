package abstraction.op2;

public class CandidateB extends Candidate {
    public CandidateB(String id, String name, String address, int priority) {
        super(id, name, address, priority);
    }

    @Override
    public String getBlock() {
        return "Khối B - Toán, Hóa, Sinh";
    }
}