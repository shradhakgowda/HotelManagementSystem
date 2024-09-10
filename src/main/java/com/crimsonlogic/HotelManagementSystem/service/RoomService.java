package com.crimsonlogic.HotelManagementSystem.service;

import java.util.List;

import com.crimsonlogic.HotelManagementSystem.entity.Room;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;

public interface RoomService {
    public Room registerRoom(Room room);
    public List<Room> listAllRooms();
    public Room showRoomById(String roomId);
    public void deleteRoom(String roomId);
    public void updateRoom(String roomId, Room room) throws ResourceNotFoundException;
    //public List<Room> findRoomsByHotelName(String hotelName);
}
