package com.crimsonlogic.HotelManagementSystem.service;

import java.util.List;

import com.crimsonlogic.HotelManagementSystem.entity.Bookings;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;

public interface BookingsService {
    public Bookings registerBooking(Bookings booking);
    public List<Bookings> listAllBookings();
    public Bookings showBookingById(String bookingId);
    public void deleteBooking(String bookingId);
    public void updateBooking(String bookingId, Bookings booking) throws ResourceNotFoundException;
}
