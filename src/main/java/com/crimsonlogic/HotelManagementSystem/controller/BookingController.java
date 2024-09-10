package com.crimsonlogic.HotelManagementSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.crimsonlogic.HotelManagementSystem.entity.Bookings;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
import com.crimsonlogic.HotelManagementSystem.service.BookingsService;

@RestController
//@RequestMapping("/api/bookings")
public class BookingController {

    @Autowired
    private BookingsService bookingsService;

    @PostMapping("/registerbooking")
    public Bookings registerBooking(@RequestBody Bookings booking) {
        return bookingsService.registerBooking(booking);
    }

    @GetMapping("/listallbookings")
    public List<Bookings> listAllBookings() {
        return bookingsService.listAllBookings();
    }

    @GetMapping("/showbookingbyid/{bookingid}")
    public Bookings showBookingById(@PathVariable("bookingid") String bookingId) {
        return bookingsService.showBookingById(bookingId);
    }

    @DeleteMapping("/deletebooking/{bookingid}")
    public void deleteBooking(@PathVariable("bookingid") String bookingId) {
        bookingsService.deleteBooking(bookingId);
    }

    @PutMapping("/updatebooking/{bookingid}")
    public void updateBooking(@PathVariable("bookingid") String bookingId, @RequestBody Bookings booking) {
        try {
			bookingsService.updateBooking(bookingId, booking);
		} catch (ResourceNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
