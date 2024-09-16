package com.crimsonlogic.HotelManagementSystem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crimsonlogic.HotelManagementSystem.entity.Bookings;
import com.crimsonlogic.HotelManagementSystem.entity.Payment;
import com.crimsonlogic.HotelManagementSystem.entity.User;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
import com.crimsonlogic.HotelManagementSystem.service.BookingsService;
import com.crimsonlogic.HotelManagementSystem.service.PaymentService;
import com.crimsonlogic.HotelManagementSystem.service.UserService;

@Controller
@RequestMapping("/users")
public class UserController {
	private static final Logger LOG = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserService userService;
	@Autowired
	private BookingsService bookService;
	
	
	@Autowired
	private PaymentService paymentService;
	
	

	@GetMapping("/index")
	public String showFormindex(Model theModel) {
		LOG.debug("inside show customer-form handler method");
		return "index";
	}
	
	
	@GetMapping("/loginpage")
	public String showFormlogin(Model theModel) {
		LOG.debug("inside show customer-form handler method");
		return "login";
	}
	@GetMapping("/listallusers")
	public List<User> listAllUsers() {
		return userService.listAllUsers();
	}

	
	
	
	@GetMapping("/showuserbyid/{userid}")
	public User showUserById(@PathVariable("userid") String userId) {
		return userService.showUserById(userId);
	}
	
	
	
	
	@GetMapping("/exploreHotel")
	public String showExploreHotelPage(Model theModel) {
		LOG.debug("inside show explore hotel handler method");
		return "exploreHotels";
	}
	
	
	
	//show bookings for users
	@GetMapping("/showyourBooking")
	public String showYourBookingPage(Model theModel) {
		LOG.debug("inside booking  handler method");
		
		
		return "redirect:/booking/listAllBookingByUserId";
	}
		
	
	//show payments for users
	
	@GetMapping("/showyourPayments")
	public String showYourPaymentPage(Model theModel,HttpSession session) {
		   String userId2 = (String) session.getAttribute("userId");
	        List<Payment> paymentDetails = paymentService.listAllPaymentsByUserId(userId2);
	        System.out.println(paymentDetails);
	        // Store payment details in the session
	        session.setAttribute("paymentDetails", paymentDetails);
		return "yourPayment";
	}
	

//    showing registration page
	@GetMapping("/registerservlet")
	public String showFormForAdd(Model theModel) {
		LOG.debug("inside show customer-form handler method");
		User theUser = new User();
		theModel.addAttribute("user", theUser);
		return "register";
	}
	
//  showing login page
	@GetMapping("/loginServlet")
	public String showLoginForm(Model theModel) {
		LOG.debug("inside show customer-form handler method");
		User theUser = new User();
		theModel.addAttribute("user", theUser);
		return "login";
	}

	// submitting registration page
	@PostMapping("/saveuser")
	public String saveUser(@ModelAttribute("user") User theUser) {
		userService.registerUser(theUser);
		return "login";
	}


	@PutMapping("/updateuser/{userid}")
	public void updateUser(@PathVariable("userid") String userId, @RequestBody User user) {
		try {
			userService.updateUser(userId, user);
		} catch (ResourceNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//redirecting to list of booking of managers
	@GetMapping("/listManagerBookings")
	public String showManagerBookingPage(Model theModel) {
		LOG.debug("inside payment handler method");
		return "redirect:/booking/listallbooking";
	}
	
	
	
	//redirect to manager payments
	@GetMapping("/listManagerPayment")
	public String showManagerPaymentPage(Model theModel,HttpSession session) {
		LOG.debug("inside payment handler method");
		 List<Payment> paymentDetails1 = paymentService.listAllPayments();
		 session.setAttribute("paymentDetails1", paymentDetails1);
		return "managerPayment";
	}
	
	
	
	

	@PostMapping("/login")
	public String loginUser(@RequestParam("userName") String userName,
	                        @RequestParam("userPassword") String userPassword,
	                        Model model,HttpSession session) {
	    // Find user by username
	    User user = userService.findByUserName(userName);
	    System.err.println(user);

	    if (user != null && user.getUserPassword().equals(userPassword)) {
	        // User is authenticated; check role and redirect accordingly
	        String role = user.getUserRole();
	        
	        if ("manager".equals(role)) {
	            return "manager";
	        } else if ("customer".equals(role)) {
	        	session.setAttribute("userObject", user);
	        	String userId=user.getUserId();
	        	System.out.println(userId);
	        	session.setAttribute("userId", userId);
	            return "customer";
	        } else {
	            // Unknown role
	            model.addAttribute("error", "Unknown role");
	            return "login";
	        }
	    } else {
	        // Authentication failed
	        model.addAttribute("error", "Invalid username or password");
	        return "login";
	    }
	}
	
	
//  showing login page
	@GetMapping("/aboutUs")
	public String showABoutUsPage(Model theModel) {
		LOG.debug("inside show customer-form handler method");
		User theUser = new User();
		theModel.addAttribute("user", theUser);
		return "aboutUs";
	}
	
	
	


}
