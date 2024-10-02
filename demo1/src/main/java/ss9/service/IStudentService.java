package ss9.service;


import ss9.model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> getAll();

    void add(Student student);

    void deleteById(int id);

    void update(Student updatedStudent);



    Student getById(int id);

    List<Student> searchByPhoneAndName(String searchTerm);

    List<Student> searchByPhoneAndName(String phone, String name);
}
