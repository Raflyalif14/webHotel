<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/Css/styles.css" rel="stylesheet">

    <title>Login Page</title>
    <style>
        body {
            background-color: lightslategray;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 400px;
            margin: 100px auto;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.9);
            background-color: #343a40;
        }

        button {
            padding: 15px 25px;
            border: unset;
            border-radius: 15px;
            color: #212121;
            z-index: 1;
            background: #e8e8e8;
            position: relative;
            font-weight: 1000;
            font-size: 17px;
            -webkit-box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
            box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
            transition: all 250ms;
            overflow: hidden;
        }

        button::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 0;
            border-radius: 15px;
            background-color: #212121;
            z-index: -1;
            -webkit-box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
            box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
            transition: all 250ms;
        }

        button:hover {
            color: #e8e8e8;
        }

        button:hover::before {
            width: 100%;
        }

        .form-control {
            position: relative;
            margin: 20px 0 40px;
            width: 190px;
        }

        .form-control input {
            background-color: transparent;
            border: 0;
            border-bottom: 2px #fff solid;
            display: block;
            width: 100%;
            padding: 15px 0;
            font-size: 18px;
            color: #fff;
        }

        .form-control input:focus,
        .form-control input:valid {
            outline: 0;
            border-bottom-color: lightblue;
        }

        .form-control label {
            position: absolute;
            top: 15px;
            left: 0;
            pointer-events: none;
        }

        .form-control label span {
            display: inline-block;
            font-size: 18px;
            min-width: 5px;
            color: #fff;
            -webkit-transition: 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
            transition: 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
        }

        .form-control input:focus+label span,
        .form-control input:valid+label span {
            color: lightblue;
            -webkit-transform: translateY(-30px);
            -ms-transform: translateY(-30px);
            transform: translateY(-30px);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="auth-container">
            <h2 class="text-center" style="color: #ffffff">Login</h2>
            <form action="LoginServlet" method="post">
                <div class="form-group">
                    <div class="form-control">
                        <input type="text" id="username" name="username" required>
                        <label>
                            <span style="transition-delay:100ms">U</span><span style="transition-delay:150ms">s</span><span style="transition-delay:200ms">e</span><span style="transition-delay:250ms">r</span><span style="transition-delay:200ms">n</span><span style="transition-delay:250ms">a</span><span style="transition-delay:300ms">m</span><span style="transition-delay:350ms">e</span>
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-control">
                        <input type="password" id="password" name="password" required>
                        <label>
                            <span style="transition-delay:0ms">P</span><span style="transition-delay:150ms">a</span><span style="transition-delay:100ms">s</span><span style="transition-delay:150ms">s</span><span style="transition-delay:200ms">w</span><span style="transition-delay:250ms">o</span><span style="transition-delay:300ms">r</span><span style="transition-delay:350ms">d</span>
                        </label>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Login</button>
                <p style="color: #f2f2f2">Don't have an account? <a href="register.jsp" style="color: #fff"> Register</a></p>
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger" role="alert" style="margin-top: 20px;">
                        ${errorMessage}
                    </div>
                </c:if>
            </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js