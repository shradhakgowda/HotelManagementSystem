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
import org.springframework.web.bind.annotation.RequestParam;

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
	public String showRooms(Model model, HttpSession session, String hotelId) {
		session.setAttribute("hotelId", hotelId);
		System.out.println(hotelId);
		return "Rooms";

	}

	@GetMapping("/listallrooms")
	public String listAllRooms(Model model, HttpSession session) {
		String hotelIdAttribute = (String) session.getAttribute("hotelId");
		System.out.println(hotelIdAttribute);
		System.err.println("inside list all rooms");
		List<Room> roomList = roomService.findRoomsByHotelId(hotelIdAttribute);
		System.err.println(roomList);
		session.setAttribute("roomList", roomList);
		return "Rooms";

	}

	@GetMapping("/listallroomsInId")
	public String listAllRoomsInId(Model model, HttpSession session) {
		String bookHotel = (String) session.getAttribute("hotelIds");
		System.out.println(bookHotel);
		System.err.println("inside list all rooms");
		List<Room> roomBookList = roomService.findRoomsByHotelId(bookHotel);
		System.err.println(roomBookList);
		session.setAttribute("roomBookList", roomBookList);
		return "exploreHotelRooms";

	}

	// redirecting to room form
	@GetMapping("/showroomdirect")
	public String registerRoom(Model model, HttpSession session, String hotelId) {
		String hotelId1 = (String) session.getAttribute("hotelId");
		System.out.println(hotelId1);
		return "addroomform";
	}

	// redirecting to room registering
	@PostMapping("/addrooms")
	public String registernewroom(@ModelAttribute Room room, HttpSession session) {
		String hotelIdAttribute = (String) session.getAttribute("hotelId");
		System.out.println(hotelIdAttribute);
		Hotel hotel = hotelService.showHotelById(hotelIdAttribute);
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

	@PostMapping("/updateRoom")
	public String updateRoom(@RequestParam("roomId") String roomId, @RequestParam("roomImage") String roomImage,
			@RequestParam("roomPrice") Double roomPrice, @RequestParam("roomDesc") String roomDesc,
			@RequestParam("roomAvailability") Integer roomAvailability, @RequestParam("roomType") String roomType,@RequestParam("roomReservation") String roomReservation) {

		Room room = roomService.showRoomById(roomId);
		if (room != null) {
			room.setRoomImage(roomImage);
			room.setRoomPrice(roomPrice);
			room.setRoomDesc(roomDesc);
			room.setRoomAvailability(roomAvailability);
			room.setRoomType(roomType);
			room.setRoomReservation(roomReservation);

			try {
				roomService.updateRoom(roomId, room);
			} catch (ResourceNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return "redirect:/rooms/listallrooms";
	}
//user room pages
	@GetMapping("/showexploreroom")
	public String showExploreRooms(Model model, HttpSession session, String hotelIds) {
		session.setAttribute("hotelIds", hotelIds);
		System.err.println(hotelIds);

		return "redirect:/rooms/listallroomsInId";

	}
	
	// redirecting to room form
	@GetMapping("/showeditRoom")
	public String showEditRoom(Model model, HttpSession session, String roomId) {
		 session.setAttribute("roomId", roomId);
		System.out.println();
		return "redirect:/rooms/editRoomForm";
	}
	
	
   //showing edit room form
    @GetMapping("/editRoomForm")
    public String showEditRoomForm(HttpSession session, Model model) {
        String roomId = (String) session.getAttribute("roomId");
            Room room = roomService.showRoomById(roomId);
                model.addAttribute("room", room);
                return "editRoom"; 
            
    }
	

}
