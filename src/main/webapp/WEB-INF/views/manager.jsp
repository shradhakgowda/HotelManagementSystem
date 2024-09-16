<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href=
"https://th.bing.com/th/id/OIP.ASeikKXEBMru4liz-FdN8QHaHa?w=183&h=183&c=7&r=0&o=5&dpr=1.5&pid=1.7" />
<title>
Luxe Hotels</title>

<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Optional: Custom CSS -->
<style>


               body {
    background-image: url('https://images.pexels.com/photos/1178994/pexels-photo-1178994.jpeg?auto=compress&cs=tinysrgb&w=600');
    background-size: cover; /* Cover the entire page */
    background-repeat: no-repeat; /* Prevent image repetition */
    background-attachment: fixed; /* Fix the background image */
}
.navbar {
	background-color: #2eb14c;
}

.navbar-brand img {
	height: 40px;
}

.navbar-light .navbar-nav .nav-link {
	color: #ffffff;
}

.navbar-light .navbar-nav .nav-link:hover {
	color: #d4edda;
}

.navbar-light .navbar-nav .nav-item.active .nav-link {
	color: #ffffff;
}

<!--
card css-->
.card {
	width: 300px; /* Set the desired width */
	height: 400px; /* Set the desired height */
	overflow: hidden;
		background-color: rgba(0, 0, 0, 0);
	 /* Hide any overflow content */
}

.card-img-top {
	width: 100%;
	height: 200px; /* Set the height for the image */
	object-fit: cover;
	/* Ensure the image covers the area without distortion */
}

<!--
slider styling-->
.slider {
	position: relative;
	width: 100%;
	max-width: 600px;
	margin: auto;
	overflow: hidden;
	padding-bottom: 20px;
	 /* Fixed height */
}

.slides {
	display: flex;
	transition: transform 0.5s ease-in-out;
	height: 40%;
}

.slide {
	min-width: 100%;
	box-sizing: border-box;
	position: relative;
}

.slide img {
	width: 100%;
	height: 100%;
	object-fit: cover; /* Cover the area of the slider */
}

.heading {
	position: absolute;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	font-size: 24px;
	background-color: rgba(0, 0, 0, 0);
	padding: 10px;
	text-align: center;
}

.buttons {
	position: absolute;
	bottom: 20px;
	left: 50%;
	transform: translateX(-50%);
	display: flex;
	gap: 10px;
}

.buttons button {
	background-color: #ffffff;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	cursor: pointer;
	font-size: 16px;
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
		<!-- manager slider -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
							<li class="nav-item active"><a class="nav-link" href="">Luxe Hotels
						<span class="sr-only"></span>
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/users/index">Home
						<span class="sr-only">(current)</span>
				</a></li>
<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/users/index">About Us
						
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/hotels/listallhotels">Hotels
						
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/users/listManagerBookings">Bookings		
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/users/listManagerPayment">Payments	
				</a></li>
						
					<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/users/index">LogOut</a></li>
			</ul>
		</div>
	</nav>




	<div class="slider">
		<div class="slides">
			<div class="slide">
				<img
					src="https://th.bing.com/th/id/OIP.LhFUdr2oDYAhStCYJ5QcxwHaEi?rs=1&pid=ImgDetMain"
					alt="Room Image 1">
				<div class="heading">Welcome back Ready to add some sparkle to our hotels  </div>
				
				<div class="buttons">
					<a href="${pageContext.request.contextPath}/hotels/hotel">
						<button type="button">Add Hotels</button>
					</a>
						<a href="${pageContext.request.contextPath}/hotels/listallhotels">
						<button type="button">Check Out Hotels</button>
					</a>
				</div>
			</div>
			<br>
			<br>
			<div class="slide">
				<img
					src="https://th.bing.com/th/id/OIP.znFPu4Y0iw0vQJzSAf9jdwHaE8?rs=1&pid=ImgDetMain"
					alt="Room Image 2">
				<div class="heading">Welcome back Ready to add some sparkle to our hotels  </div>
				<div class="buttons">
					<a href="${pageContext.request.contextPath}/hotels/hotel">
						<button type="button">Add Hotels</button>
					</a>
					
						<a href="${pageContext.request.contextPath}/hotels/listallhotels">
						<button type="button">Check Out Hotels</button>
					</a>
				</div>
			</div>
			<!-- Add more slides as needed -->
		</div>
	</div>
	<!-- -manager slider -->

	<div class="container">
		<div class="row">
			<c:forEach var="hotellist" items="${hotelLists}">
				<div class="col-md-4">
					<div class="card mb-4">
						<img src="${hotellist.hotelImage}" class="card-img-top"
							alt="${hotellist.hotelName}">
						<div class="card-body">
							<h5 class="card-title">${hotellist.hotelName}</h5>
							<p class="card-text">${hotellist.hotelLocation}</p>
							<a
								href="${pageContext.request.contextPath}/rooms/showroom?hotelId=${hotellist.hotelId}"
								class="btn btn-success">View Rooms</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<script>
        let index = 0;
        function showSlide(n) {
            const slides = document.querySelector('.slides');
            const totalSlides = document.querySelectorAll('.slide').length;
            index = (n + totalSlides) % totalSlides;
            slides.style.transform = 'translateX(' + (-index * 100) + '%)';
        }
        setInterval(() => showSlide(index + 1), 3000); // Change slide every 3 seconds
    </script>
</body>
</html>