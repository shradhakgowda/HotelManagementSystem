<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  isELIgnored="false"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

    <h2>Rooms Info</h2>
    <div class="row">
        <c:forEach var="room" items="${roomslist}">
            <div class="col-md-4">
                <div class="card mb-4">
                    <img src="${room.roomImage}" class="card-img-top" alt="${room.roomType}">
                    <div class="card-body">
                        <h5 class="card-title">${room.roomType}</h5>
                        <p class="card-text">Price: ${room.roomPrice}</p>
                        <p class="card-text">Description: ${room.roomDesc}</p>
                        <p class="card-text">Availability: ${room.roomAvailability}</p>
                        <a href="${pageContext.request.contextPath}/rooms/details?roomId=${room.roomId}" class="btn btn-primary">View Details</a>
                        
                        <!-- Edit Room Status Form -->
                        <form action="${pageContext.request.contextPath}/rooms/editStatus" method="post">
                            <input type="hidden" name="roomId" value="${room.roomId}">
                            <div class="form-group">
                                <label for="roomAvailability">Edit Availability:</label>
                                <input type="number" class="form-control" id="roomAvailability" name="roomAvailability" value="${room.roomAvailability}">
                            </div>
                            <button type="submit" class="btn btn-secondary">Update Status</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>