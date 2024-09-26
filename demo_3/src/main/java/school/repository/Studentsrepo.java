package school.repository;

import school.demo.Student;

import java.util.ArrayList;
import java.util.List;

public class Studentsrepo implements IStudentsrepo {

    private List<Student> students = new ArrayList<>();

    public Studentsrepo() {
        students.add(new Student(1, "Hoàng Ngọc Hiếu", "Hà Nội"));
        students.add(new Student(2, "Nguyễn Đức Thảo Nguyên", "Hồ Chí Minh"));
        students.add(new Student(3, "Hoàng Thị Ánh Tuyết", "Đà Nẵng"));
    }

    @Override
    public List<Student> getAll() {
        return students;
    }
}
