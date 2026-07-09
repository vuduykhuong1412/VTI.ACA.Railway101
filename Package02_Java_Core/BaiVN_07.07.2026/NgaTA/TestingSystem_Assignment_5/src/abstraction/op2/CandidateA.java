package abstraction.op2;

public class CandidateA extends Candidate {
    public CandidateA(String id, String name, String address, int priority) {
        super(id, name, address, priority);
    }

    @Override
    public String getBlock(){
        return "Khối A - Toán, Lý, Hóa";
    }
}
