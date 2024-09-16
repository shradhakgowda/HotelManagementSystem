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
<style >
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
    .about-us {
        padding: 40px 0;
        text-align: center;
    }
    .about-us h2 {
        margin-bottom: 20px;
    }
    .about-us p {
        font-size: 1.2rem;
        line-height: 1.6;
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
            <li class="nav-item active"><a class="nav-link" href="#">Luxe Hotels</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/users/index">Home</a></li>
        </ul>
    </div>
</nav>

<div class="container about-us">
    <h2>About Luxe Hotels</h2>
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

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
