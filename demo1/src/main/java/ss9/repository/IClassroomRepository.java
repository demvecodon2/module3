package ss9.repository;

import ss9.model.Classroom;

import java.util.List;

public interface IClassroomRepository {


    List<Classroom> findAll();
}
