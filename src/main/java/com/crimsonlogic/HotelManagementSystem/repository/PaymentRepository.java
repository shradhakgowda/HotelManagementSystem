package com.crimsonlogic.HotelManagementSystem.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.HotelManagementSystem.entity.Payment;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, String> {
}
