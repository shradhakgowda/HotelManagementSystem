<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="icon" href=
"https://th.bing.com/th/id/OIP.ASeikKXEBMru4liz-FdN8QHaHa?w=183&h=183&c=7&r=0&o=5&dpr=1.5&pid=1.7" />
<title>
Luxe Hotels</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://images.pexels.com/photos/1178994/pexels-photo-1178994.jpeg?auto=compress&cs=tinysrgb&w=600');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
        }
        .card {
            margin-top: 20px;
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
						<span class="sr-only"></span>
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/users/index">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/hotels/listallhotels">Hotels
						
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/users/listManagerPayment">Bookings	
				</a></li>
						
					<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/users/index">LogOut</a></li>
			</ul>
		</div>
	</nav>


    <div class="container">
        <div class="card">
            <div class="card-header">
            <h2 class="text-center mb-4" style="color: yellow;">Update Room Details</h2>
                
            </div>
            <div class="card-body">
                <!-- Form to update room details -->
                <form action="${pageContext.request.contextPath}/rooms/updateRoom" method="post">
                    <input type="hidden" name="roomId" value="${sessionScope.roomId}"/>
                    
                    <div class="form-group">
                        <label for="roomImage">Room Image URL:</label>
                        <input type="text" id="roomImage" name="roomImage" class="form-control" value="${room.roomImage}" required="true"/>
                    </div>

                    <div class="form-group">
                        <label for="roomPrice">Room Price:</label>
                        <input type="number" id="roomPrice" name="roomPrice" class="form-control" value="${room.roomPrice}" step="10" min="500" required="true"/>
                        <div class="invalid-feedback">
                            The room price must be at least 500.
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="roomDesc">Room Description:</label>
                        <input type="text" id="roomDesc" name="roomDesc" class="form-control" value="${room.roomDesc}" required="true"/>
                    </div>

                    <div class="form-group">
                        <label for="roomAvailability">Availability:</label>
                        <select id="roomAvailability" name="roomAvailability" class="form-control" required="true">
                            <option value="2" ${room.roomAvailability == 2 ? 'selected' : ''}>2</option>
                            <option value="4" ${room.roomAvailability == 4 ? 'selected' : ''}>4</option>
                            <option value="12" ${room.roomAvailability == 12 ? 'selected' : ''}>12</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="roomType">Room Type:</label>
                        <select id="roomType" name="roomType" class="form-control" required="true">
                            <option value="luxury" ${room.roomType.equals("luxury") ? 'selected' : ''}>luxury</option>
                            <option value="regular" ${room.roomType.equals("regular") ? 'selected' : ''}>regular</option>
                            <option value="dormitory" ${room.roomType.equals("dormitory") ? 'selected' : ''}>dormitory</option>
                        </select>
                    </div>

                       <div class="form-group">
                        <label for="roomReservation">Room Reservation:</label>
                        <select id="roomReservation" name="roomReservation" class="form-control" required>
                            <option value="not_reserved" ${room.roomReservation.equals("not_reserved") ? 'selected' : ''}>Not Reserved</option>
                            <option value="reserved" ${room.roomReservation.equals("reserved") ? 'selected' : ''}>Reserved</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-success">Update Room</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
        <!-- Optional JavaScript for validation -->
    <script>
        document.getElementById('editRoomForm').addEventListener('submit', function(event) {
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
