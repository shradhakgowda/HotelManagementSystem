package com.crimsonlogic.HotelManagementSystem.service;
//used for the calculations of the user
//name :shradha
//date :12th september 2024
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crimsonlogic.HotelManagementSystem.entity.User;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
import com.crimsonlogic.HotelManagementSystem.repository.UserRepository;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public User registerUser(User user) {
        return userRepository.save(user);
    }

    @Override
    public List<User> listAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public User showUserById(String userId) {
        return  userRepository.findById(userId).get();
    }

    @Override
    public void deleteUser(String userId) {
        userRepository.deleteById(userId);
    }
    @Override
    public User findByUserName(String userName) {
        return userRepository.findByUserName(userName);
    }

    @Override
    public void updateUser(String userId, User user) throws ResourceNotFoundException {
        User existingUser = userRepository.findById(userId).orElseThrow(() -> new ResourceNotFoundException("User not found"));
        existingUser.setUserName(user.getUserName());
        existingUser.setUserRole(user.getUserRole());
        existingUser.setUserPassword(user.getUserPassword());
        existingUser.setUserPhoneNo(user.getUserPhoneNo());
        existingUser.setUserIDProof(user.getUserIDProof());
        existingUser.setUserEmail(user.getUserEmail());
        userRepository.save(existingUser);
    }
}

