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
<style >
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
.room-card {
            width: 30%; /* Adjusted width for two cards in a row */
            height: 600px; /* Fixed height for the cards */
            margin-top: 20px;
            
            box-sizing: border-box; /* Include padding and border in the element's total width and height */
        }
        .card {
            height: 100%; /* Ensure the card takes full height of its container */
            display: flex;
            flex-direction: column;
        }
        .card-img-top {
            height: 50%;/* Image takes up 50% of the card's height */
            object-fit: cover;
            padding:10px; /* Ensure the image covers the area without distortion */
        }
        .card-body {
            flex: 1; /* Allow the card body to take up remaining space */
            overflow-y: auto; /* Add scroll if content exceeds the height */
            padding-bottom: 35px; /* Add padding for better spacing */
        }


  body {
    background-image: url('https://images.pexels.com/photos/1178994/pexels-photo-1178994.jpeg?auto=compress&cs=tinysrgb&w=600');
    background-size: cover; /* Cover the entire page */
    background-repeat: no-repeat; /* Prevent image repetition */
    background-attachment: fixed; /* Fix the background image */
}
</style>
<head>
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


				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/users/exploreHotel">Explore
						Hotels</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/users/showyourPayments">Your
						Bookings</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/users/index">LogOut</a></li>


			</ul>
		</div>
	</nav>

	<h2 class="text-center mb-4" style="color: black;">Room</h2>
<div class="row mt-4" id="roomsContainer">
        <c:forEach var="room" items="${roomBookList}">
            <div class="col-md-6 room-card">
                <div class="card mb-4">
                    <img src="${room.roomImage}" class="card-img-top" alt="${room.roomType}">
                    <div class="card-body">
                        <h5 class="card-title">${room.roomType}</h5>
                        <p class="card-text">Price per day: ${room.roomPrice}</p>
                        <p class="card-text">Description: ${room.roomDesc}</p>
                        <p class="card-text">Capacity: ${room.roomAvailability}</p>
                        <p class="card-text">Reservation: ${room.roomReservation}</p>
                        <c:choose>
                            <c:when test="${room.roomReservation eq 'reserved'}">
                                <button class="btn btn-secondary" disabled>Room Reserved</button>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/booking/showroombooking?roomId=${room.roomId}" class="btn btn-success">Book Room</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
	


</body>


</html>