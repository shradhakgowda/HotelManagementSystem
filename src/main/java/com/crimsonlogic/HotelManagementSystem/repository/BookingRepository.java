package com.crimsonlogic.HotelManagementSystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.HotelManagementSystem.entity.Bookings;

@Repository
public interface BookingRepository extends JpaRepository<Bookings, String> {
}
