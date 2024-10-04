package ss9.controller;

import ss9.DTO.StudentDTO;
import ss9.model.Classroom;
import ss9.model.Student;
import ss9.service.IClassroomService;
import ss9.service.IStudentService;
import ss9.service.impl.ClassroomService;
import ss9.service.impl.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "studentController", value = "/students")
public class StudentController extends HttpServlet {
    private static final String ACTION_CREATE = "create";
    private static final String ACTION_EDIT = "edit";
    private static final String ACTION_DELETE = "delete";
    private static final String ACTION_SEARCH = "search";

    private final IStudentService studentService = new StudentService();
    private final IClassroomService classroomService = new ClassroomService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if (action == null) action = "";

        try {
            switch (action) {
                case ACTION_CREATE:
                    List<Classroom> classrooms = classroomService.getAll();
                    req.setAttribute("classrooms", classrooms);
                    req.getRequestDispatcher("/view/create.jsp").forward(req, resp);
                    break;

                case ACTION_EDIT:
                    int id = Integer.parseInt(req.getParameter("id"));
                    Student student = studentService.getById(id);
                    req.setAttribute("student", student);
                   req.getRequestDispatcher("/view/update.jsp").forward(req, resp);
                    break;

                case ACTION_SEARCH:
                    String phone = req.getParameter("phone");
                    String name = req.getParameter("name");
                    List<Student> searchResults = studentService.searchByPhoneAndName(phone, name);
                    req.setAttribute("students", searchResults);
                    req.setAttribute("nameClass", "students");
                    req.getRequestDispatcher("/view/studentList.jsp").forward(req, resp);
                    break;

                default:
                    List<StudentDTO> students = studentService.getAllDTO();
                    req.setAttribute("students", students);
                    req.setAttribute("nameClass", "c0o23");
                    req.getRequestDispatcher("/view/studentList.jsp").forward(req, resp);
                    break;
            }
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid student ID");
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if (action == null) action = "";

        try {
            switch (action) {
                case ACTION_CREATE:
                    String name = req.getParameter("name");
                    String address = req.getParameter("address");
                    String age = req.getParameter("age");
                    String phone = req.getParameter("phone");
                    Student student = new Student(name, address, age, phone);
                    studentService.add(student);
                    resp.sendRedirect(req.getContextPath() + "/students");
                    break;

                case ACTION_EDIT:
                    int id = Integer.parseInt(req.getParameter("id"));
                    String updatedName = req.getParameter("name");
                    String updatedAddress = req.getParameter("address");
                    String updatedAge = req.getParameter("age");
                    String updatedPhone = req.getParameter("phone");
                    Student updatedStudent = new Student(id, updatedName, updatedAddress, updatedAge, updatedPhone);
                    studentService.update(updatedStudent);
                    resp.sendRedirect(req.getContextPath() + "/students");
                    break;

                case ACTION_DELETE:
                    id = Integer.parseInt(req.getParameter("id"));
                    studentService.deleteById(id);
                    resp.sendRedirect(req.getContextPath() + "/students");
                    break;

                default:
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
                    break;
            }
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid student ID");
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request");
        }
    }
}
