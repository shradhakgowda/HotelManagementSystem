<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hotel Management System</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Optional: Custom CSS -->
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

.carousel-item img {
	width: 100%; /* Ensure images fill the carousel width */
	height: 450px; /* Set a fixed height for the images */
	object-fit: cover; /* Ensure the image covers the area */
}

.carousel-caption {
	position: absolute;
	bottom: 50px; /* Adjust as needed */
	left: 15%;
	right: 15%;
	text-align: center;
}

.carousel-control-prev, .carousel-control-next {
	filter: invert(100%);
	/* Lighten controls for better visibility on dark backgrounds */
}

.btn-custom {
	margin: 10px;
}

.btn-register {
	background-color: #2eb14c; /* Green background */
	color: #ffffff; /* White text */
	border: 2px solid #2eb14c; /* Green border */
}

.btn-register:hover {
	background-color: #249b3c; /* Darker green for hover */
	color: #ffffff; /* White text on hover */
	border: 2px solid #249b3c; /* Darker green border on hover */
}

.btn-login {
	background-color: #ffffff; /* White background */
	color: #2eb14c; /* Green text */
	border: 2px solid #2eb14c; /* Green border */
}

.btn-login:hover {
	background-color: #f1f1f1; /* Light grey for hover */
	color: #2eb14c; /* Green text on hover */
	border: 2px solid #2eb14c; /* Green border on hover */
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
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>

				<li class="nav-item"><a class="nav-link" href="#">Hotel</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About Us</a>
				</li>
			</ul>
		</div>
	</nav>

	<!-- Carousel -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="https://th.bing.com/th/id/OIP.LhFUdr2oDYAhStCYJ5QcxwHaEi?rs=1&pid=ImgDetMain"
					alt="First slide">
				<div class="carousel-caption">
					<h1>Welcome to Our Hotel</h1>

					<form
						action="${pageContext.request.contextPath}/users/registerservlet"
						method="get" style="display: inline;">
						<button type="submit" class="btn btn-register btn-custom">Register</button>
					</form>


					<form
						action="${pageContext.request.contextPath}/users/loginServlet"
						method="get" style="display: inline;">
						<button type="submit" class="btn btn-login btn-custom">Login</button>
					</form>

				</div>
			</div>
			<div class="carousel-item">
				<img
					src="https://th.bing.com/th/id/OIP.znFPu4Y0iw0vQJzSAf9jdwHaE8?rs=1&pid=ImgDetMain"
					alt="Second slide">
				<div class="carousel-caption">
					<h1>Experience Luxury</h1>
				 <form action="${pageContext.request.contextPath}/users/registerservlet" method="get" style="display: inline;">
    <button type="submit" class="btn btn-register btn-custom">Register</button>
</form>
 

<form action="${pageContext.request.contextPath}/users/loginServlet" method="get" style="display: inline;">
    <button type="submit" class="btn btn-login btn-custom">Login</button>
</form>
				</div>
			</div>
			<div class="carousel-item">
				<img
					src="https://th.bing.com/th/id/OIP.iCmfeZQEBWJ375hnuo5iaAHaE8?w=287&h=192&c=7&r=0&o=5&dpr=1.5&pid=1.7"
					alt="Third slide">
				<div class="carousel-caption">
					<h1>Book Your Stay</h1>
					<form
						action="${pageContext.request.contextPath}/users/registerservlet"
						method="get" style="display: inline;">
						<button type="submit" class="btn btn-register btn-custom">Register</button>
					</form>


					<form
						action="${pageContext.request.contextPath}/users/loginServlet"
						method="get" style="display: inline;">
						<button type="submit" class="btn btn-login btn-custom">Login</button>
					</form>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
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
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

