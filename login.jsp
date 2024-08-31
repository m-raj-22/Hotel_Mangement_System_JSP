<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="styles.css">
    <script>

        $(document).ready(function() {
            function disableBack() { window.history.forward() }
        
            window.onload = disableBack();
            window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
        });
        </script>
</head>
<body>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
    String jdbcUrl = "jdbc:mysql://localhost:3306/hotel_management";
    String dbUser = "root";
    String dbPassword = "PASSWORD";

    // Get user input from the HTML form
    String loginUsername = request.getParameter("loginUsername");
    String loginPassword = request.getParameter("loginPassword");

    // Database variables
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the database connection
        connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // Prepare SQL query to check the user credentials
        String sql = "SELECT * FROM users WHERE username=? AND password=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, loginUsername);
        preparedStatement.setString(2, loginPassword);

        // Execute the query
        resultSet = preparedStatement.executeQuery();

        // Check if the user exists
        if (resultSet.next()) {
            // Successful login, set session attribute and redirect
            session.setAttribute("authenticatedUser", loginUsername);
            response.sendRedirect("welcome.jsp");
        } else {
            // Invalid login, show an error message
            out.println("<p style='color:red;'>Invalid username or password</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close the database connections
        try {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>