package caculator_servlet.calculator_servle;

import caculator_servlet.model.Calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/caculator")
public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            double num1 = Double.parseDouble(request.getParameter("num1"));
            double num2 = Double.parseDouble(request.getParameter("num2"));
            String operator = request.getParameter("operator");

            Calculator calculator = new Calculator();
            double result = calculator.calculate(num1, num2, operator);
            out.println("<h1>Kết quả: " + result + "</h1>");

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tham số không hợp lệ");
        } catch (ArithmeticException e) {
            out.println("<h1>Lỗi: " + e.getMessage() + "</h1>");
        } catch (IllegalArgumentException e) {
            out.println("<h1>Lỗi: " + e.getMessage() + "</h1>");
        } finally {
            out.println("<a href='index.jsp'>Quay lại</a>");
            out.close();
        }
    }
}
