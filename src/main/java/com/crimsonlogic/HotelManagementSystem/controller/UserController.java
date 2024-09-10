package com.crimsonlogic.HotelManagementSystem.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.crimsonlogic.HotelManagementSystem.entity.User;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
import com.crimsonlogic.HotelManagementSystem.service.UserService;

@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/registeruser")
    public User registerUser(@RequestBody User user) {
        return userService.registerUser(user);
    }

    @GetMapping("/listallusers")
    public List<User> listAllUsers() {
        return userService.listAllUsers();
    }

    @GetMapping("/showuserbyid/{userid}")
    public User showUserById(@PathVariable("userid") String userId) {
        return userService.showUserById(userId);
    }

    @DeleteMapping("/deleteuser/{userid}")
    public void deleteUser(@PathVariable("userid") String userId) {
        userService.deleteUser(userId);
    }

    @PutMapping("/updateuser/{userid}")
    public void updateUser(@PathVariable("userid") String userId, @RequestBody User user) {
        try {
			userService.updateUser(userId, user);
		} catch (ResourceNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}




