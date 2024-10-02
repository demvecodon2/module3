package ss10.repo;

import ss10.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDao {
     void insertUser(User user) throws SQLException;
     User selectUser(int id) throws SQLException;
     List<User> selectAllUsers();
     boolean updateUser(User user)throws SQLException;
     boolean deleteUser(int id) throws SQLException;
}
