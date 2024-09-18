package com.crimsonlogic.HotelManagementSystem.controller;
//hotels for admin controller
//date: 14th september 2024
//name :shradha
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
import com.crimsonlogic.HotelManagementSystem.service.HotelService;

@Controller
@RequestMapping("/hotels")
public class HotelController {
	private static final Logger LOG = LoggerFactory.getLogger(HotelController.class);
    @Autowired
    private HotelService hotelService;
    
//show hotel form
    @GetMapping("/hotel")
    public String showHotelPage(Model theModel) {
		LOG.debug("inside show hotel-form handler method");
		Hotel hotel = new Hotel();
		theModel.addAttribute("hotel", hotel);
        return "HotelForm"; // This should correspond to the hotel.jsp or hotel.html view
    }
 //registering  the hotel
    @PostMapping("/registerhotel")
    public String registerHotel(@ModelAttribute Hotel theHotel) {
    		System.out.println(theHotel);
    		hotelService.registerHotel(theHotel);
        return "redirect:/hotels/listallhotels";
    }

    //listing all the hotels for manager
    @GetMapping("/listallhotels")
    public String listAllHotels(Model model) {
    	List<Hotel> hotelList = hotelService.listAllHotels();
    	  model.addAttribute("hotelLists", hotelList);
    	   return "manager";
        
    }
    
//listing the hotels by id not used 
    @GetMapping("/showhotelbyid/{hotelid}")
    public Hotel showHotelById(@PathVariable("hotelid") String hotelId) {
        return hotelService.showHotelById(hotelId);
    }
//deleting the hotel not used for now
    @DeleteMapping("/deletehotel/{hotelid}")
    public void deleteHotel(@PathVariable("hotelid") String hotelId) {
        hotelService.deleteHotel(hotelId);
    }
//updating the hotel details not 
    @PutMapping("/updatehotel/{hotelid}")
    public void updateHotel(@PathVariable("hotelid") String hotelId, @RequestBody Hotel hotel) throws ResourceNotFoundException {
        hotelService.updateHotel(hotelId, hotel);
    }
}
