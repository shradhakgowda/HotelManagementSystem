package com.crimsonlogic.HotelManagementSystem.service;
//used for the calculations of the room
//name :shradha
//date :12th september 2024
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crimsonlogic.HotelManagementSystem.entity.Room;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
import com.crimsonlogic.HotelManagementSystem.repository.RoomRepository;

@Service
@Transactional
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomRepository roomRepository;
//
//    @Autowired
//    private UserRepository userRepository;

	// save room
	@Override
	public Room registerRoom(Room room) {
		return roomRepository.save(room);
	}

	// list rooms
	@Override
	public List<Room> listAllRooms() {
		return roomRepository.findAll();
	}

	// find room by hotel id
	@Override
	public List<Room> findRoomsByHotelId(String hotelId) {
		return roomRepository.findByHotel_HotelId(hotelId);
	}

//show room by id
	@Override
	public Room showRoomById(String roomId) {
		return roomRepository.findById(roomId).get();
	}

	// delete the room
	@Override
	public void deleteRoom(String roomId) {
		roomRepository.deleteById(roomId);
	}

//    updating the room status when room is booked
	@Override
	public void updateRoomReservationStatus(String roomId, String status) throws ResourceNotFoundException {
		Room existingRoom = roomRepository.findById(roomId)
				.orElseThrow(() -> new ResourceNotFoundException("Room not found"));
		existingRoom.setRoomReservation(status);
		roomRepository.save(existingRoom);
	}

	@Override
	public void updateRoom(String roomId, Room room) throws ResourceNotFoundException {
		Room existingRoom = roomRepository.findById(roomId)
				.orElseThrow(() -> new ResourceNotFoundException("Room not found"));

		existingRoom.setRoomImage(room.getRoomImage());
		existingRoom.setRoomPrice(room.getRoomPrice());
		existingRoom.setRoomDesc(room.getRoomDesc());
		existingRoom.setRoomAvailability(room.getRoomAvailability());
		existingRoom.setRoomType(room.getRoomType());
		existingRoom.setHotel(room.getHotel());
		existingRoom.setRoomReservation(room.getRoomReservation());

		roomRepository.save(existingRoom);
	}
}
