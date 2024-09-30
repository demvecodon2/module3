package ss9.service;


import ss9.model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> getAll();

    void add(Student student);

    void deleteById(int id);

    void update(Student updatedStudent);

    List<Student> searchByName(String searchTerm);

    Student getById(int id);
}
