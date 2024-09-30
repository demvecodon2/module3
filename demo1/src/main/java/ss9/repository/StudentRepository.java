package ss9.repository;

import ss9.model.Student;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class StudentRepository implements IStudentRepository {
    private List<Student> students = new ArrayList<>();
    private int currentId = 1;

    @Override
    public List<Student> getAll() {
        return students;
    }

    @Override
    public void save(Student student) {
        student.setId(currentId++); // Assigning ID and incrementing for next student
        students.add(student);
    }

    @Override
    public void update(Student student) {
        for (int i = 0; i < students.size(); i++) {
            if (students.get(i).getId() == student.getId()) {
                students.set(i, student);
                break;
            }
        }
    }

    @Override
    public void deleteById(int id) {
        students.removeIf(student -> student.getId() == id);
    }

    @Override
    public Student getById(int id) {
        return students.stream()
                .filter(student -> student.getId() == id)
                .findFirst()
                .orElse(null);
    }

    @Override
    public List<Student> searchByName(String name) {
        return students.stream()
                .filter(student -> student.getName().toLowerCase().contains(name.toLowerCase()))
                .collect(Collectors.toList());
    }
}
