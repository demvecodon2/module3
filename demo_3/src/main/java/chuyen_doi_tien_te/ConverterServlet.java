package chuyen_doi_tien_te;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ConverterServlet", value = "/convert")
public class ConverterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       float rate = Float.parseFloat(request.getParameter("rate"));
       float usd = Float.parseFloat(request.getParameter("usd"));
       float vnd = rate * usd;
       PrintWriter writer = response.getWriter();
       writer.print("<html>");
       writer.print("<h1>Rate :>"+rate+"</h1>");
       writer.print("<h2>usd:>"+usd+"</h2>");
       writer.print("<h3>vnd:>"+vnd+"</h3>");
       writer.print("</html>");
    }
}
