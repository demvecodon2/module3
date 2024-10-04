package case_model3.model;

public class ProductCategory {
 private int category_id;
 private String name;
 private String description;
 public ProductCategory() {}
 public ProductCategory(int category_id, String name, String description) {
     this.category_id = category_id;
     this.name =name;
     this.description = description;
 }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
