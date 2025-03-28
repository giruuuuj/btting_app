<%@ page import="java.sql.*, java.security.MessageDigest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // Hash the password for security
    String hashedPassword = "";
    try {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(password.getBytes());
        byte[] bytes = md.digest();
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        hashedPassword = sb.toString();
    } catch (Exception e) {
        e.printStackTrace();
    }

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/betting_app";
    String dbUser = "root";
    String dbPassword = "1234";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);
        String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, email);
        pstmt.setString(3, hashedPassword);
        pstmt.executeUpdate();
        pstmt.close();
        conn.close();
        response.sendRedirect("login.jsp"); // Redirect to login page after successful registration
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>