package case_model3.service.Impl;

import case_model3.model.Product;
import case_model3.repository.IProduct;
import case_model3.repository.Impl.ProductRepository;
import case_model3.service.IProductService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {
    private static final IProduct productRepository = new ProductRepository();

    @Override
    public List<Product> findAllProducts() throws SQLException, ClassNotFoundException {
        return productRepository.findAllProducts();
    }

    @Override
    public void saveProduct(Product product) {
        productRepository.saveProduct(product);
    }

    @Override
    public void deleteProduct(int product_id) {
        productRepository.deleteProduct(product_id);
    }

    @Override
    public void updateProduct(Product product) {
        productRepository.updateProduct(product);
    }

    @Override
    public Product getById(int product_id) {
        return productRepository.getById(product_id);
    }

    @Override
    public List<Product> searchProducts(String name) throws SQLException {
        return productRepository.searchProducts(name);
    }
}
