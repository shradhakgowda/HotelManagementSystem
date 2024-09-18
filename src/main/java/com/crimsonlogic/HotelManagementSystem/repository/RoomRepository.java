package com.crimsonlogic.HotelManagementSystem.repository;
//name :shradha;
//date :12th september 2024
//to load the user jpa repositories

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.HotelManagementSystem.entity.Room;

@Repository
public interface RoomRepository extends JpaRepository<Room, String> {
    List<Room> findByHotel_HotelId(String hotelId);
}
