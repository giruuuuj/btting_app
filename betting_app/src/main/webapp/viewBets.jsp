<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fantasy Betting - View All Bets</title>
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
        .table {
            color: #fff;
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
        <h1 class="text-center">🏰 Fantasy Betting 🏰</h1>
        <h2 class="text-center">All Bets</h2>
        <table class="table table-dark table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>User Name</th>
                    <th>Bet Amount</th>
                    <th>Bet On</th>
                    <th>Result</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String url = "jdbc:mysql://localhost:3306/betting_app";
                    String user = "root";
                    String password = "1234";

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection(url, user, password);
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM bets");

                        while (rs.next()) {
                %>
                            <tr>
                                <td><%= rs.getInt("id") %></td>
                                <td><%= rs.getString("user_name") %></td>
                                <td>$<%= rs.getDouble("bet_amount") %></td>
                                <td><%= rs.getString("bet_on") %></td>
                                <td><%= rs.getString("result") %></td>
                            </tr>
                <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
        <div class="text-center">
            <a href="placeBet.jsp" class="btn btn-primary">Place a New Bet</a>
               
        </div>
    </div>
</body>
</html>