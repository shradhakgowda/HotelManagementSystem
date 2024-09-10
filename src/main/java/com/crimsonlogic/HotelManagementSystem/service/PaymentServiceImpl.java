package com.crimsonlogic.HotelManagementSystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crimsonlogic.HotelManagementSystem.entity.Payment;
import com.crimsonlogic.HotelManagementSystem.entity.User;
import com.crimsonlogic.HotelManagementSystem.entity.Room;
import com.crimsonlogic.HotelManagementSystem.entity.Bookings;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
import com.crimsonlogic.HotelManagementSystem.repository.BookingRepository;
import com.crimsonlogic.HotelManagementSystem.repository.PaymentRepository;
import com.crimsonlogic.HotelManagementSystem.repository.UserRepository;
import com.crimsonlogic.HotelManagementSystem.repository.RoomRepository;

@Service
@Transactional
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoomRepository roomRepository;

    @Autowired
    private BookingRepository bookingsRepository;

    @Override
    public Payment registerPayment(Payment payment) {
        return paymentRepository.save(payment);
    }

    @Override
    public List<Payment> listAllPayments() {
        return paymentRepository.findAll();
    }

    @Override
    public Payment showPaymentById(String paymentId) {
        return paymentRepository.findById(paymentId).get();
    }

    @Override
    public void deletePayment(String paymentId) {
        paymentRepository.deleteById(paymentId);
    }

    @Override
    public void updatePayment(String paymentId, Payment payment) throws ResourceNotFoundException {
        Payment existingPayment = paymentRepository.findById(paymentId).orElseThrow(() -> new ResourceNotFoundException("Payment not found"));

        // Fetch and set the user reference
        User user = userRepository.findById(payment.getUser().getUserId()).orElseThrow(() -> new ResourceNotFoundException("User not found"));
        existingPayment.setUser(user);

        // Fetch and set the room reference
        Room room = roomRepository.findById(payment.getRoom().getRoomId()).orElseThrow(() -> new ResourceNotFoundException("Room not found"));
        existingPayment.setRoom(room);

        // Fetch and set the booking reference
        Bookings booking = bookingsRepository.findById(payment.getBooking().getBookingId()).orElseThrow(() -> new ResourceNotFoundException("Booking not found"));
        existingPayment.setBooking(booking);

        existingPayment.setRoomPrice(payment.getRoomPrice());
        existingPayment.setTotalPrice(payment.getTotalPrice());

        paymentRepository.save(existingPayment);
    }
}

