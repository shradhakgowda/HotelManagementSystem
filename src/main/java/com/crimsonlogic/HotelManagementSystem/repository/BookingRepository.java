package com.crimsonlogic.HotelManagementSystem.repository;
//name :shradha;
//date :12th september 2024
//to load the booking jpa repositories
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.HotelManagementSystem.entity.Bookings;

@Repository
public interface BookingRepository extends JpaRepository<Bookings, String> {
	
	List<Bookings> findByUser_UserId(String userId);
	
}

