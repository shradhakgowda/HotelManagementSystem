package com.crimsonlogic.HotelManagementSystem.service;
//used for the calculations of the user
//name :shradha
//date :15th september 2024
import java.time.ZoneId;

import java.time.temporal.ChronoUnit;
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
    public void registerBooking(Bookings booking, String roomId, String userId) throws ResourceNotFoundException {
        Room room = roomRepository.findById(roomId).orElseThrow(() -> new ResourceNotFoundException("Room not found"));

        // Calculate the total price
        long numberOfDays = ChronoUnit.DAYS.between(
            booking.getBookingDateFrom().toInstant().atZone(ZoneId.systemDefault()).toLocalDate(),
            booking.getBookingDateTo().toInstant().atZone(ZoneId.systemDefault()).toLocalDate()
        );
        double totalPrice = numberOfDays * room.getRoomPrice();

        // Set the total price in the booking
        booking.setRoomTotalPrice(totalPrice);

        // Save the booking
        bookingsRepository.save(booking);

        // Update room reservation status to "reserved"
        room.setRoomReservation("reserved");
        roomRepository.save(room);
    }
//list all bookings
    @Override
    public List<Bookings> listAllBookings() {
        return bookingsRepository.findAll();
    }

    //show booking by id
    @Override
    public Bookings showBookingById(String bookingId) {
        return bookingsRepository.findById(bookingId).get();
    }

    //delete booking by id not used
    @Override
    public void deleteBooking(String bookingId) {
        bookingsRepository.deleteById(bookingId);
    }

    //update booking details
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


    
    
    @Override
    public List<Bookings> listAllBookingsByUserId(String userId) {
        return bookingsRepository.findByUser_UserId(userId);
    }
    
    @Override
    public void cancelBookingAndUpdateRoomStatus(String bookingId) {
        Bookings booking = bookingsRepository.findById(bookingId).orElseThrow(() -> new RuntimeException("Booking not found"));
        Room room = booking.getRoom();
        room.setRoomReservation("not_reserved");
        roomRepository.save(room);
        bookingsRepository.deleteById(bookingId);
    }
    
    
    

    
    
}

