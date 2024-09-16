package com.crimsonlogic.HotelManagementSystem.service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crimsonlogic.HotelManagementSystem.entity.Hotel;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
import com.crimsonlogic.HotelManagementSystem.repository.HotelRepository;

@Service
@Transactional
public class HotelServiceImpl implements HotelService {

    @Autowired
    private HotelRepository hotelRepository;

    @Override
    public Hotel registerHotel(Hotel hotel) {
        return hotelRepository.save(hotel);
    }

    @Override
    public List<Hotel> listAllHotels() {
        return hotelRepository.findAll();
    }

    @Override
    public Hotel showHotelById(String hotelId) {
        return hotelRepository.findById(hotelId).get();   }

    @Override
    public void deleteHotel(String hotelId) {
        hotelRepository.deleteById(hotelId);
    }

    @Override
    public void updateHotel(String hotelId, Hotel hotel) throws ResourceNotFoundException {
        Hotel existingHotel = hotelRepository.findById(hotelId).orElseThrow(() -> new ResourceNotFoundException("Hotel not found"));
        existingHotel.setHotelName(hotel.getHotelName());
        existingHotel.setHotelLocation(hotel.getHotelLocation());
        existingHotel.setHotelImage(hotel.getHotelImage());
        hotelRepository.save(existingHotel);
    }
    
//    @Override
//    public List<Hotel> findHotelsByLocation(String location) {
//        return hotelRepository.findByHotelLocation(location);
    
    public List<Hotel> getHotelsByLocation(String location) {
        return hotelRepository.findByHotelLocationIgnoreCaseStartingWith(location);
    }
    
}
