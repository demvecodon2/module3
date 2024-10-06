package case_model3.controller;

import case_model3.model.Product;
import case_model3.service.IProductService;
import case_model3.service.Impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "demo", value = "/demo")
public class Demo {
    private static final String ACTION_CREATE = "create";
    private static final String ACTION_EDIT = "edit";
    private static final String ACTION_DELETE = "delete";
    private static final String ACTION_SEARCH = "search";
    private final IProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if (action == null) action = "";

        try {
            List<Product> products;

            switch (action) {
                case ACTION_CREATE:
                    request.getRequestDispatcher("/fruit/create.jsp").forward(request, response);
                    return;

                case ACTION_EDIT:
                    int editId = Integer.parseInt(request.getParameter("id"));
                    Product product = productService.getById(editId);
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("/fruit/edit.jsp").forward(request, response);
                    return;

                case ACTION_DELETE:
                    int deleteId = Integer.parseInt(request.getParameter("id"));
                    productService.deleteProduct(deleteId);
                    response.sendRedirect(request.getContextPath() + "/fruitshop");
                    return;

                case ACTION_SEARCH:
                    String searchKeyword = request.getParameter("keyword");
                    products = productService.searchProducts(searchKeyword);
                    break;

                default:
                    products = productService.findAllProducts();
                    break;
            }

            request.setAttribute("products", products);
            request.getRequestDispatcher("/fruit/fruit.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi.");
            request.getRequestDispatcher("/fruit/error.jsp").forward(request, response);
        }
    }
}
