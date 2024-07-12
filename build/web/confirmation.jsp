<%-- 
    Document   : confirmation
    Created on : 7 Jul 2024, 19.35.24
    Author     : nizamaufar
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Confirmation</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .confirmation-container {
            margin: 50px auto;
            max-width: 600px;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="confirmation-container">
            <h2 class="text-center">Payment Confirmation</h2>
            <p>Thank you for your payment. Your booking has been confirmed.</p>
            <a href="index.jsp" class="btn btn-primary btn-block">Go to Homepage</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
