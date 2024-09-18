package com.crimsonlogic.HotelManagementSystem.repository;
//name :shradha;
//date :12th september 2024
//to load the payment jpa repositories

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.HotelManagementSystem.entity.Payment;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, String> {
	 List<Payment> findByUser_UserId(String userId);
	
}
