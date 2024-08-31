<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("authenticatedUser") == null) {
        response.sendRedirect("index.html");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Hotel - Welcome</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: url('hotel3.jpg') center/cover no-repeat;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .welcome-message {
            text-align: center;
            margin-top: 30px;
        }

        h2 {
            color: #333;
            font-size: 36px;
            margin-bottom: 10px;
        }

        p {
            color: #666;
            font-size: 18px;
            margin-bottom: 20px;
        }

        .hotel-info {
            display: flex;
            justify-content: space-between;
            margin-top: 40px;
        }

        .hotel-image {
            flex: 1;
            max-width: 50%;
            margin-right: 20px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .hotel-image img {
            width: 100%;
            height: auto;
            display: block;
        }

        .hotel-details {
            flex: 1;
        }

        h3 {
            color: #333;
            font-size: 28px;
            margin-bottom: 15px;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        li {
            color: #555;
            font-size: 16px;
            margin-bottom: 10px;
        }

        a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="welcome-message">
            <h2>Welcome to Our Luxury Hotel</h2>
            <p>Hello, <strong><%= session.getAttribute("authenticatedUser") %></strong>! We're delighted to have you with us.</p>

            <div class="hotel-info">
                <div class="hotel-image">
                    <!-- Include an image for your hotel -->
                    <img src="hotel4.jpg" alt="Hotel Image">
                </div>

                <div class="hotel-details">
                    <h3>Experience Unmatched Luxury</h3>
                    <ul>
                        <li>Luxurious 5-star hotel with a stellar reputation.</li>
                        <li>Elegant and sophisticated interior design throughout.</li>
                        <li>World-class amenities, including a spa, fitness center, and multiple dining options.</li>
                        <li>Impeccable service from well-trained and courteous staff.</li>
                        <li>Spacious and well-appointed rooms with modern furnishings.</li>
                        <li>Breathtaking views from rooms and common areas.</li>
                        <li>High standards of cleanliness and hygiene.</li>
                        <li>A haven for both business and leisure travelers seeking the epitome of luxury.</li>
                      </ul>
                      
                    <p><a href="reservations.jsp">Book Your Stay</a></p>
                </div>
            </div>

            <p><a href="logout.jsp">Logout</a></p>
        </div>
    </div>
</body>
</html>

