package case_model3.controller;

import case_model3.model.Category;
import case_model3.service.IProductService;
import case_model3.service.Impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CategoryControl", urlPatterns = {"/category"})
public class    CategoryController extends HttpServlet {

    private final IProductService productService = new ProductService();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String cateID = request.getParameter("cid");

        try {
            Category category = productService.getCategoryById(cateID);

            if (category != null) {
                request.setAttribute("category_id", category.getCategoryId());
                request.setAttribute("name", category.getName());
                request.setAttribute("description", category.getDescription());
            } else {
                request.setAttribute("error", "Category not found.");
            }
            request.getRequestDispatcher("/fruit/fruit.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while retrieving data.");
            request.getRequestDispatcher("/fruit/error.jsp").forward(request, response);
        }
    }}