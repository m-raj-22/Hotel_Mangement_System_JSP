<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("authenticatedUser") == null) {
        response.sendRedirect("index.html");
    }
%>
<html>
<head>
    <title>Welcome to Hotel Management System</title>
    <link rel="stylesheet" href="styles.css">
    <script>
        // Disable back button to prevent accessing secured pages
        history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
        });
    </script>
</head>
<body>
    <div class="container">
        <div class="welcome-message">
            <h2>Welcome to Our Hotel Management System</h2>
            <p>Hello, <%= session.getAttribute("authenticatedUser") %>!</p>

            <div class="features">
                <h3>Features:</h3>
                <ul>
                    <li><a href="hotel.jsp">View Hotel Information</a></li>
                    <li><a href="reservations.jsp">Manage Reservations</a></li>
                    <!-- Add more features as needed -->
                </ul>
            </div>

            <div class="offers">
                <h3>Special Offers:</h3>
                <p>Check out our latest special offers and promotions:</p>
                <ul>
                    <li>Stay 3 nights, get the 4th night free!</li>
                    <li>20% off on spa services for hotel guests.</li>
                    <!-- Add more offers as needed -->
                </ul>
            </div>

            <div class="events">
                <h3>Upcoming Events:</h3>
                <p>Don't miss our upcoming events and activities:</p>
                <ul>
                    <li>Live music every Friday night in the lobby.</li>
                    <li>Outdoor yoga sessions by the pool.</li>
                    <!-- Add more events as needed -->
                </ul>
            </div>

            <p><a href="logout.jsp">Logout</a></p>
        </div>
    </div>
</body>
</html>
