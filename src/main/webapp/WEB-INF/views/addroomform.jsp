<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href=
"https://th.bing.com/th/id/OIP.ASeikKXEBMru4liz-FdN8QHaHa?w=183&h=183&c=7&r=0&o=5&dpr=1.5&pid=1.7" />
<title>
Luxe Hotels</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.card-custom {
	max-width: 600px; /* Adjust width as needed */
	margin: auto;
	background-color: rgba(255, 255, 255, 0.9);
	/* Semi-transparent background */
	border: 1px solid #ddd; /* Center the card horizontally */
}



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
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/users/index">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/hotels/listallhotels">Hotels
						
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/users/listManagerPayment">Payments	
				</a></li>
						
					<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/users/index">LogOut</a></li>
			</ul>
		</div>
	</nav>
	<div class="container mt-5">
		<div class="card card-custom">
			<div class="card-header">
				<h4 class="mb-0">Room Registration</h4>
			</div>
			<div class="card-body">
				<!-- Standard HTML Form -->
				<form action="${pageContext.request.contextPath}/rooms/addrooms"
					method="post">
					<div class="form-group">
						<label for="roomImage">Room Image URL:</label> <input type="text"
							id="roomImage" name="roomImage" class="form-control"
							required="true" />
					</div>

					<div class="form-group">
						<label for="roomPrice">Room Price:</label> <input type="number"
							id="roomPrice" name="roomPrice" class="form-control" min="500" step="10"
							required="true" />
							<div class="invalid-feedback">
                            The room price must be at least 500.
                        </div>
					</div>

					<div class="form-group">
						<label for="roomDesc">Room Description:</label> <input type="text"
							id="roomDesc" name="roomDesc" class="form-control"
							required="true" />
					</div>

					<div class="form-group">
						<label for="roomAvailability">Availabality:</label> <select
							id="roomAvailability" name="roomAvailability"
							class="form-control" required="true">
							<option value="2">2</option>
							<option value="4">4</option>
							<option value="12">12</option>
						</select>
					</div>

					<div class="form-group">
						<label for="roomType">Room Type:</label> <select id="roomType"
							name="roomType" class="form-control" required="true">
							<option value="luxury">Luxury</option>
							<option value="regular">Regular</option>
							<option value="dormitory">Dormitory</option>
						</select>
					</div>
					<div class="form-group">
						<label for="roomReservation">Room Reservation:</label> <select
							id="roomReservation" name="roomReservation" class="form-control"
							required>
							<option value="not_reserved">Not Reserved</option>
							<option value="reserved">Reserved</option>
						</select>
					</div>
					<!-- Hidden Field for Hotel ID -->
					<input type="hidden" id="hotel_id" name="hotel_id"
						value="${sessionScope.hotelId}" />

					<div class="form-group">
						<button type="submit" class="btn btn-success">Add Your
							Room</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		    <script>
        // Optional JavaScript validation
        document.getElementById('roomForm').addEventListener('submit', function(event) {
            var roomPriceInput = document.getElementById('roomPrice');
            if (roomPriceInput.value < 500) {
                roomPriceInput.classList.add('is-invalid');
                event.preventDefault(); // Prevent form submission
            } else {
                roomPriceInput.classList.remove('is-invalid');
            }
        });
    </script>
		
</body>
</html>
