package ss9.service.impl;

import ss9.model.Classroom;
import ss9.repository.IClassroomRepository;
import ss9.repository.impl.ClassroomRepository;
import ss9.service.IClassroomService;

import java.util.List;

public class ClassroomService implements IClassroomService {
    private IClassroomRepository classroomRepository = new ClassroomRepository();


    @Override
    public List<Classroom> getAll() {
        return classroomRepository.findAll();
    }
}
