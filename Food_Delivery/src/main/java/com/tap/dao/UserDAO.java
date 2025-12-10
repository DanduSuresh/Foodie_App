package com.tap.dao;

import java.util.List;
import com.tap.model.User;

public interface UserDAO {

    void addUser(User user);

    User getUser(int id);

    List<User> getAllUser();

    boolean updateUser(User user);

    User loginUser(String email, String password);

    void deleteUser(int id);

    User getUserByEmail(String email);
}
