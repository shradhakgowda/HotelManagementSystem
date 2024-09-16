package com.crimsonlogic.HotelManagementSystem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crimsonlogic.HotelManagementSystem.entity.Bookings;
import com.crimsonlogic.HotelManagementSystem.entity.Hotel;
import com.crimsonlogic.HotelManagementSystem.entity.Payment;
import com.crimsonlogic.HotelManagementSystem.entity.Room;
import com.crimsonlogic.HotelManagementSystem.entity.User;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
import com.crimsonlogic.HotelManagementSystem.service.BookingsService;
import com.crimsonlogic.HotelManagementSystem.service.PaymentService;
import com.crimsonlogic.HotelManagementSystem.service.RoomService;
import com.crimsonlogic.HotelManagementSystem.service.UserService;

@Controller
@RequestMapping("/booking")
public class BookingController {

    @Autowired
    private BookingsService bookingsService;
    
    @Autowired
    private RoomService roomService;
    
    @Autowired
    private UserService userService;
    
    
    @Autowired
    private PaymentService paymentService;
    
    
    
    
    
    @GetMapping("/showroombooking")
    public String showRoomBookingPage(Model theModel,HttpSession session,String roomId)
    {
    	System.err.println("inside show booking page controller");
    	session.setAttribute("roomId1", roomId);
    	System.out.println(roomId);
    	return "bookingPage";
    }
    
    @PostMapping("/registerbooking")
    public String registerBooking(@ModelAttribute Bookings booking, HttpSession session,Model model) {
        System.err.println("inside book room page");

        // Retrieve roomId and userId from session
        String roomIdAttribute = (String) session.getAttribute("roomId1");
        System.err.println(roomIdAttribute);
        String userId1 = (String) session.getAttribute("userId");
        System.err.println(userId1);
        Room room = roomService.showRoomById(roomIdAttribute);
        
        // Fetch User object
        User user = userService.showUserById(userId1);
        
        
        // Set User in Booking object
        booking.setUser(user);
        booking.setRoom(room);
        model.addAttribute("booking", booking);

        // Register the booking and calculate the total price in the service layer
        try {
			bookingsService.registerBooking(booking, roomIdAttribute, userId1);
		} catch (ResourceNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        return "payRoom";
    }
    

//    @PostMapping("/registerbooking")
//    public String registerBooking(@ModelAttribute Bookings booking,HttpSession session) {
//    	System.err.println("inside book room page");
//    	String roomIdAttribute=(String)session.getAttribute("roomId1");
//    	System.err.println(roomIdAttribute);
//		Room room = roomService.showRoomById(roomIdAttribute);
//		String userId1=(String)session.getAttribute("userId");
//		System.err.println(userId1);
//		User user=userService.showUserById(userId1);
//		booking.setRoom(room);
//		booking.setUser(user);
//		bookingsService.registerBooking(booking);
//		
//		try {
//			roomService.updateRoomReservationStatus(roomIdAttribute, "reserved");
//		} catch (ResourceNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return "booking";
//
//    }

    @GetMapping("/listallbooking")
    public String listAllBookings(Model model, HttpSession session) {
    	System.err.println("inside booking list");
    	List<Bookings> bookList=bookingsService.listAllBookings();
    	System.out.println(bookList);
    	session.setAttribute("bookList", bookList);
        return "managerBooking";
    }
    
    
    
    @GetMapping("/listAllBookingByUserId")
    public String listAllBookingsByUserId(Model model, HttpSession session) {
    	System.err.println("inside user booking list");
    	String userID=(String)session.getAttribute("userId");
    	System.err.println(userID);
    	List<Bookings> bookList1= bookingsService.listAllBookingsByUserId(userID) ;
    	System.err.println(bookList1);
    	session.setAttribute("bookList1", bookList1);
        return "yourBooking";
    }
    

    @GetMapping("/showbookingbyid/{bookingid}")
    public Bookings showBookingById(@PathVariable("bookingid") String bookingId) {
        return bookingsService.showBookingById(bookingId);
    }

//    @DeleteMapping("/cancelBooking")
//    public void deleteBooking(@RequestParam("bookingId") String bookingId, HttpSession session) {
//        bookingsService.deleteBooking(bookingId);
//        
//    }
    
    
    @GetMapping("/cancelBooking")
    public String cancelBooking(@RequestParam("bookingId") String bookingId, HttpSession session) {
        try {
            bookingsService.cancelBookingAndUpdateRoomStatus(bookingId);
//            // Update the session attribute if needed
//            String userId2 = (String) session.getAttribute("userId");
//            System.out.println(userId2);
//            List<Payment> paymentDetails = paymentService.listAllPaymentsByUserId(userId2);
//            session.setAttribute("paymentDetails", paymentDetails);
            return "redirect:/users/showyourPayments"; // Redirect to the payment details page
        } catch (Exception e) {
            // Handle the exception and return an error page if needed
            return "redirect:/users/showyourPayments";
        }
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
