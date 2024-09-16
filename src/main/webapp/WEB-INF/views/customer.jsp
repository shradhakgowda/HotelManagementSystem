<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href=
"https://th.bing.com/th/id/OIP.ASeikKXEBMru4liz-FdN8QHaHa?w=183&h=183&c=7&r=0&o=5&dpr=1.5&pid=1.7" />
<title>
Luxe Hotels</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Footer -->


<style>
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
    background-size: cover; /* Cover the entire page */
    background-repeat: no-repeat; /* Prevent image repetition */
    background-attachment: fixed; /* Fix the background image */
}



/* Footer CSS */
.footer {
	background-color: #ffffff; /* Light grey background */
	padding: 40px 0;
}

.review-card {
	margin-bottom: 20px;
}

.footer .container {
	max-width: 1200px;
}
/*display image button*/
.hero-section {
	background-image:
		url('https://th.bing.com/th/id/OIP.iCmfeZQEBWJ375hnuo5iaAHaE8?w=287&h=192&c=7&r=0&o=5&dpr=1.5&pid=1.7');
	/* Replace with your image URL */
	background-size: cover;
	background-position: center;
	color: #ffffff;
	text-align: center;
	padding: 60px 0;
	height: 100%;
}

.hero-section h1 {
	font-size: 3rem;
	margin-bottom: 20px;
}

.hero-section p {
	font-size: 1.5rem;
	margin-bottom: 30px;
}

.hero-section .btn-primary {
	background-color: #2eb14c; /* Button color */
	border-color: #2eb14c;
}

.hero-section .btn-primary:hover {
	background-color: #1f9a3d; /* Button hover color */
	border-color: #1f9a3d;
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
						<span class="sr-only"></span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/users/index">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About Us</a>
				</li>


				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/users/exploreHotel">Explore
						Hotels</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/users/showyourBooking">Your
						Bookings</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/users/showyourPayments">Your
						Payments</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/users/index">LogOut</a></li>


			</ul>
		</div>
	</nav>


	<section class="hero-section">
		<h1>Welcome to Some Hotel</h1>
		<p>Check out our hotels and enjoy a wonderful stay.</p>
		<a
			href="${pageContext.request.contextPath}/exploreHotel/showExploreHotelPage"
			class="btn btn-primary">Explore Hotels</a>
	</section>



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
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>