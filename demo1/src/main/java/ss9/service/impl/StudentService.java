package ss9.service.impl;

import ss9.DTO.StudentDTO;
import ss9.model.Student;
import ss9.repository.IStudentRepository;
import ss9.repository.impl.StudentRepository;
import ss9.service.IStudentService;

import java.util.ArrayList;
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
    public List<Student> searchByPhoneAndName(String searchTerm) {
        return studentRepository.searchByPhoneAndName(searchTerm, searchTerm);
    }

    @Override
    public List<Student> searchByPhoneAndName(String phone, String name) {
        List<Student> results = studentRepository.searchByPhoneAndName(phone, name);
        return results;
    }

    @Override
    public List<StudentDTO> getAllDTO() {
        List<StudentDTO> studentDTOs = new ArrayList<>();
        for (StudentDTO student : studentDTOs) {
            studentDTOs.add(new StudentDTO(student.getId(), student.getName(), student.getAddress()));
        }
        return studentDTOs;
    }

}
