package com.crimsonlogic.HotelManagementSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.crimsonlogic.HotelManagementSystem.entity.Room;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
import com.crimsonlogic.HotelManagementSystem.service.RoomService;

@RestController
//@RequestMapping("/api/rooms")
public class RoomController {

    @Autowired
    private RoomService roomService;

    @PostMapping("/registerroom")
    public Room registerRoom(@RequestBody Room room) {
        return roomService.registerRoom(room);
    }

    @GetMapping("/listallrooms")
    public List<Room> listAllRooms() {
        return roomService.listAllRooms();
    }

    @GetMapping("/showroombyid/{roomid}")
    public Room showRoomById(@PathVariable("roomid") String roomId) {
        return roomService.showRoomById(roomId);
    }

    @DeleteMapping("/deleteroom/{roomid}")
    public void deleteRoom(@PathVariable("roomid") String roomId) {
        roomService.deleteRoom(roomId);
    }

    @PutMapping("/updateroom/{roomid}")
    public void updateRoom(@PathVariable("roomid") String roomId, @RequestBody Room room)  {
        try {
			roomService.updateRoom(roomId, room);
		} catch (ResourceNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
