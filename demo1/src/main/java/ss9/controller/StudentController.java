package ss9.controller;

import ss9.model.Student;
import ss9.service.IStudentService;
import ss9.service.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "studentController", value = "/students")
public class StudentController extends HttpServlet {
    private IStudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                req.getRequestDispatcher("/view/create.jsp").forward(req, resp);
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                Student student = studentService.getById(id);
                req.setAttribute("student", student);
                req.getRequestDispatcher("/view/edit.jsp").forward(req, resp);
                break;
            case "search":
                String searchTerm = req.getParameter("search");
                List<Student> searchResults = studentService.searchByName(searchTerm);
                req.setAttribute("students", searchResults);
                req.setAttribute("nameClass", "C0624G1");
                req.getRequestDispatcher("/view/studentList.jsp").forward(req, resp);
                break;
            default:
                List<Student> students = studentService.getAll();
                req.setAttribute("students", students);
                req.setAttribute("nameClass", "C0624G1");
                req.getRequestDispatcher("/view/studentList.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                String name = req.getParameter("name");
                String address = req.getParameter("address");
                Student student = new Student(name, address);
                studentService.add(student);
                resp.sendRedirect("/students");
                break;
            case "update":
                int id = Integer.parseInt(req.getParameter("id"));
                String updatedName = req.getParameter("name");
                String updatedAddress = req.getParameter("address");
                Student updatedStudent = new Student(id, updatedName, updatedAddress);
                studentService.update(updatedStudent);
                resp.sendRedirect("/students");
                break;
            case "delete":
                id = Integer.parseInt(req.getParameter("id"));
                studentService.deleteById(id);
                resp.sendRedirect("/students");
                break;
        }
    }
}
