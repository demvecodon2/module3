package ss9.repository;

import ss9.model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> getAll();

    void save(Student student);

    void update(Student student);

    void deleteById(int id);

    Student getById(int id);

    List<Student> searchByName(String name);
}
