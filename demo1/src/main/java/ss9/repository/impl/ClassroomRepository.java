package ss9.repository.impl;

import ss9.model.Classroom;
import ss9.repository.IClassroomRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClassroomRepository implements IClassroomRepository {


    @Override
    public List<Classroom> findAll() {
        List<Classroom> classrooms = new ArrayList<>();
        try {
            PreparedStatement statement = BaseRepository.getConnection()
                    .prepareStatement("select * from class");
            ResultSet resultSet = statement.executeQuery();
            Classroom classroom;
            while (resultSet.next()) {
                classroom = new Classroom();
                classroom.setId(resultSet.getInt("id_class"));
                classroom.setName(resultSet.getString("name_class"));

                classrooms.add(classroom);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi hệ thống");
        }
        return classrooms;
    }
}


