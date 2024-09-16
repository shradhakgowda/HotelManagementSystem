<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
  <link rel="icon" href=
"https://th.bing.com/th/id/OIP.ASeikKXEBMru4liz-FdN8QHaHa?w=183&h=183&c=7&r=0&o=5&dpr=1.5&pid=1.7" />
<title>
Luxe Hotels</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        .icon-green {
            color: green;
        }
        .login-card {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }
                       .login-card {
            width: 550px; /* Adjust the width as needed */
            margin: 10px auto; /* Center the card and add some margin */
            padding: 15px; /* Add some padding inside the card */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */
            border-radius: 8px; /* Round the corners */
            background-color: rgba(255, 255, 255, 0.8); 
        }
               body {
    background-image: url('https://images.pexels.com/photos/1178994/pexels-photo-1178994.jpeg?auto=compress&cs=tinysrgb&w=600');
    background-size: cover; /* Cover the entire page */
    background-repeat: no-repeat; /* Prevent image repetition */
    background-attachment: fixed; /* Fix the background image */
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
						<span class="sr-only">(current)</span>
				</a></li>
							
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/users/index">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About Us</a>
				</li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/users/registerservlet">Register	
				</a></li>
				
				
				
			</ul>
		</div>
	</nav>

    <div class="container">
        <div class="login-card">
            <h2 class="text-center">Login</h2>
            <!-- Spring Form Tag -->
            <form:form action="/HotelManagementSystem/users/login" method="post" modelAttribute="user" cssClass="form-horizontal" onsubmit="return validateForm()">
                
                <div class="form-group">
                    <label for="userName" class="col-form-label">
                        <i class="fas fa-user icon-green"></i> User Name
                    </label>
                    <form:input path="userName" id="userName" cssClass="form-control" required="true"/>
                </div>

                <div class="form-group">
                    <label for="userPassword" class="col-form-label">
                        <i class="fas fa-lock icon-green"></i> Password
                    </label>
                    <form:password path="userPassword" id="userPassword" cssClass="form-control" required="true"/>
                </div>

                <div class="form-group text-center">
                     <button type="submit" class="btn btn-success">Login</button>
                </div>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">
                        ${error}
                    </div>
                </c:if>

            </form:form>
        </div>
    </div>

    <script type="text/javascript">
    function validateForm() {
        var userName = document.getElementById("userName").value;
        var userPassword = document.getElementById("userPassword").value;

        if (!userName || !userPassword) {
            alert("Both username and password are required.");
            return false;
        }

        return true;
    }
    </script>
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

</body>
</html>
