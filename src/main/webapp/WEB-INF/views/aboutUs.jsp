<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="https://th.bing.com/th/id/OIP.ASeikKXEBMru4liz-FdN8QHaHa?w=183&h=183&c=7&r=0&o=5&dpr=1.5&pid=1.7" />
<title>Luxe Hotels</title>

<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Optional: Custom CSS -->
<style>
    body {
        background-image: url('https://images.pexels.com/photos/1178994/pexels-photo-1178994.jpeg?auto=compress&cs=tinysrgb&w=600');
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
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
    .about-us {
        padding: 60px 20px;
        text-align: center;
    }
    .about-us h2 {
        margin-bottom: 30px;
        font-family: 'Arial', sans-serif;
        font-weight: bold;
        font-size: 2.5rem;
        color: #ffcc00; /* Yellow color for heading */
    }
    .about-us p {
        font-size: 1.1rem;
        line-height: 1.8;
        color: #000000; /* Black color for text */
        margin: 20px auto;
        max-width: 800px;
    }
    .card {
        background: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
        border: none;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        margin: 20px auto;
        max-width: 800px;
    }
    .card-body {
        padding: 30px;
    }
    
    
    
    /* Footer CSS */
.footer {
	/* Light grey background */
	padding: 40px 0;
	background-color: rgba(0, 0, 0, 0);
}

.review-card {
	margin-bottom: 20px;
	
}

.footer .container {
	max-width: 1200px;
	
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
            <li class="nav-item active"><a class="nav-link" href="#">Luxe Hotels</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/users/index">Home</a></li>
        </ul>
    </div>
</nav>

<div class="container about-us">
    <h2>About Luxe Hotels</h2>
    <div class="card">
        <div class="card-body">
            <p>
                Welcome to Luxe Hotels, your premier online hotel booking portal. We are a chain of hotels with numerous locations available, designed to offer you the utmost comfort and convenience during your travels.
            </p>
            <p>
                Our hotels are strategically located to ensure you have a pleasant and relaxing stay, whether you're on a business trip or vacation. We pride ourselves on providing top-notch services and amenities to make your stay as enjoyable as possible.
            </p>
            <p>
                Explore our many locations and experience the luxury and comfort that only Luxe Hotels can offer. Book your stay with us today and let us take care of the rest!
            </p>
        </div>
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
							<h6 class="card-subtitle mb-2 text-muted">Traveller</h6>
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
