package com.crimsonlogic.HotelManagementSystem.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.crimsonlogic.HotelManagementSystem.entity.Hotel;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
import com.crimsonlogic.HotelManagementSystem.service.HotelService;

@RestController
//@RequestMapping("/api/hotels")
public class HotelController {

    @Autowired
    private HotelService hotelService;

    @PostMapping("/registerhotel")
    public Hotel registerHotel(@RequestBody Hotel hotel) {
        return hotelService.registerHotel(hotel);
    }

    @GetMapping("/listallhotels")
    public List<Hotel> listAllHotels() {
        return hotelService.listAllHotels();
    }

    @GetMapping("/showhotelbyid/{hotelid}")
    public Hotel showHotelById(@PathVariable("hotelid") String hotelId) {
        return hotelService.showHotelById(hotelId);
    }

    @DeleteMapping("/deletehotel/{hotelid}")
    public void deleteHotel(@PathVariable("hotelid") String hotelId) {
        hotelService.deleteHotel(hotelId);
    }

    @PutMapping("/updatehotel/{hotelid}")
    public void updateHotel(@PathVariable("hotelid") String hotelId, @RequestBody Hotel hotel) throws ResourceNotFoundException {
        hotelService.updateHotel(hotelId, hotel);
    }
}
