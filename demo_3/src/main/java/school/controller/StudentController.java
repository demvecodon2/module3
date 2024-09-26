package school.controller;

import school.demo.Student;
import school.repository.Studentsrepo;
import school.servier.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentController", value = "/studentList")
public class StudentController extends HttpServlet {

    private StudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> students = getAll();
        request.setAttribute("students", students);
        System.out.println("Danh sách sinh viên: " + students);
        request.getRequestDispatcher("view_students/studentList.jsp").forward(request, response);
    }

    private List<Student> getAll() {
        return studentService.getAll();
    }
}
