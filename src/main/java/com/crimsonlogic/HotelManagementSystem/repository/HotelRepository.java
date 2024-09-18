package com.crimsonlogic.HotelManagementSystem.repository;
//name :shradha;
//date :12th september 2024
//to load the hotel jpa repositories
import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.HotelManagementSystem.entity.Hotel;
@Repository
public interface HotelRepository extends JpaRepository<Hotel, String> {
	List<Hotel> findByHotelLocationIgnoreCaseContaining(String location);
    List<Hotel> findByHotelLocationIgnoreCaseStartingWith(String location);
}


