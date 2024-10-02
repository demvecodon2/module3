package case_model3.model;

public class ShoppingCartItem {
    private int id;
    private int shopping_cart_id;
    private int quantity;
    public ShoppingCartItem() {}
  public ShoppingCartItem(int id, int shopping_cart_id, int quantity) {
        this.id = id;
        this.shopping_cart_id = shopping_cart_id;
        this.quantity = quantity;
  }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getShopping_cart_id() {
        return shopping_cart_id;
    }

    public void setShopping_cart_id(int shopping_cart_id) {
        this.shopping_cart_id = shopping_cart_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
