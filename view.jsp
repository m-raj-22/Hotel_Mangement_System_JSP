<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>View Reservations</title>
    <link rel="stylesheet" href="styles.css">
    <style>
  
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: url('hotel6.webp') center/cover no-repeat;
            background-color: #f4f4f4;
        }

        .reservations-table {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            font-family: 'Arial', sans-serif;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .delete-button {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 8px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="reservations-table">
            <h2>View Reservations</h2>
            <table>
                <thead>
                    <tr>
                        <th>Reservation ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Check-in Date</th>
                        <th>Check-out Date</th>
                        <th>Room Type</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    String jdbcUrl = "jdbc:mysql://localhost:3306/hotel_management";
                    String dbUser = "root";
                    String dbPassword = ""Password;

                        Connection connection = null;
                        Statement statement = null;
                        ResultSet resultSet = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

                            String sql = "SELECT * FROM reservations";
                            statement = connection.createStatement();
                            resultSet = statement.executeQuery(sql);

                            while (resultSet.next()) {
                                String reservationId = resultSet.getString("reservation_id");
                                %>
                                <tr>
                                    <td><%= reservationId %></td>
                                    <td><%= resultSet.getString("name") %></td>
                                    <td><%= resultSet.getString("email") %></td>
                                    <td><%= resultSet.getString("check_in") %></td>
                                    <td><%= resultSet.getString("check_out") %></td>
                                    <td><%= resultSet.getString("room_type") %></td>
                                    <td>
                                        <form action="deleteReservation.jsp" method="post">
                                            <input type="hidden" name="reservationId" value="<%= reservationId %>">
                                            <button class="delete-button" type="submit">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                                <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            try {
                                if (resultSet != null) resultSet.close();
                                if (statement != null) statement.close();
                                if (connection != null) connection.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
