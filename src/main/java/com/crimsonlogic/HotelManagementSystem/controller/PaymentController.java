package com.crimsonlogic.HotelManagementSystem.controller;
//used for payment operations
//date: 14th september 2024
//shradha
import java.math.BigDecimal;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.crimsonlogic.HotelManagementSystem.entity.Bookings;
import com.crimsonlogic.HotelManagementSystem.entity.Payment;
import com.crimsonlogic.HotelManagementSystem.entity.Room;
import com.crimsonlogic.HotelManagementSystem.entity.User;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
import com.crimsonlogic.HotelManagementSystem.service.BookingsService;
import com.crimsonlogic.HotelManagementSystem.service.PaymentService;
import com.crimsonlogic.HotelManagementSystem.service.RoomService;
import com.crimsonlogic.HotelManagementSystem.service.UserService;

@Controller
@RequestMapping("/payment")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;
    
    @Autowired
    private BookingsService bookingService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private RoomService roomService;

    //fetching the payment details
    @PostMapping("/processPayment")
    public String processPayment(
            @RequestParam("cardNumber") String cardNumber,
            @RequestParam("cvv") String expiryDate,
            @RequestParam("amount") BigDecimal amount,
            @RequestParam("paymentMode") String paymentMode,
            @RequestParam("bookingId") String bookingId,
            @RequestParam("roomId") String roomId,
            @RequestParam("userId") String userId,
            HttpSession session,
            Model model) {

        // Fetch the booking, user, and room details
        Bookings booking = bookingService.showBookingById(bookingId);
        User user = userService.showUserById(userId);
        Room room = roomService.showRoomById(roomId);
        Payment payment = new Payment();
        payment.setTotalPrice(amount);
        payment.setPaymentDate(new Date());
        payment.setPaymentDate(new Date());
        payment.setBooking(booking);
        payment.setUser(user);
        payment.setRoom(room);

        // Save the payment details
        paymentService.registerPayment(payment);
        System.err.println(payment);
        // Add payment details to the model
        model.addAttribute("payment", payment);

        // Redirect to a confirmation page
        return "paymentConfirmation";
    }

//saving the paments not used 
    @PostMapping("/registerpayment")
    public Payment registerPayment(@RequestBody Payment payment) {
        return paymentService.registerPayment(payment);
    }
//listing all the payments
    @GetMapping("/listallpayments")
    public List<Payment> listAllPayments() {
        return paymentService.listAllPayments();
    }

    
    //showing  the payments based on payment id not used 
    @GetMapping("/showpaymentbyid/{paymentid}")
    public Payment showPaymentById(@PathVariable("paymentid") String paymentId) {
        return paymentService.showPaymentById(paymentId);
    }
//deleting payments for future use
    @DeleteMapping("/deletepayment/{paymentid}")
    public void deletePayment(@PathVariable("paymentid") String paymentId) {
        paymentService.deletePayment(paymentId);
    }

    //update the payment details not used currently
    @PutMapping("/updatepayment/{paymentid}")
    public void updatePayment(@PathVariable("paymentid") String paymentId, @RequestBody Payment payment) {
        try {
			paymentService.updatePayment(paymentId, payment);
		} catch (ResourceNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    
    
}
