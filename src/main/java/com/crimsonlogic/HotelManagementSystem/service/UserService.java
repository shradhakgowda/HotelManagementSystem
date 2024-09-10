package com.crimsonlogic.HotelManagementSystem.service;

import java.util.List;


import com.crimsonlogic.HotelManagementSystem.entity.User;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
public interface UserService {
    public User registerUser(User user);
    public List<User> listAllUsers();
    public User showUserById(String userId);
    public void deleteUser(String userId);
    public void updateUser(String userId, User user) throws ResourceNotFoundException;
}


