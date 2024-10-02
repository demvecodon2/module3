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
        String query = "SELECT * FROM student_managements";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Student student = new Student();
                student.setId(resultSet.getInt("id"));
                student.setName(resultSet.getString("name"));
                student.setAddress(resultSet.getString("address"));
                student.setAge(resultSet.getString("age"));
                student.setPhone(resultSet.getString("phone"));
                students.add(student);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi khi lấy danh sách sinh viên: " + e.getMessage());
        }
        return students;
    }

    @Override
    public void save(Student student) {
        String query = "INSERT INTO student_managements (name, address, age, phone) VALUES (?, ?, ?, ?)";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, student.getName());
            statement.setString(2, student.getAddress());
            statement.setString(3, student.getAge());
            statement.setString(4, student.getPhone());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Lỗi khi lưu sinh viên: " + e.getMessage());
        }
    }

    @Override
    public void update(Student student) {
        String query = "UPDATE student_managements SET name = ?, address = ?, age = ?, phone = ? WHERE id = ?";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, student.getName());
            statement.setString(2, student.getAddress());
            statement.setString(3, student.getAge());
            statement.setString(4, student.getPhone());
            statement.setInt(5, student.getId());

            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Cập nhật sinh viên thành công.");
            } else {
                System.out.println("Không tìm thấy sinh viên để cập nhật.");
            }
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
                student.setAge(resultSet.getString("age"));
                student.setPhone(resultSet.getString("phone"));
            }
        } catch (SQLException e) {
            System.out.println("Lỗi khi lấy sinh viên theo ID: " + e.getMessage());
        }
        return student;
    }

    @Override
    public List<Student> searchByName(String name) {
        List<Student> students = new ArrayList<>();
        String query = "SELECT * FROM student_managements WHERE name LIKE ?";

        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, "%" + name + "%");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Student student = new Student();
                student.setId(resultSet.getInt("id"));
                student.setName(resultSet.getString("name"));
                student.setAddress(resultSet.getString("address"));
                student.setAge(resultSet.getString("age"));
                student.setPhone(resultSet.getString("phone"));
                students.add(student);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi khi tìm kiếm sinh viên: " + e.getMessage());
        }

        return students;
    }

    @Override
    public List<Student> searchByPhoneAndName(String phone, String name) {
        List<Student> students = new ArrayList<>();
        StringBuilder query = new StringBuilder("SELECT * FROM student_managements WHERE 1=1");

        if (phone != null && !phone.isEmpty()) {
            query.append(" AND phone LIKE ?");
        }
        if (name != null && !name.isEmpty()) {
            query.append(" AND name LIKE ?");
        }
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query.toString())) {
            int parameterIndex = 1;
            if (phone != null && !phone.isEmpty()) {
                statement.setString(parameterIndex++, "%" + phone + "%");
            }
            if (name != null && !name.isEmpty()) {
                statement.setString(parameterIndex++, "%" + name + "%");
            }
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Student student = new Student();
                student.setId(resultSet.getInt("id"));
                student.setName(resultSet.getString("name"));
                student.setAddress(resultSet.getString("address"));
                student.setAge(resultSet.getString("age"));
                student.setPhone(resultSet.getString("phone"));
                students.add(student);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi khi tìm kiếm sinh viên theo số điện thoại và tên: " + e.getMessage());
        }

        return students;
    }
}
