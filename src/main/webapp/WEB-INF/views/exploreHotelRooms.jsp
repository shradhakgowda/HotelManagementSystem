<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<head>
<body>

    <h2>Rooms Info</h2>
    <div class="row">
        <c:forEach var="room" items="${roomBookList}">
            <div class="col-md-4">
                <div class="card mb-4">
                    <img src="${room.roomImage}" class="card-img-top" alt="${room.roomType}">
                    <div class="card-body">
                        <h5 class="card-title">${room.roomType}</h5>
                        <p class="card-text">Price: ${room.roomPrice}</p>
                        <p class="card-text">Description: ${room.roomDesc}</p>
                        <p class="card-text">Availability: ${room.roomAvailability}</p>
                        <a href="${pageContext.request.contextPath}/rooms/details?roomId=${room.roomId}" class="btn btn-primary">Book Room</a>
                        
                      
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<div class="container mt-4">
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/rooms/listallroomsInId">Book Rooms</a>
</div>

</body>


</html>