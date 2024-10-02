package ss9.DTO;

public class StudentDTO {

    private int id;
    private String name;
    private String address;
    private String nameClass;

    public StudentDTO() {
    }

    public StudentDTO(int id, String name, String address) {
        this.id = id;
        this.name = name;
        this.address = address;
    }

    public StudentDTO(String name, String address) {
        this.name = name;
        this.address = address;
    }

    public StudentDTO(String name, String address, String nameClass) {
        this.name = name;
        this.address = address;
        this.nameClass = nameClass;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getNameClass() {
        return nameClass;
    }

    public void setNameClass(String nameClass) {
        this.nameClass = nameClass;
    }
}