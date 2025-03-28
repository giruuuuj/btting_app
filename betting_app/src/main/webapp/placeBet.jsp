<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fantasy Betting - Place Your Bet</title>
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
        <p>Place your bet and join the adventure!</p>
        <form action="processBet.jsp" method="post">
            <div class="mb-3">
                <label for="userName" class="form-label">Your Name:</label>
                <input type="text" class="form-control" id="userName" name="userName" required>
            </div>
            <div class="mb-3">
                <label for="betAmount" class="form-label">Bet Amount:</label>
                <input type="number" class="form-control" id="betAmount" name="betAmount" step="0.01" required>
            </div>
            <div class="mb-3">
                <label for="betOn" class="form-label">Bet On:</label>
                <select class="form-select" id="betOn" name="betOn" required>
                    <option value="Team A">⚔️ royal changer bangloryg</option>
                    <option value="Team B">🛡️ mumbai indian </option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Place Bet</button>
        </form>
    </div>
</body>
</html>