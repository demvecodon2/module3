package ss9.repository;

import ss9.model.Student;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {

    @Override
    public List<Student> getAll() {
        List<Student> students = new ArrayList<>();
        String query = "SELECT * FROM student_managements"; // Kiểm tra tên bảng
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Student student = new Student();
                student.setId(resultSet.getInt("id"));
                student.setName(resultSet.getString("name"));
                student.setAddress(resultSet.getString("address"));
                students.add(student);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi khi lấy danh sách sinh viên: " + e.getMessage());
        }
        return students;
    }


    @Override
    public void save(Student student) {
        String query = "INSERT INTO student_managements (name, address) VALUES (?, ?)";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, student.getName());
            statement.setString(2, student.getAddress());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Lỗi khi lưu sinh viên: " + e.getMessage());
        }
    }

    @Override
    public void update(Student student) {
        String query = "UPDATE student_managements SET name = ?, address = ? WHERE id = ?";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, student.getName());
            statement.setString(2, student.getAddress());
            statement.setInt(3, student.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Lỗi khi cập nhật sinh viên: " + e.getMessage());
        }
    }

    @Override
    public void deleteById(int id) {
        String query = "DELETE FROM student_managements WHERE id = ?";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Lỗi khi xóa sinh viên: " + e.getMessage());
        }
    }

    @Override
    public Student getById(int id) {
        Student student = null;
        String query = "SELECT * FROM student_managements WHERE id = ?";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                student = new Student();
                student.setId(resultSet.getInt("id"));
                student.setName(resultSet.getString("name"));
                student.setAddress(resultSet.getString("address"));
            }
        } catch (SQLException e) {
            System.out.println("Lỗi khi lấy sinh viên theo ID: " + e.getMessage());
        }
        return student;
    }


    @Override
    public List<Student> searchByName(String name) {
        List<Student> result = new ArrayList<>();
        if (name != null && !name.trim().isEmpty()) {
            for (Student student : getAll()) {
                if (student.getName().toLowerCase().contains(name.toLowerCase())) {
                    result.add(student);
                }
            }
        }
        return result;
    }
}
