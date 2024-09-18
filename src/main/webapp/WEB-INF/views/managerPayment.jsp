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

        .card-custom {
            border: 1px solid #28a745; /* Green border */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #e9f5e9; /* Light green background */
        }
        .card-header-custom {
            background-color: #28a745; /* Dark green header */
            color: #fff;
            font-weight: bold;
            border-bottom: 1px solid #1e7e34; /* Slightly darker green for bottom border */
        }
        .card-body-custom {
            padding: 1.5rem;
        }
        .card-text-custom {
            color: #333;
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
	<div class="container mt-5">
   <h2 class="text-center mb-4" style="color: yellow;">Booking Details</h2>

    <div class="row">
        <c:forEach var="payment" items="${sessionScope.paymentDetails1}">
            <div class="col-md-4 mb-4">
                <div class="card card-custom">
                    <div class="card-body card-body-custom">
                        <p class="card-text card-text-custom">
                        <strong>Room No</strong> <c:out value="${payment.paymentDate}" /><br>
                            <strong>Payment Date:</strong> <c:out value="${payment.paymentDate}" /><br>
                            <strong>Total Price:</strong> <c:out value="${payment.totalPrice}" /><br>
                            <strong>Room ID:</strong> <c:out value="${payment.room.roomId}" /><br>
                            <strong>Booking ID:</strong> <c:out value="${payment.booking.bookingId}" />
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
	
	

</body>
</html>