package com.crimsonlogic.HotelManagementSystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.HotelManagementSystem.entity.Room;

@Repository
public interface RoomRepository extends JpaRepository<Room, String> {
}
