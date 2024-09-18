package com.crimsonlogic.HotelManagementSystem.service;
//interface for hotelServiceImpl class
//name :shradha
//date :12th september 2024
import java.util.List;

import com.crimsonlogic.HotelManagementSystem.entity.Hotel;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;

public interface HotelService {
    public Hotel registerHotel(Hotel hotel);
    public List<Hotel> listAllHotels();
    public Hotel showHotelById(String hotelId);
    public void deleteHotel(String hotelId);
    public void updateHotel(String hotelId, Hotel hotel) throws ResourceNotFoundException;
    //public List<Hotel> findHotelsByLocation(String location);
	public List<Hotel> getHotelsByLocation(String location);
}

