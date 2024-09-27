package school.demo;

public class Student {
    private int id;
    private String name;
    private String address;
    private String pount;

    public Student(int id,String name, String address, String pount) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.pount = pount;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String getPount() {
        return pount;
    }
    public void setPount(String pount) {
        this.pount = pount;
    }
}
