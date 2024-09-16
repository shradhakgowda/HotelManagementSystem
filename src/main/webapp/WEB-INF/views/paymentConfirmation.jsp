<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="https://th.bing.com/th/id/OIP.ASeikKXEBMru4liz-FdN8QHaHa?w=183&h=183&c=7&r=0&o=5&dpr=1.5&pid=1.7" />
<title>Luxe Hotels</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
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

body {
    background-image: url('https://images.pexels.com/photos/1178994/pexels-photo-1178994.jpeg?auto=compress&cs=tinysrgb&w=600');
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
}

    .thank-you-card {
        border: 2px solid #2eb14c;
        border-radius: 10px;
        background-color: #ffffff;
        padding: 20px;
        text-align: center;
        margin-top: 50px;
    }
    .btn-custom {
        background-color: #2eb14c;
        color: #ffffff;
    }
    .btn-custom:hover {
        background-color: #1e8e39;
    }
    .btn-secondary-custom {
        background-color: #6c757d;
        color: #ffffff;
    }
    .btn-secondary-custom:hover {
        background-color: #5a6268;
    }
</style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light">
	<a class="navbar-brand" href="#"> <img src="https://img.freepik.com/premium-vector/hotel-logo-simple-illustration_434503-736.jpg?w=2000" alt="Logo"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="">Luxe Hotels<span class="sr-only"></span></a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/users/index">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="#">About Us</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/users/exploreHotel">Explore Hotels</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/users/showyourBooking">Your Bookings</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/users/showyourPayments">Your Payments</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/users/index">LogOut</a></li>
		</ul>
	</div>
</nav>

<div class="container">
    <div class="thank-you-card card mx-auto">
        <div class="card-body">
            <h2 class="card-title text-success">Thank You for Your Booking!</h2>
            <p class="card-text lead">Dear [User Name],</p>
            <p class="card-text">Thank you for choosing Luxe Hotels! We are excited to confirm your booking and look forward to hosting you. We hope you have a wonderful stay with us.</p>
            <p class="card-text mb-4">As a token of our appreciation, we are pleased to offer you a complimentary breakfast during your stay. Enjoy a delightful morning meal on us!</p>
            <p class="card-text">Would you like to book another room with us or explore more of our services?</p>
            <a href="${pageContext.request.contextPath}/users/exploreHotel" class="btn btn-custom">Book Again</a>
            <a href="${pageContext.request.contextPath}/users/index" class="btn btn-secondary-custom mt-2">Return to Home</a>
        </div>
    </div>
</div>
</body>
</html>