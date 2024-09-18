package com.crimsonlogic.HotelManagementSystem.controller;


//date:14the sep 2024
//name:shradha
//the user 
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
import com.crimsonlogic.HotelManagementSystem.entity.Payment;
import com.crimsonlogic.HotelManagementSystem.entity.User;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
import com.crimsonlogic.HotelManagementSystem.service.PaymentService;
import com.crimsonlogic.HotelManagementSystem.service.UserService;
//used to manager both admin and user details and show the respective pages in navigation bar
@Controller
@RequestMapping("/users")
public class UserController {
	private static final Logger LOG = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserService userService;


	@Autowired
	private PaymentService paymentService;

	//showing the home page
	@GetMapping("/index")
	public String showFormindex(Model theModel) {
		LOG.debug("inside show customer-form handler method");
		return "index";
	}

	//showing the login page
	@GetMapping("/loginpage")
	public String showFormlogin(Model theModel) {
		LOG.debug("inside show customer-form handler method");
		return "login";
	}

	//listing all the uses
	@GetMapping("/listallusers")
	public List<User> listAllUsers() {
		return userService.listAllUsers();
	}

	//getting user bases on id
	@GetMapping("/showuserbyid/{userid}")
	public User showUserById(@PathVariable("userid") String userId) {
		return userService.showUserById(userId);
	}

	//redirecting to explore hotels from navbar
	@GetMapping("/exploreHotel")
	public String showExploreHotelPage(Model theModel) {
		LOG.debug("inside show explore hotel handler method");
		return "exploreHotels";
	}

	// show bookings for users
	@GetMapping("/showyourBooking")
	public String showYourBookingPage(Model theModel) {
		LOG.debug("inside booking  handler method");

		return "redirect:/booking/listAllBookingByUserId";
	}

	// show payments for users
	@GetMapping("/showyourPayments")
	public String showYourPaymentPage(Model theModel, HttpSession session) {
		String userId2 = (String) session.getAttribute("userId");
		List<Payment> paymentDetails = paymentService.listAllPaymentsByUserId(userId2);
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

	// redirecting to list of booking of managers
	@GetMapping("/listManagerBookings")
	public String showManagerBookingPage(Model theModel) {
		LOG.debug("inside payment handler method");
		return "redirect:/booking/listallbooking";
	}

	// redirect to manager payments
	@GetMapping("/listManagerPayment")
	public String showManagerPaymentPage(Model theModel, HttpSession session) {
		LOG.debug("inside  manager payment handler method");
		List<Payment> paymentDetails1 = paymentService.listAllPayments();
		session.setAttribute("paymentDetails1", paymentDetails1);
		return "managerPayment";
	}

//submitting login details and redirecting
	@PostMapping("/login")
	public String loginUser(@RequestParam("userName") String userName,
			@RequestParam("userPassword") String userPassword, Model model, HttpSession session) {
		User user = userService.findByUserName(userName);

		if (user != null && user.getUserPassword().equals(userPassword)) {
			String role = user.getUserRole();

			if ("manager".equals(role)) {
				return "manager";
			} else if ("customer".equals(role)) {
				session.setAttribute("userObject", user);
				String userId = user.getUserId();
				LOG.debug(userId);
				session.setAttribute("userId", userId);
				return "customer";
			} else {
				model.addAttribute("error", "Unknown role");
				return "login";
			}
		} else {
			model.addAttribute("error", "Invalid username or password");
			return "login";
		}
	}

//  showing about us  page
	@GetMapping("/aboutUs")
	public String showABoutUsPage(Model theModel) {
		LOG.debug("inside show about us  page method");
		User theUser = new User();
		theModel.addAttribute("user", theUser);
		return "aboutUs";
	}

	// updating user details not used
	@PutMapping("/updateuser/{userid}")
	public void updateUser(@PathVariable("userid") String userId, @RequestBody User user) {
		try {
			userService.updateUser(userId, user);
		} catch (ResourceNotFoundException e) {
			e.printStackTrace();
		}
	}

}
