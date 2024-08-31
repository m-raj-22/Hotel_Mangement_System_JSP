<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Reservation</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&family=Open+Sans:wght@400&display=swap">
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
            margin: 0;
            padding: 0;
            background: url('hotel3.jpg') center/cover no-repeat;
            background-size: cover;
            overflow: hidden;
        }

        
        .reservation-form {
            max-width: 600px;
            margin: 0 auto;
            padding: 40px;
            background-color: #f9f9f9;
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-family: 'Montserrat', sans-serif;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .reservation-form label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        .reservation-form input,
        .reservation-form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            color: #333;
        }

        .reservation-form button {
            padding: 12px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 16px;
            letter-spacing: 1px;
            font-weight: bold;
        }

        .reservation-form button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="reservation-form">
            <h2>Hotel Reservation</h2>
            <form action="processReservation.jsp" method="post">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="checkIn">Check-in Date:</label>
                <input type="date" id="checkIn" name="checkIn" required>

                <label for="checkOut">Check-out Date:</label>
                <input type="date" id="checkOut" name="checkOut" required>

                <label for="roomType">Room Type:</label>
                <select id="roomType" name="roomType" required>
                    <option value="standard">Standard</option>
                    <option value="deluxe">Deluxe</option>
                    <option value="suite">Suite</option>
                </select>

                <button type="submit">Book Now</button>
            </form>
        </div>
    </div>

    <script src="https://unpkg.com/gsap@3.9.1"></script>
    <script>
        gsap.from(".container", { opacity: 0, y: -50, duration: 1, delay: 0.5 });
        gsap.from(".reservation-form", { opacity: 0, y: 50, duration: 1, delay: 1 });
    </script>
</body>
</html>
