<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
 <link rel="icon" href=
"https://th.bing.com/th/id/OIP.ASeikKXEBMru4liz-FdN8QHaHa?w=183&h=183&c=7&r=0&o=5&dpr=1.5&pid=1.7" />
<title>
Luxe Hotels</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        .form-control {
            padding-left: 2.5rem;
        }
        .input-group-text {
            width: 2.5rem;
            text-align: center;
        }
        .invalid-feedback {
            display: none;
            color: red;
        }
               .card {
            width: 550px; /* Adjust the width as needed */
            margin: 10px auto; /* Center the card and add some margin */
            padding: 15px; /* Add some padding inside the card */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */
            border-radius: 8px; /* Round the corners */
            background-color: rgba(255, 255, 255, 0.8); 
        }

        body {
    background-image: url('https://images.pexels.com/photos/1178994/pexels-photo-1178994.jpeg?auto=compress&cs=tinysrgb&w=600');
    background-size: cover; /* Cover the entire page */
    background-repeat: no-repeat; /* Prevent image repetition */
    background-attachment: fixed; /* Fix the background image */
}

.navbar {
	background-color: #2eb14c; /* Green background */
}

.navbar-brand img {
	height: 40px; /* Adjust the height as needed */
}

.navbar-light .navbar-nav .nav-link {
	color: #ffffff; /* White text color */
}

.navbar-light .navbar-nav .nav-link:hover {
	color: #d4edda; /* Light green color for hover effect */
}

.navbar-light .navbar-nav .nav-item.active .nav-link {
	color: #ffffff; /* Active link color */
}
/* Footer CSS */
.footer {
	/* Light grey background */
	padding: 40px 0;
	background-color: rgba(0, 0, 0, 0);
}

.review-card {
	margin-bottom: 20px;
	
}

.footer .container {
	max-width: 1200px;
	
}
        
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light">
		<a class="navbar-brand" href="#"> <img
			src="https://img.freepik.com/premium-vector/hotel-logo-simple-illustration_434503-736.jpg?w=2000"
			alt="Logo">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="">Luxe Hotels
						<span class="sr-only">(current)</span>
				</a></li>
							
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/users/index">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About Us</a>
				</li>
				
				
				
			</ul>
		</div>
	</nav>

    <div class="container mt-5">
        <div class="card">
            <div class="card-header">
                <h2>User Registration</h2>
            </div>
            <div class="card-body">
                <!-- Spring Form Tag -->
                <form:form action="/HotelManagementSystem/users/saveuser" method="post" modelAttribute="user" cssClass="form-horizontal" id="registrationForm">
                    
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <form:input path="userName" id="userName" cssClass="form-control" placeholder="User Name" required="true" onblur="validateUserName()"/>
                        <div class="invalid-feedback" id="userNameFeedback">User Name is required.</div>
                    </div>

                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user-tag"></i></span>
                        </div>
                        <form:select path="userRole" id="userRole" cssClass="form-control">
                            <form:option value="manager">Manager</form:option>
                            <form:option value="customer">Customer</form:option>
                        </form:select>
                    </div>

                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        </div>
                        <form:password path="userPassword" id="userPassword" cssClass="form-control" placeholder="Password" required="true" onblur="validatePassword()"/>
                        <div class="invalid-feedback" id="passwordFeedback">Password is required.</div>
                    </div>

                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        </div>
                        <input type="password" id="confirmPassword" class="form-control" placeholder="Confirm Password" required="true" onblur="validateConfirmPassword()"/>
                        <div class="invalid-feedback" id="confirmPasswordFeedback">Passwords do not match.</div>
                    </div>

                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-phone"></i></span>
                        </div>
                        <form:input path="userPhoneNo" id="userPhoneNo" cssClass="form-control" placeholder="Phone Number" required="true" type="text" onblur="validatePhoneNo()"/>
                        <div class="invalid-feedback" id="phoneNoFeedback">Phone number must be 10 digits and start with 6, 7, 8, or 9.</div>
                    </div>

                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-id-card"></i></span>
                        </div>
                        <form:input path="userIDProof" id="userIDProof" cssClass="form-control" placeholder="ID Proof" required="true" type="text" onblur="validateIDProof()"/>
                        <div class="invalid-feedback" id="idProofFeedback">ID Proof must be 16 digits.</div>
                    </div>

                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                        </div>
                        <form:input path="userEmail" id="userEmail" type="email" cssClass="form-control" placeholder="Email" required="true" onblur="validateEmail()"/>
                        <div class="invalid-feedback" id="emailFeedback">Invalid email format.</div>
                    </div>

                    <div class="form-group">
                        <button type="button" class="btn btn-primary" onclick="validateAndSubmit()">Register</button>
                    </div>

                </form:form>
            </div>
        </div>
    </div>


    
    	<!-- Footer -->
	<footer class="footer">
		<div class="container">
			<h3 class="text-center">Customer Reviews</h3>
			<div class="row">
				<div class="col-md-4">
					<div class="card review-card">
						<div class="card-body">
							<h5 class="card-title">Jane Doe</h5>
							<h6 class="card-subtitle mb-2 text-muted">Traveler</h6>
							<p class="card-text">"The hotel experience was exceptional!
								The staff was friendly and the room was spotless. I would highly
								recommend this place to anyone looking for a comfortable stay."</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card review-card">
						<div class="card-body">
							<h5 class="card-title">John Smith</h5>
							<h6 class="card-subtitle mb-2 text-muted">Business Traveler</h6>
							<p class="card-text">"Great location and excellent service.
								The amenities were top-notch and the conference facilities were
								very well-equipped. A perfect choice for business trips."</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card review-card">
						<div class="card-body">
							<h5 class="card-title">Emily Johnson</h5>
							<h6 class="card-subtitle mb-2 text-muted">Vacationer</h6>
							<p class="card-text">"We had a wonderful stay at this hotel.
								The pool and spa facilities were a highlight, and the view from
								our room was stunning. Will definitely return on our next
								visit."</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	
	
	    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Custom Validation Script -->
    <script type="text/javascript">
    function validateUserName() {
        var userName = document.getElementById("userName").value;
        var feedback = document.getElementById("userNameFeedback");
        var regex = /^[A-Za-z\s]{5,40}$/; // Regular expression to match only letters and spaces, with length between 10 and 40

        if (userName.trim() === "" || !regex.test(userName)) {
            feedback.style.display = "block";
            feedback.innerText = "Username must be between 5 and 40 characters long and contain only letters and spaces.";
            return false;
        } else {
            feedback.style.display = "none";
            return true;
        }
    }

    function validatePassword() {
        var password = document.getElementById("userPassword").value;
        var feedback = document.getElementById("passwordFeedback");
        var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$/; // Regular expression for password validation

        if (password.trim() === "" || !regex.test(password)) {
            feedback.style.display = "block";
            feedback.innerText = "Password must be at least 8 characters long, contain one lowercase letter, one uppercase letter, and one number.";
            return false;
        } else {
            feedback.style.display = "none";
            return true;
        }
    }


    function validateConfirmPassword() {
        var password = document.getElementById("userPassword").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        var feedback = document.getElementById("confirmPasswordFeedback");
        if (password !== confirmPassword) {
            feedback.style.display = "block";
            return false;
        } else {
            feedback.style.display = "none";
            return true;
        }
    }

    function validatePhoneNo() {
        var phoneNo = document.getElementById("userPhoneNo").value;
        var feedback = document.getElementById("phoneNoFeedback");
        if (!/^[6789]\d{9}$/.test(phoneNo)) {
            feedback.style.display = "block";
            return false;
        } else {
            feedback.style.display = "none";
            return true;
        }
    }

    function validateIDProof() {
        var idProof = document.getElementById("userIDProof").value;
        var feedback = document.getElementById("idProofFeedback");
        if (!/^\d{16}$/.test(idProof)) {
            feedback.style.display = "block";
            return false;
        } else {
            feedback.style.display = "none";
            return true;
        }
    }

    function validateEmail() {
        var email = document.getElementById("userEmail").value;
        var feedback = document.getElementById("emailFeedback");
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        var domainPattern = /\.com$/;

        if (!emailPattern.test(email) || !domainPattern.test(email)) {
            feedback.style.display = "block";
            return false;
        } else {
            feedback.style.display = "none";
            return true;
        }
    }

    function validateAndSubmit() {
        var isValid = validateUserName() & validatePassword() & validateConfirmPassword() & validatePhoneNo() & validateIDProof() & validateEmail();
        if (isValid) {
            document.getElementById("registrationForm").submit();
        }
    }
    </script>
</body>
</html>
