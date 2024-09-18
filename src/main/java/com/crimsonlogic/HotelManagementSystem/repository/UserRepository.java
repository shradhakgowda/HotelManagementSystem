package com.crimsonlogic.HotelManagementSystem.repository;
//implement methods in user class
//name :shradha
//date :12th september 2024
import org.springframework.data.jpa.repository.JpaRepository;


import org.springframework.stereotype.Repository;

import com.crimsonlogic.HotelManagementSystem.entity.User;
@Repository
public interface UserRepository extends JpaRepository<User, String> {
	 User findByUserName(String userName);
}

