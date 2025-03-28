<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userName = request.getParameter("userName");
    double betAmount = Double.parseDouble(request.getParameter("betAmount"));
    String betOn = request.getParameter("betOn");

    // Simulate a random result
    String[] results = {"Win", "Lose"};
    String result = results[(int)(Math.random() * results.length)];

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/betting_app";
    String user = "root";
    String password = "1234";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);
        String sql = "INSERT INTO bets (user_name, bet_amount, bet_on, result) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userName);
        pstmt.setDouble(2, betAmount);
        pstmt.setString(3, betOn);
        pstmt.setString(4, result);
        pstmt.executeUpdate();
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
    <title>Fantasy Betting - Bet Result</title>
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
    <div class="container text-center">
        <h1>🏰 Fantasy Betting 🏰</h1>
        <h2>Bet Result</h2>
        <p>Hello, <%= userName %>!</p>
        <p>You bet $<%= betAmount %> on <%= betOn %>.</p>
        <p>Result: <strong><%= result %></strong></p>
        <a href="placeBet.jsp" class="btn btn-primary">Place Another Bet</a>
             <a href="viewBets.jsp" class="btn btn-primary">views Bet</a>
    </div>
</body>
</html>