/*
 * @author Rimsha (230000)
 * @Lab No 04
 */
package com.example.myfirstjavawebapp.dao;

import com.example.myfirstjavawebapp.model.User;
import java.util.List;

public interface UserDAO {
    List<User> getAllUsers();
    void saveUser(User user);
}
