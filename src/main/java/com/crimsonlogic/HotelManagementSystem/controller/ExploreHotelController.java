package com.crimsonlogic.HotelManagementSystem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crimsonlogic.HotelManagementSystem.entity.Hotel;
import com.crimsonlogic.HotelManagementSystem.service.HotelService;
//booking for user controller
@Controller
@RequestMapping("/exploreHotel")
public class ExploreHotelController {
	private static final Logger LOG = LoggerFactory.getLogger(HotelController.class);
    @Autowired
    private HotelService hotelService;
    
    //show explore hotel page;
    @GetMapping("/showExploreHotelPage")
    public String showHotelPage(Model theModel) {
		LOG.debug("inside show hotel-form handler method");
		
        return "exploreHotels";
    }
//    //serach hotel by name
//    @GetMapping("/searchHotels")
//    public String  getHotelsByLocation(@RequestParam String location, HttpSession session,Model model) {
//    	List<Hotel> hotels = hotelService.getHotelsByLocation(location);
//    	if (hotels.isEmpty()) {
//    	    hotels = hotelService.listAllHotels();
//    	}
//    	System.out.println(hotels);
//    	session.setAttribute("hotelsInLocation", hotels);
//    	return "exploreHotels";
//    }
    @GetMapping("/searchHotels")
    public String searchHotels(@RequestParam("location") String location, HttpSession session, Model model) {
        List<Hotel> hotels = hotelService.getHotelsByLocation(location);

        // If no hotels found for the location, fetch all hotels
        if (hotels.isEmpty()) {
            hotels = hotelService.listAllHotels();
        }

        // Store the list of hotels in the session
        session.setAttribute("hotelsInLocation", hotels);

        // Add the list of hotels to the model
        model.addAttribute("hotelsInLocation", hotels);

        return "exploreHotels";
    }
    
    
    
    
    
    
}
