    package school.servier;


    import school.demo.Student;

    import school.repository.Studentsrepo;

    import java.util.List;

    public class StudentService implements IStudents {
        static Studentsrepo studentsrepo = new Studentsrepo();

        @Override
        public List<Student> getAll() {
            return studentsrepo.getAll();
        }
    }
