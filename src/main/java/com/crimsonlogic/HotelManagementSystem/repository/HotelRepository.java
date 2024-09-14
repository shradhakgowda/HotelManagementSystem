package com.crimsonlogic.HotelManagementSystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.HotelManagementSystem.entity.Hotel;
@Repository
public interface HotelRepository extends JpaRepository<Hotel, String> {
	List<Hotel> findByHotelLocationIgnoreCaseContaining(String location);
}


