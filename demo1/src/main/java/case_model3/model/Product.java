package case_model3.model;

public class Product {
    private int product_id;
    private String product_name;
    private int product_price;
    private String product_description;
    private String product_image;
    private int category_id;
    public Product() {}
    public Product(int product_id, String product_name, int product_price, String product_description, String product_image) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_price = product_price;
        this.product_description = product_description;
        this.product_image = product_image;
        this.category_id = 1;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getProduct_price() {
        return product_price;
    }

    public void setProduct_price(int product_price) {
        this.product_price = product_price;
    }

    public String getProduct_image() {
        return product_image;
    }

    public void setProduct_image(String product_image) {
        this.product_image = product_image;
    }

    public String getProduct_description() {
        return product_description;
    }

    public void setProduct_description(String product_description) {
        this.product_description = product_description;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }
}
