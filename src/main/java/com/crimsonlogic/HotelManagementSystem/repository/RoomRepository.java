package com.crimsonlogic.HotelManagementSystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.HotelManagementSystem.entity.Room;

@Repository
public interface RoomRepository extends JpaRepository<Room, String> {
    List<Room> findByHotel_HotelId(String hotelId);
}
