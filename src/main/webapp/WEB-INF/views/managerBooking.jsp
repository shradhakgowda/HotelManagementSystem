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


.card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem; /* Space between cards */
        }
        .card {
            border: 2px solid #2eb14c; /* Green border */
            border-radius: 10px;
            background-color: #e9f5e9;/* White background */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Light shadow */
            margin-bottom: 1rem; /* Space below each card */
        }
        .card-body {
            padding: 1.5rem; /* Padding inside the card */
        }
        .card-title {
            color: #2eb14c; /* Green color for titles */
            font-weight: bold;
        }
        .card-header {
            background-color: #2eb14c; /* Green background for header */
            color: #ffffff; /* White text color */
            border-bottom: 2px solid #ffffff; /* White border below header */
            border-top-left-radius: 10px; /* Rounded corners for the top left */
            border-top-right-radius: 10px; /* Rounded corners for the top right */
        }
        .card-text {
            color: #333; /* Dark gray color for text */
        }
        .card-heading {
            font-size: 1.25rem; /* Adjust size as needed */
            font-weight: 700; /* Make the heading bold */
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
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/hotels/listallhotels">Hotels
						
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/users/listManagerPayment">Booking	
				</a></li>
						
					<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/users/index">LogOut</a></li>
			</ul>
		
		</div>
	</nav>
	
<%-- <table style="border: 3px solid black; background-color: grey; width: 100%; border-collapse: collapse;">
        <thead>
            <tr>
                <th style="border: 1px solid black;">ID</th>
                <th style="border: 1px solid black;">Booking Date</th>
                <th style="border: 1px solid black;">Date From</th>
                <th style="border: 1px solid black;">Date To</th>
                <th style="border: 1px solid black;">Total Price</th>
                <th style="border: 1px solid black;">User ID</th>
                <th style="border: 1px solid black;">User Name</th>
                <th style="border: 1px solid black;">Room ID</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="booking" items="${sessionScope.bookList}">
                <tr>
                    <td style="border: 1px solid black;"><c:out value="${booking.bookingId}" /></td>
                    <td style="border: 1px solid black;"><c:out value="${booking.bookingDate}" /></td>
                    <td style="border: 1px solid black;"><c:out value="${booking.bookingDateFrom}" /></td>
                    <td style="border: 1px solid black;"><c:out value="${booking.bookingDateTo}" /></td>
                    <td style="border: 1px solid black;"><c:out value="${booking.roomTotalPrice}" /></td>
                    <td style="border: 1px solid black;"><c:out value="${booking.user.userId}" /></td>
                    <td style="border: 1px solid black;"><c:out value="${booking.user.userName}" /></td>
                    <td style="border: 1px solid black;"><c:out value="${booking.room.roomId}" /></td>
                </tr>
            </c:forEach>
        </tbody>
    </table> --%>
    <h2 class="text-center mb-4" style="color: yellow;">Booking Details</h2>
    
    <div class="container mt-4">
        <div class="card-container">
            <c:forEach var="booking" items="${sessionScope.bookList}">
                <div class="card">
                    <div class="card-header">
                        Booking ID: <c:out value="${booking.bookingId}" />
                    </div>
                    <div class="card-body">
                        <h5 class="card-heading">Booking Details</h5>
                        <p class="card-text">Booking Date: <c:out value="${booking.bookingDate}" /></p>
                        <p class="card-text">Date From: <c:out value="${booking.bookingDateFrom}" /></p>
                        <p class="card-text">Date To: <c:out value="${booking.bookingDateTo}" /></p>
                        <p class="card-text">Total Price: <c:out value="${booking.roomTotalPrice}" /></p>
                        <p class="card-text">User ID: <c:out value="${booking.user.userId}" /></p>
                        <p class="card-text">User Name: <c:out value="${booking.user.userName}" /></p>
                        <p class="card-text">Room ID: <c:out value="${booking.room.roomId}" /></p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

</body>
</html>