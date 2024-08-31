<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.sql.*" %>
<%
    // Get form data
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String checkIn = request.getParameter("checkIn");
    String checkOut = request.getParameter("checkOut");
    String roomType = request.getParameter("roomType");

    // Generate a unique reservation ID
    String reservationId = UUID.randomUUID().toString();

    // Store reservation details in the database (replace with your database logic)
    String jdbcUrl = "jdbc:mysql://localhost:3306/hotel_management";
    String dbUser = "root";
    String dbPassword = "Happy@123";

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        String sql = "INSERT INTO reservations (reservation_id, name, email, check_in, check_out, room_type) VALUES (?, ?, ?, ?, ?, ?)";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, reservationId);
        preparedStatement.setString(2, name);
        preparedStatement.setString(3, email);
        preparedStatement.setString(4, checkIn);
        preparedStatement.setString(5, checkOut);
        preparedStatement.setString(6, roomType);

        int rowsAffected = preparedStatement.executeUpdate();

        if (rowsAffected > 0) {
            // Reservation successful, print receipt
            %>
            <html>
                <head>
                    <title>Reservation Receipt</title>
                    <link rel="stylesheet" href="styles.css">
                    <style>
                        /* Additional styles for the receipt page */
                        .reservation-receipt {
                            max-width: 600px;
                            margin: 20px auto;
                            padding: 20px;
                            background-color: #fff;
                            border-radius: 8px;
                            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                            font-family: 'Arial', sans-serif;
                        }

                        h2 {
                            color: #333;
                        }

                        p {
                            margin-bottom: 15px;
                            line-height: 1.5;
                        }

                        ul {
                            list-style-type: none;
                            padding: 0;
                        }

                        li {
                            margin-bottom: 8px;
                        }

                        .print-button {
                            padding: 12px;
                            background-color: #4caf50;
                            color: #fff;
                            border: none;
                            border-radius: 4px;
                            cursor: pointer;
                        }

                        .print-button:hover {
                            background-color: #45a049;
                        }
                    </style>
                </head>
                <body>
                    <div class="container">
                        <div class="reservation-receipt">
                            <h2>Reservation Receipt</h2>
                            <p>Thank you, <%= name %>, for choosing our hotel!</p>
                            <p>Your reservation details:</p>
                            <ul>
                                <li>Reservation ID: <%= reservationId %></li>
                                <li>Name: <%= name %></li>
                                <li>Email: <%= email %></li>
                                <li>Check-in Date: <%= checkIn %></li>
                                <li>Check-out Date: <%= checkOut %></li>
                                <li>Room Type: <%= roomType %></li>
                            </ul>
                            <p>We look forward to welcoming you!</p>

                            <!-- Print button to trigger JavaScript print function -->
                            <button class="print-button" onclick="printReceipt()">Print Receipt</button>
                        </div>
                    </div>

                    <script>
                        function printReceipt() {
                            var receiptContent = document.querySelector('.reservation-receipt').innerHTML;
                            var printWindow = window.open('', '_blank');
                            printWindow.document.open();
                            printWindow.document.write('<html><head><title>Print Receipt</title>');
                            printWindow.document.write('<link rel="stylesheet" href="styles.css"></head>');
                            printWindow.document.write('<body>' + receiptContent + '</body></html>');
                            printWindow.document.close();
                            printWindow.print();
                            window.location.href = 'welcome.jsp';
                        }
                    </script>
                </body>
                </html>
            <%
        } else {
            out.println("<p style='color:red;'>Reservation failed. Please try again.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
