<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register Page</title>
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
                transition: all 250ms
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
                <h2 class="text-center" style="color: #ffffff">Register</h2>
                <form action="RegisterServlet" method="post" style="color: #f2f2f2">
                    <!-- Display error message if it exists -->
                    <c:if test="${not empty message}">
                        <p style="color: red;">${message}</p>
                    </c:if>
                    <div class="form-group">
                        <div class="form-control">
                            <input type="text" id="name" name="name" required>
                            <label for="name">
                                <span style="transition-delay:100ms">N</span><span style="transition-delay:150ms">a</span><span style="transition-delay:200ms">m</span><span style="transition-delay:250ms">e</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-control">
                            <input type="email" id="email" name="email" required>
                            <label for="email">
                                <span style="transition-delay:100ms">E</span><span style="transition-delay:150ms">m</span><span style="transition-delay:200ms">a</span><span style="transition-delay:250ms">i</span><span style="transition-delay:300ms">l</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-control">
                            <input type="password" class="form-control" id="password" name="password" required>
                            <label for="password">
                                <span style="transition-delay:100ms">P</span><span style="transition-delay:150ms">a</span><span style="transition-delay:200ms">s</span><span style="transition-delay:250ms">s</span><span style="transition-delay:300ms">w</span><span style="transition-delay:350ms">o</span><span style="transition-delay:400ms">r</span><span style="transition-delay:450ms">d</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-control">
                            <input type="text" class="form-control" id="phone" name="phone" required>
                            <label for="phone">
                                <span style="transition-delay:100ms">P</span><span style="transition-delay:150ms">h</span><span style="transition-delay:200ms">o</span><span style="transition-delay:250ms">n</span><span style="transition-delay:250ms">e</span>
                            </label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Register</button>
                </form>
                <p class="text-center mt-3" style="color: #fff">Already have an account? <a href="login.jsp" style="color: #fff">Login</a></p>
            </div>
        </div>
    </body>
</html>
