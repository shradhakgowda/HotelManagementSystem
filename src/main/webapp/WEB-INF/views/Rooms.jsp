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
	background-image:
		url('https://images.pexels.com/photos/1178994/pexels-photo-1178994.jpeg?auto=compress&cs=tinysrgb&w=600');
	background-size: cover; /* Cover the entire page */
	background-repeat: no-repeat; /* Prevent image repetition */
	background-attachment: fixed; /* Fix the background image */
}

.navbar {
	background-color: #2eb14c;
	margin-bottom: 20px; /* Green background */
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

/* 
card style */
.container {
    max-width: 1200px; /* Set a fixed width for the container */
    margin: 0 auto; /* Center the container horizontally */
}

.card {
    width: 100%; /* Ensure the card takes full width of its column */
    height: 700px; /* Fixed height for the card */
    display: flex;
    flex-direction: column;
}
.card-img-top {
    height: 50%; /* Image takes up 50% of the card's height */
    object-fit: cover; /* Ensure the image covers the area without distortion */
}
.card-body {
    flex: 1; /* Allow the card body to take up remaining space */
    overflow-y: auto; /* Add scroll if content exceeds the height */
    padding: 15px; /* Add padding for better spacing */
}

.col-md-6 {
    flex: 0 0 50%; /* Make each column take up 50% of the container width */
    max-width: 50%; /* Ensure column width does not exceed 50% */
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
							<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/hotels/listallhotels">Hotels
						
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/rooms/showroomdirect">
						Add Rooms</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/rooms/listallrooms">List
						Your Rooms</a></li>
						
										<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/users/listManagerBookings">Bookings		
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/users/listManagerPayment">Payments	
				</a></li>

				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/users/index">LogOut</a></li>
					

			</ul>

		</div>

	</nav><%-- 
	<div class="container">
		<!--<h2>Rooms Info</h2>-->
		<div class="row">
			<c:forEach var="room" items="${sessionScope.roomList}">
				<div class="col-md-6">
					<div class="card mb-4">
						<img src="${room.roomImage}" class="card-img-top"
							alt="${room.roomType}">
						<div class="card-body">
							<h5 class="card-title">${room.roomType}</h5>
							<p class="card-text">Price: ${room.roomPrice}</p>
							<p class="card-text">Description: ${room.roomDesc}</p>
							<p class="card-text">Availability: ${room.roomAvailability}</p>
							<p class="card-text">Room No: ${room.roomId}</p>
							   <!-- Edit Room Button -->
                            <a href="${pageContext.request.contextPath}/rooms/showeditRoom?roomId=${room.roomId}" class="btn btn-secondary">Edit Room</a>
                        </div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div> --%>
	
	<!--<h2>Rooms Info</h2>-->
	<h1 style="text-align: center; color: yellow;">Rooms Here</h1>
<div class="container">
    <div class="row">
        <c:forEach var="room" items="${sessionScope.roomList}">
            <div class="col-md-6"> <!-- Changed from col-md-4 to col-md-6 -->
                <div class="card mb-4">
                    <img src="${room.roomImage}" class="card-img-top" alt="${room.roomType}">
                    <div class="card-body">
                        <h5 class="card-title">Tyes Of Room :${room.roomType}</h5>
                        <p class="card-text">Price Per Night Rs. ${room.roomPrice}</p>
                        <p class="card-text">Room OverView :${room.roomDesc}</p>
                        <p class="card-text">Room Capacity ${room.roomAvailability}</p>
                        <p class="card-text">Room No: ${room.roomId}</p>
                        <!-- Edit Room Button -->
                        <a href="${pageContext.request.contextPath}/rooms/showeditRoom?roomId=${room.roomId}" class="btn btn-secondary">Edit Room</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
	

</body>
</html>