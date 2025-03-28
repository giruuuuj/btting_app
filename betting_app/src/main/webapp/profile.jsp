<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if the user is logged in
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp"); // Redirect to login page if not logged in
    }

    int userId = (int) session.getAttribute("userId");
    String username = (String) session.getAttribute("username");

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/betting_app";
    String dbUser = "root";
    String dbPassword = "1234";

    double balance = 0.0;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);
        String sql = "SELECT balance FROM users WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, userId);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            balance = rs.getDouble("balance");
        }
        rs.close();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fantasy Betting - Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('https://i.imgur.com/7QZ8QyC.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
        }
        .container {
            background: rgba(0, 0, 0, 0.7);
            padding: 2rem;
            border-radius: 10px;
            margin-top: 5rem;
        }
        h1 {
            font-family: 'Fantasy', cursive;
            color: #ffcc00;
        }
        .btn-primary {
            background-color: #ffcc00;
            border: none;
            color: #000;
        }
        .btn-primary:hover {
            background-color: #e6b800;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🏰 Fantasy Betting 🏰</h1>
        <h2>Profile</h2>
        <p>Welcome, <%= username %>!</p>
        <p>Your balance: $<%= balance %></p>
        <a href="placeBet.jsp" class="btn btn-primary">Place a Bet</a>
        <a href="logout.jsp" class="btn btn-danger">Logout</a>
    </div>
</body>
</html>