package com.crimsonlogic.HotelManagementSystem.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crimsonlogic.HotelManagementSystem.entity.Hotel;
import com.crimsonlogic.HotelManagementSystem.entity.Room;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
import com.crimsonlogic.HotelManagementSystem.service.HotelService;
import com.crimsonlogic.HotelManagementSystem.service.RoomService;

@Controller
@RequestMapping("/rooms")
public class RoomController {

    @Autowired
    private RoomService roomService;
    
    @Autowired
    private HotelService hotelService;
    
    @GetMapping("/showroom")
    public String showRooms(Model model,HttpSession session,String hotelId)
    {
    	session.setAttribute("hotelId",hotelId);
    	System.out.println(hotelId);
    	return "Rooms";
 
    }

    @GetMapping("/listallrooms")
   public String listAllRooms(Model model,HttpSession session) {
    		String hotelIdAttribute = (String) session.getAttribute("hotelId");
    		System.out.println(hotelIdAttribute);
    		System.err.println("inside list all rooms");
    		List<Room> roomList=roomService.findRoomsByHotelId(hotelIdAttribute);
    		System.err.println(roomList);
    		session.setAttribute("roomList", roomList);
    		return "Rooms";

    }
    
    @GetMapping("/listallroomsInId")
    public String listAllRoomsInId(Model model,HttpSession session) {
     		String bookHotel = (String) session.getAttribute("hotelIds");
     		System.out.println(bookHotel);
     		System.err.println("inside list all rooms");
     		List<Room> roomBookList=roomService.findRoomsByHotelId(bookHotel);
     		System.err.println(roomBookList);
     		session.setAttribute("roomBookList", roomBookList);
     		return "exploreHotelRooms";

     }

    //redirecting to room form
    @GetMapping("/showroomdirect")
    public String registerRoom(Model model,HttpSession session,String hotelId) {
    	String hotelId1 = (String) session.getAttribute("hotelId");
    	System.out.println(hotelId1);
       return "addroomform";
    }
    
    //redirecting to room registering
    @PostMapping("/addrooms")
    public String registernewroom(@ModelAttribute Room room, HttpSession session) {
    	    String hotelIdAttribute = (String) session.getAttribute("hotelId");
    	    System.out.println(hotelIdAttribute);
    	    Hotel hotel=hotelService.showHotelById(hotelIdAttribute); 
    	    room.setHotel(hotel);
    		roomService.registerRoom(room);
        return "Rooms";
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
    
    
    
    @GetMapping("/showexploreroom")
    public String showExploreRooms(Model model,HttpSession session,String hotelIds)
    {
    	session.setAttribute("hotelIds",hotelIds);
    	System.err.println(hotelIds);
    	
    	return "redirect:/rooms/listallroomsInId";
 
    }
    
    
    
    
}
