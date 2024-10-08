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
  body {
    background-image: url('https://images.pexels.com/photos/1178994/pexels-photo-1178994.jpeg?auto=compress&cs=tinysrgb&w=600');
    background-size: cover; /* Cover the entire page */
    background-repeat: no-repeat; /* Prevent image repetition */
    background-attachment: fixed; /* Fix the background image */
}

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

.search-container {
	text-align: center;
	background: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0);
}

.search-container input[type="text"] {
	width: 300px;
	padding: 10px;
	margin-right: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.search-container button {
	padding: 10px 20px;
	border: none;
	background-color: #007bff;
	color: white;
	border-radius: 5px;
	cursor: pointer;
}

.search-container button:hover {
	background-color: #0056b3;
}


.hotel-card {
    width: 30%; /* Fixed width for three cards in a row */
    height: 400px; /* Fixed height for the cards */
    margin: 10px;
    box-sizing: border-box; /* Include padding and border in the element's total width and height */
}

.card {
    height: 100%; /* Ensure the card takes full height of its container */
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
<%-- 
	<div class="search-container">
		<form
			action="${pageContext.request.contextPath}/exploreHotel/searchHotels"
			method="get">
			<input type="text" name="location" placeholder="Enter location..."
				required>
			<button type="submit">Search</button>
		</form>
	</div> --%>
<%-- 
<div class="container">

        <div class="search-container">
            <form action="${pageContext.request.contextPath}/exploreHotel/searchHotels" method="get">
                <input type="text" name="location" placeholder="Enter location" required>
                <button type="submit">Search</button>
            </form>
        </div>
        <div class="row mt-4">
            <c:choose>
                <c:when test="${empty sessionScope.hotelsInLocation}">
                    <p>No hotels found in this location.</p>
                </c:when>
                <c:otherwise>
                    <c:forEach var="hotel" items="${sessionScope.hotelsInLocation}">
                        <div class="col-md-4">
                            <div class="card mb-4">
                                <img src="${hotel.hotelImage}" class="card-img-top" alt="${hotel.hotelName}">
                                <div class="card-body">
                                    <h5 class="card-title">${hotel.hotelName}</h5>
                                    <p class="card-text">Location: ${hotel.hotelLocation}</p>
                                    <a href="${pageContext.request.contextPath}/rooms/showexploreroom?hotelIds=${hotel.hotelId}" class="btn btn-primary">View Rooms</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </div> --%>
    <div class="container">
    <div class="search-container">
        <form action="${pageContext.request.contextPath}/exploreHotel/searchHotels" method="get">
            <input type="text" name="location" id="locationInput" placeholder="Enter location" required>
            <button type="submit">Search</button>
        </form>
    </div>
 <div class="row mt-4" id="hotelsContainer">
        <c:forEach var="hotel" items="${sessionScope.hotelsInLocation}">
            <div class="col-md-4 hotel-card" data-location="${hotel.hotelLocation}">
                <div class="card mb-4">
                    <img src="${hotel.hotelImage}" class="card-img-top" alt="${hotel.hotelName}">
                    <div class="card-body">
                        <h5 class="card-title">${hotel.hotelName}</h5>
                        <p class="card-text">Location: ${hotel.hotelLocation}</p>
                        <a href="${pageContext.request.contextPath}/rooms/showexploreroom?hotelIds=${hotel.hotelId}" class="btn btn-success">View Rooms</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
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

<script>
function filterHotels() {
    var input = document.getElementById('locationInput').value.toLowerCase();
    var hotelCards = document.getElementsByClassName('hotel-card');

    for (var i = 0; i < hotelCards.length; i++) {
        var location = hotelCards[i].getAttribute('data-location').toLowerCase();
        if (location.includes(input)) {
            hotelCards[i].style.display = 'block';
        } else {
            hotelCards[i].style.display = 'none';
        }
    }
}
</script>




	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



</body>
</html>