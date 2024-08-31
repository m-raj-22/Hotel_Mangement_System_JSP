<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("authenticatedUser") == null) {
        response.sendRedirect("index.html");
    }
%>
<html lang="en">
<head>
  <!-- Include the GreenSock Animation Platform -->
  <script src="https://unpkg.com/gsap@3.9.1">
    // Disable back button to prevent accessing secured pages
    history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
        });
  </script>
  

  <!-- Your existing head content -->
  <!-- ... -->

  <style>
    /* Your existing styles */
    body {
      font-family: 'Lato',sans-serif;
      margin: 0;
      padding: 0;
      background:linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('hotel2.jpg') center/cover no-repeat;
      background-blend-mode: darken ;
      color: #fff;
    }

    .container {
      padding: 50px;
      text-align: center;
    }

    h1 {
      font-size: 40px;
      margin-bottom: 20px;
      font-family: 'Pacifico', cursive;
    }

    p {
      font-size: 18px;
      margin-bottom: 30px;
    }

    .btn {
    font-size: 18px;
    margin: 10px;
    font-family: 'Raleway', sans-serif;
    border-radius: 5px;
    letter-spacing: 1px;
    display: inline-block;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    transition: background 0.3s, box-shadow 0.3s;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }

  #logoutBtn {
    color: #fff;
    background-color: #d9534f;
    border-color: #d9534f;
  }

  #aboutBtn {
    color: #fff;
    background-color: #78e074;
    border-color: #78e074;
  }

  #reserveBtn{
    color: #fff;
    background-color: #ff9ac4;
    border-color: #ff9ac4;
  }

  #viewReservationBtn {
    color: #fff;
    background-color: #9ae7ff;
    border-color: #9ae7ff;
  }
  </style>
</head>
<body>
  <div class="container">
    <h1 id="welcomeHeading">Welcome to Hotel Paradise</h1>
    <p id="description">Experience luxury and comfort like never before. Book your stay now!</p>

    <!-- Buttons -->
    <a href="logout.jsp" id="logoutBtn" class="btn btn-danger">Logout</a>
    <a href="hotel.jsp" id="aboutBtn" class="btn btn-primary">About Hotel</a>
    <a href="reservations.jsp" id="reserveBtn" class="btn btn-success">Reserve a Room</a>
    <a href="view.jsp" id="viewReservationBtn"   class="btn btn-success">View Reservations</a>

    <!-- Hotel Details -->
    <div id="hotelDetails" style="margin-top: 50px;">
      <h2>Hotel Details</h2>
      <p>Experience unparalleled luxury at our prestigious 5-star hotel, featuring exquisite design, top-notch amenities, and impeccable service. Your gateway to opulence and comfort awaits.</p>
    </div>

    <!-- Offers -->
    <div id="offers" style="margin-top: 50px;">
      <h3>Special Offers:</h3>
                <p>Check out our latest special offers and promotions:</p>
                <ul>
                    <li>Stay 3 nights, get the 4th night free!</li>
                    <li>20% off on spa services for hotel guests.</li>
                    <!-- Add more offers as needed -->
                </ul>
      </div>
  </div>

  <!-- JavaScript for animations -->
  <script>
    // Animation for welcome heading
    gsap.from("#welcomeHeading", { opacity: 0, y: -50, duration: 1, delay: 0.5 });

    // Animation for description
    gsap.from("#description", { opacity: 0, y: 50, duration: 1, delay: 1 });

    // Animation for buttons
    gsap.from(".btn", { opacity: 0, y: 20, duration: 1, delay: 1.5 });

    // Animation for hotel details
    gsap.from("#hotelDetails", { opacity: 0, y: 30, duration: 1, delay: 2 });

    // Animation for offers
    gsap.from("#offers", { opacity: 0, y: 30, duration: 1, delay: 2.5 });
  </script>
</body>
</html>