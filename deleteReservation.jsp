<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
String jdbcUrl = "jdbc:mysql://localhost:3306/hotel_management";
String dbUser = "root";
String dbPassword = "Password";


    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // Get the reservation ID from the request parameter
        String reservationId = request.getParameter("reservationId");

        // SQL query to delete the reservation
        String deleteSql = "DELETE FROM reservations WHERE reservation_id = ?";
        preparedStatement = connection.prepareStatement(deleteSql);
        preparedStatement.setString(1, reservationId);
        int rowsAffected = preparedStatement.executeUpdate();

        if (rowsAffected > 0) {
            // Reservation deleted successfully, redirect to view reservations page
            response.sendRedirect("view.jsp");
        } else {
            // Something went wrong with the deletion
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    } finally {
        try {
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>