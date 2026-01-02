package com.mbti.user.model.service;

import com.mbti.user.model.dto.User;
import java.util.List;

public interface UserService {
    User login(String userName);
    User getUserById(int id);
    User getUserByUserName(String userName);
    List<User> getAllUsers();
    void deleteUser(int id);
}
