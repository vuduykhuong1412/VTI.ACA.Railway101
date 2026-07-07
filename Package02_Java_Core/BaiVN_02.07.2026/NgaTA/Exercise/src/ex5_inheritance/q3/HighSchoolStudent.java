package ex5_inheritance.q3;

public class HighSchoolStudent extends Student {
    private String clazz;
    private String desiredUniversity;

    public HighSchoolStudent(String name, String id, String clazz, String desiredUniversity) {
        super(name, id);
        this.clazz = clazz;
        this.desiredUniversity = desiredUniversity;
    }

    public String getClazz() {
        return clazz;
    }

    public void setClazz(String clazz) {
        this.clazz = clazz;
    }

    public String getDesiredUniversity() {
        return desiredUniversity;
    }

    public void setDesiredUniversity(String desiredUniversity) {
        this.desiredUniversity = desiredUniversity;
    }

    @Override
    public String toString() {
        return super.toString() +  ", HighSchoolStudent{" +
                "clazz='" + clazz + '\'' +
                ", desiredUniversity='" + desiredUniversity + '\'' +
                '}';
    }
}
