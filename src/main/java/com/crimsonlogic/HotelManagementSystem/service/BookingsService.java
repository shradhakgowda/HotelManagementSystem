package com.crimsonlogic.HotelManagementSystem.service;
//interface for bookingServiceImpl class
//name :shradha
//date :15th september 2024
import java.util.List;

import com.crimsonlogic.HotelManagementSystem.entity.Bookings;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;

public interface BookingsService {
   // public Bookings registerBookings(Bookings booking);
    public List<Bookings> listAllBookings();
    public Bookings showBookingById(String bookingId);
    public void deleteBooking(String bookingId);
    public void updateBooking(String bookingId, Bookings booking) throws ResourceNotFoundException;
    public void registerBooking(Bookings booking, String roomId, String userId) throws ResourceNotFoundException ;
    public List<Bookings> listAllBookingsByUserId(String userId);
    public void cancelBookingAndUpdateRoomStatus(String bookingId);
}
