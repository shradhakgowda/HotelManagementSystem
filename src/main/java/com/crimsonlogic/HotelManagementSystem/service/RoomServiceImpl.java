package com.crimsonlogic.HotelManagementSystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crimsonlogic.HotelManagementSystem.entity.Room;
import com.crimsonlogic.HotelManagementSystem.entity.User;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
import com.crimsonlogic.HotelManagementSystem.repository.RoomRepository;
import com.crimsonlogic.HotelManagementSystem.repository.UserRepository;

@Service
@Transactional
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomRepository roomRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public Room registerRoom(Room room) {
        return roomRepository.save(room);
    }

    @Override
    public List<Room> listAllRooms() {
        return roomRepository.findAll();
    }

    @Override
    public Room showRoomById(String roomId) {
        return roomRepository.findById(roomId).get();
    }

    @Override
    public void deleteRoom(String roomId) {
        roomRepository.deleteById(roomId);
    }

    @Override
    public void updateRoom(String roomId, Room room) throws ResourceNotFoundException {
        Room existingRoom = roomRepository.findById(roomId).orElseThrow(() -> new ResourceNotFoundException("Room not found"));
        
        // Fetch and set the user reference
        User user = userRepository.findById(room.getUser().getUserId()).orElseThrow(() -> new ResourceNotFoundException("User not found"));
        existingRoom.setUser(user);

        existingRoom.setRoomImage(room.getRoomImage());
        existingRoom.setRoomPrice(room.getRoomPrice());
        existingRoom.setRoomDesc(room.getRoomDesc());
        existingRoom.setRoomAvailability(room.getRoomAvailability());
        existingRoom.setRoomType(room.getRoomType());
        existingRoom.setHotel(room.getHotel());
        
        roomRepository.save(existingRoom);
    }
}
