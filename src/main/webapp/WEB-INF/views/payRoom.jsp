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
.card-custom {
    border: 2px solid #2eb14c; /* Green border */
    border-radius: 10px;
    background-color: #ffffff; /* White background */
}
.card-header {
    background-color: #2eb14c; /* Green background */
    color: #ffffff; /* White text color */
    border-bottom: 2px solid #ffffff; /* White border below header */
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

<h2 class="text-center mb-4" style="color: yellow;">Payment Details</h2>

<div class="container">
    <div class="row">
        <!-- Left Column: Booking Details -->
        <div class="col-md-6">
            <div class="card card-custom" style="width: 18rem; margin-top: 20px;">
                <div class="card-body">
                    <h5 class="card-title">Booking Summary</h5>
                    <p class="card-text">
                        <strong>Booking Date:</strong> <c:out value="${booking.bookingDate}" /><br>
                        <strong>Total Price:</strong> <c:out value="${booking.roomTotalPrice}" /><br>
                        <strong>Username:</strong> <c:out value="${booking.user.userName}" /><br>
                        <strong>Room ID:</strong> <c:out value="${booking.room.roomId}" /><br>
                        <a href="${pageContext.request.contextPath}/booking/cancelBooking?bookingId=${booking.bookingId}" class="btn btn-danger">Cancel Booking</a>
                    </p>
                </div>
            </div>
        </div>
        
        <!-- Right Column: Payment Module Form -->
        <div class="col-md-6">
            <form id="paymentForm" action="${pageContext.request.contextPath}/payment/processPayment" method="post">
                <div class="form-group">
                    <label for="cardNumber">Card Number</label>
                    <input type="text" class="form-control" id="cardNumber" name="cardNumber" required pattern="\d{16}" title="Card number must be 16 digits">
                </div>
                <div class="form-group">
                    <label for="cvv">CVV</label>
                    <input type="text" class="form-control" id="cvv" name="cvv" required pattern="\d{3}" title="CVV must be 3 digits">
                </div>
                <div class="form-group">
                    <label for="amount">Amount</label>
                    <input type="text" class="form-control" id="amount" name="amount" value="${booking.roomTotalPrice}" required readonly>
                </div>
                <div class="form-group">
                    <label for="paymentMode">Mode of Payment</label>
                    <select class="form-control" id="paymentMode" name="paymentMode" required>
                        <option value="creditCard">Credit Card</option>
                        <option value="debitCard">Debit Card</option>
                        <option value="paypal">PayPal</option>
                    </select>
                </div>
                
                <!-- Hidden Fields -->
                <input type="hidden" id="roomPrice" name="roomPrice" value="${booking.roomTotalPrice}">
                <input type="hidden" id="totalPrice" name="totalPrice" value="${booking.roomTotalPrice}">
                <input type="hidden" id="bookingId" name="bookingId" value="${booking.bookingId}">
                <input type="hidden" id="roomId" name="roomId" value="${booking.room.roomId}">
                <input type="hidden" id="userId" name="userId" value="${booking.user.userId}">
                
                <button type="submit" class="btn btn-primary">Submit Payment</button>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
