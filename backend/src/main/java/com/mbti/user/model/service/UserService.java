package com.mbti.user.model.service;

import com.mbti.user.model.dto.User;
import java.util.List;

public interface UserService {
    User login(String userName);
    User getUserById(int id);
    User getUserByUserName(String userName);
    List<User> getAllUsers();
    void deleteUser(int id);

    // TODO: 회원가입 메서드 추가
    // 메서드명: signup
    // 반환타입: User
    // 매개변수: String userName
    // 예외: 중복 시 IllegalArgumentException 발생
    User signup(String userName);
}
