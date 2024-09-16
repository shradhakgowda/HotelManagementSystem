<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="https://th.bing.com/th/id/OIP.ASeikKXEBMru4liz-FdN8QHaHa?w=183&h=183&c=7&r=0&o=5&dpr=1.5&pid=1.7" />
<title>Luxe Hotels</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
.invalid-feedback {
    display: none; /* Initially hide feedback messages */
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
			<li class="nav-item active"><a class="nav-link" href="#">Luxe Hotels<span class="sr-only"></span></a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/users/index">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="#">About Us</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/users/exploreHotel">Explore Hotels</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/users/showyourBooking">Your Bookings</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/users/showyourPayments">Your Payments</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/users/index">LogOut</a></li>
		</ul>
	</div>
</nav>

<div class="container mt-5">
    <div class="card card-custom">
        <div class="card-header">
            <h4 class="mb-0">Book Room</h4>
        </div>
        <div class="card-body">
            <!-- Booking Room Form -->
            <form id="bookingForm" action="${pageContext.request.contextPath}/booking/registerbooking" method="post">
                <div class="form-group">
                    <label for="bookingDate">Booking Date:</label>
                    <input type="date" id="bookingDate" name="bookingDate" class="form-control" required readonly />
                </div>
                <div class="form-group">
                    <label for="bookingDateFrom">Booking Date From:</label>
                    <input type="date" id="bookingDateFrom" name="bookingDateFrom" class="form-control" required />
                    <div class="invalid-feedback" id="bookingDateFromError">Booking date from must be at least one day after today.</div>
                </div>
                <div class="form-group">
                    <label for="bookingDateTo">Booking Date To:</label>
                    <input type="date" id="bookingDateTo" name="bookingDateTo" class="form-control" required />
                    <div class="invalid-feedback" id="bookingDateToError">Booking date to must be at least one day after booking date from.</div>
                </div>
                <!-- Hidden fields for user_id and room_id -->
                <input type="hidden" id="userId" name="userId" value="${sessionScope.userObject.userId}" />
                <input type="hidden" id="roomId" name="roomId" value="${sessionScope.roomId}" />
                <div class="form-group">
                    <button type="submit" class="btn btn-success">Book Room</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const today = new Date().toISOString().split('T')[0];
    const bookingDate = document.getElementById('bookingDate');
    const bookingDateFrom = document.getElementById('bookingDateFrom');
    const bookingDateTo = document.getElementById('bookingDateTo');

    // Set today's date in bookingDate and make it read-only
    bookingDate.value = today;

    // Set minimum dates for bookingDateFrom and bookingDateTo
    bookingDateFrom.setAttribute('min', today);
    bookingDateTo.setAttribute('min', today);

    // Update minimum date for bookingDateTo when bookingDateFrom changes
    bookingDateFrom.addEventListener('change', function() {
        const fromDate = new Date(bookingDateFrom.value);
        fromDate.setDate(fromDate.getDate() + 1); // Allow from the next day
        bookingDateTo.setAttribute('min', fromDate.toISOString().split('T')[0]);
    });

    // Form validation
    document.getElementById('bookingForm').addEventListener('submit', function(event) {
        const bookingDateFrom = new Date(document.getElementById('bookingDateFrom').value);
        const bookingDateTo = new Date(document.getElementById('bookingDateTo').value);
        const today = new Date();
        today.setHours(0, 0, 0, 0); // Set to start of the day

        // Validate bookingDateFrom
        if (bookingDateFrom <= today) {
            event.preventDefault();
            document.getElementById('bookingDateFromError').style.display = 'block';
        } else {
            document.getElementById('bookingDateFromError').style.display = 'none';
        }

        // Validate bookingDateTo
        if (bookingDateTo <= bookingDateFrom) {
            event.preventDefault();
            document.getElementById('bookingDateToError').style.display = 'block';
        } else {
            document.getElementById('bookingDateToError').style.display = 'none';
        }
    });
});
</script>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
