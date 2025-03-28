<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fantasy Betting - Login</title>
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
        <h2>Login</h2>
        <form action="loginProcess.jsp" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
        <p class="mt-3">Don't have an account? <a href="register.jsp" class="text-warning">Register here</a></p>
    </div>
</body>
</html>