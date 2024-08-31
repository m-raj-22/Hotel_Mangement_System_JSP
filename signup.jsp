<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up Page</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/hotel_management";
    String dbUser = "root";
    String dbPassword = "Password";

    String signupUsername = request.getParameter("signupUsername");
    String signupPassword = request.getParameter("signupPassword");

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, signupUsername);
        preparedStatement.setString(2, signupPassword);
        int rowsAffected = preparedStatement.executeUpdate();

        if (rowsAffected > 0) {
            // Successful signup, redirect to another page or perform other actions
            response.sendRedirect("welcome.jsp");
        } else {
            // Signup failed, show an error message
            out.println("<p style='color:red;'>Signup failed. Please try again.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close the database connections
        if (preparedStatement != null) preparedStatement.close();
        if (connection != null) connection.close();
    }
%>

</body>
</html>
