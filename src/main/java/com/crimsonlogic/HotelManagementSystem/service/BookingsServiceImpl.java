package com.crimsonlogic.HotelManagementSystem.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crimsonlogic.HotelManagementSystem.entity.Bookings;
import com.crimsonlogic.HotelManagementSystem.entity.User;
import com.crimsonlogic.HotelManagementSystem.entity.Room;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
import com.crimsonlogic.HotelManagementSystem.repository.UserRepository;
import com.crimsonlogic.HotelManagementSystem.repository.BookingRepository;
import com.crimsonlogic.HotelManagementSystem.repository.RoomRepository;

@Service
@Transactional
public class BookingsServiceImpl implements BookingsService {

    @Autowired
    private BookingRepository bookingsRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoomRepository roomRepository;

    @Override
    public Bookings registerBooking(Bookings booking) {
        return bookingsRepository.save(booking);
    }

    @Override
    public List<Bookings> listAllBookings() {
        return bookingsRepository.findAll();
    }

    @Override
    public Bookings showBookingById(String bookingId) {
        return bookingsRepository.findById(bookingId).get();
    }

    @Override
    public void deleteBooking(String bookingId) {
        bookingsRepository.deleteById(bookingId);
    }

    @Override
    public void updateBooking(String bookingId, Bookings booking) throws ResourceNotFoundException {
        Bookings existingBooking = bookingsRepository.findById(bookingId).orElseThrow(() -> new ResourceNotFoundException("Booking not found"));

        // Fetch and set the user reference
        User user = userRepository.findById(booking.getUser().getUserId()).orElseThrow(() -> new ResourceNotFoundException("User not found"));
        existingBooking.setUser(user);

        // Fetch and set the room reference
        Room room = roomRepository.findById(booking.getRoom().getRoomId()).orElseThrow(() -> new ResourceNotFoundException("Room not found"));
        existingBooking.setRoom(room);

        existingBooking.setBookingDate(booking.getBookingDate());
        existingBooking.setBookingDateFrom(booking.getBookingDateFrom());
        existingBooking.setBookingDateTo(booking.getBookingDateTo());

        bookingsRepository.save(existingBooking);
    }
}

