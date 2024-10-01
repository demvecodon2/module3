package ss9.service;

import ss9.model.Student;
import ss9.repository.IStudentRepository;
import ss9.repository.StudentRepository;

import java.util.List;

public class StudentService implements IStudentService {
    private IStudentRepository studentRepository = new StudentRepository();

    @Override
    public List<Student> getAll() {
        return studentRepository.getAll();
    }

    @Override
    public void add(Student student) {
        if (student != null) {
            studentRepository.save(student);
        } else {
            throw new IllegalArgumentException("Sinh viên không được null");
        }
    }

    @Override
    public void update(Student student) {
        if (student != null && student.getId() > 0) {
            studentRepository.update(student);
        } else {
            throw new IllegalArgumentException("Dữ liệu sinh viên không hợp lệ");
        }
    }

    @Override
    public void deleteById(int id) {
        if (id > 0) {
            studentRepository.deleteById(id);
        } else {
            throw new IllegalArgumentException("ID sinh viên không hợp lệ");
        }
    }

    @Override
    public Student getById(int id) {
        if (id > 0) {
            return studentRepository.getById(id);
        } else {
            throw new IllegalArgumentException("ID sinh viên không hợp lệ");
        }
    }

    @Override
    public List<Student> searchByName(String name) {
        if (name != null && !name.trim().isEmpty()) {
            return studentRepository.searchByName(name);
        } else {
            throw new IllegalArgumentException("Tên tìm kiếm không hợp lệ");
        }
    }
}
