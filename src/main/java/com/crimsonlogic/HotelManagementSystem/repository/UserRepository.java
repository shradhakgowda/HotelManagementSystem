package com.crimsonlogic.HotelManagementSystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;


import org.springframework.stereotype.Repository;

import com.crimsonlogic.HotelManagementSystem.entity.User;
@Repository
public interface UserRepository extends JpaRepository<User, String> {
	 User findByUserName(String userName);
}

