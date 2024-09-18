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

	<table class="table table-bordered">
		<thead>
			<tr>
				<th>ID</th>
				<th>Booking Date</th>
				<th>Date From</th>
				<th>Date To</th>
				<th>Total Price</th>
				<!-- <th>User ID</th> -->
				<th>User Name</th>
				<th>Room No</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="booking" items="${sessionScope.bookList1}">
				<tr>
					<td><c:out value="${booking.bookingId}" /></td>
					<td><c:out value="${booking.bookingDate}" /></td>
					<td><c:out value="${booking.bookingDateFrom}" /></td>
					<td><c:out value="${booking.bookingDateTo}" /></td>
					<td><c:out value="${booking.roomTotalPrice}" /></td>
					<%--  <td><c:out value="${booking.user.userId}" /></td> --%>
					<td><c:out value="${booking.user.userName}" /></td>
					<td><c:out value="${booking.room.roomId}" /></td>
					<td>
				</tr>
			</c:forEach>
			
			
			
			
			
		</tbody>
</body>
</html>