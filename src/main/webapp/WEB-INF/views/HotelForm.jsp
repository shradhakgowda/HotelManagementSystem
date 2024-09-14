<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotel Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://images.pexels.com/photos/1178994/pexels-photo-1178994.jpeg?auto=compress&cs=tinysrgb&w=600');
            background-size: cover; /* Cover the entire page */
            background-repeat: no-repeat; /* Prevent image repetition */
            background-attachment: fixed; /* Fix the background image */
        }
        .card-custom {
            max-width: 500px; /* Reduced max-width for smaller card */
            margin: auto; 
            background-color: rgba(255, 255, 255, 0.8); /* Center the card horizontally */
        }
        .invalid-feedback {
            display: none; /* Hide error messages initially */
        }
        .form-control.is-invalid {
            border-color: #dc3545; /* Highlight invalid inputs */
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="card card-custom">
            <div class="card-header">
                <h4 class="mb-0">Hotel Registration</h4>
            </div>
            <div class="card-body">
                <!-- Standard HTML Form -->
                <form id="hotelForm" action="${pageContext.request.contextPath}/hotels/registerhotel" method="post">
                    <div class="form-group">
                        <label for="hotelName">Hotel Name:</label>
                        <input type="text" id="hotelName" name="hotelName" class="form-control" required="true"/>
                        <div class="invalid-feedback" id="hotelNameError">Hotel name must be between 3 and 100 characters long.</div>
                    </div>

                    <div class="form-group">
                        <label for="hotelLocation">Location:</label>
                        <input type="text" id="hotelLocation" name="hotelLocation" class="form-control" required="true"/>
                        <div class="invalid-feedback" id="hotelLocationError">Location must be between 3 and 100 characters long.</div>
                    </div>

                    <div class="form-group">
                        <label for="hotelImage">Hotel Image URL:</label>
                        <input type="text" id="hotelImage" name="hotelImage" class="form-control" required="true"/>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-success">Add Your Hotel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- JavaScript Validation -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const form = document.getElementById('hotelForm');
            const hotelNameInput = document.getElementById('hotelName');
            const hotelLocationInput = document.getElementById('hotelLocation');
            const hotelNameError = document.getElementById('hotelNameError');
            const hotelLocationError = document.getElementById('hotelLocationError');

            function validateHotelName() {
                if (hotelNameInput.value.length < 3 || hotelNameInput.value.length > 100) {
                    hotelNameInput.classList.add('is-invalid');
                    hotelNameError.style.display = 'block';
                } else {
                    hotelNameInput.classList.remove('is-invalid');
                    hotelNameError.style.display = 'none';
                }
            }

            function validateHotelLocation() {
                if (hotelLocationInput.value.length < 3 || hotelLocationInput.value.length > 100) {
                    hotelLocationInput.classList.add('is-invalid');
                    hotelLocationError.style.display = 'block';
                } else {
                    hotelLocationInput.classList.remove('is-invalid');
                    hotelLocationError.style.display = 'none';
                }
            }

            hotelNameInput.addEventListener('input', validateHotelName);
            hotelLocationInput.addEventListener('input', validateHotelLocation);

            form.addEventListener('submit', function (event) {
                let valid = true;

                // Validate hotelName on form submit
                if (hotelNameInput.value.length < 3 || hotelNameInput.value.length > 100) {
                    hotelNameInput.classList.add('is-invalid');
                    hotelNameError.style.display = 'block';
                    valid = false;
                } else {
                    hotelNameInput.classList.remove('is-invalid');
                    hotelNameError.style.display = 'none';
                }

                // Validate hotelLocation on form submit
                if (hotelLocationInput.value.length < 3 || hotelLocationInput.value.length > 100) {
                    hotelLocationInput.classList.add('is-invalid');
                    hotelLocationError.style.display = 'block';
                    valid = false;
                } else {
                    hotelLocationInput.classList.remove('is-invalid');
                    hotelLocationError.style.display = 'none';
                }

                // Show custom alert if invalid
                if (!valid) {
                    event.preventDefault();
                    alert('Please correct the errors in the form before submitting.');
                }
            });
        });
    </script>
</body>
</html>
