<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Model.typeRoomBean" %>
<%@ page import="Controller.typeRoomDao" %>
<%@ page import="Model.customerBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.roomBean" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Booking</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: lightslategray;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.9);
            background-color: #343a40;
        }
        .booking-container {
            margin: 50px auto;
            max-width: 800px;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.9);
            background-color: #343a40;
        }
        .auth-container h2 {
            color: #ffffff;
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-control {
            background-color: transparent;
            border: 0;
            border-bottom: 2px #fff solid;
            display: block;
            width: 100%;
            padding: 10px 0;
            font-size: 18px;
            color: #fff;
        }
        .form-control:focus,
        .form-control:valid {
            outline: 0;
            border-bottom-color: lightblue;
        }
        .form-control:focus+label span,
        .form-control:valid+label span {
            color: lightblue;
            transform: translateY(-30px);
        }
        .btn {
            padding: 15px 25px;
            border: unset;
            border-radius: 15px;
            color: #212121;
            z-index: 1;
            background: #e8e8e8;
            position: relative;
            font-weight: 1000;
            font-size: 17px;
            box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
            transition: all 250ms;
            overflow: hidden;
        }
        .btn::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 0;
            border-radius: 15px;
            background-color: #212121;
            z-index: -1;
            box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
            transition: all 250ms;
        }
        .btn:hover {
            color: #e8e8e8;
        }
        .btn:hover::before {
            width: 100%;
        }
        .form-control label {
            position: absolute;
            top: 15px;
            left: 0;
            pointer-events: none;
            color: #fff;
        }
        .form-control label span {
            display: inline-block;
            font-size: 18px;
            min-width: 5px;
            color: #fff;
            transition: transform 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
        }
        .form-control input:focus+label span,
        .form-control input:valid+label span {
            color: lightblue;
            transform: translateY(-30px);
        }
    </style>
</head>
<body style="color: #fff">
<div class="container">
    <div class="booking-container">
        <h2 class="text-center">Book Your Stay</h2>
        <form action="CheckAvailabilityServlet" method="post">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="roomTypeID">
                        <span style="transition-delay:100ms">S</span><span style="transition-delay:150ms">e</span><span style="transition-delay:200ms">l</span><span style="transition-delay:250ms">e</span><span style="transition-delay:300ms">c</span><span style="transition-delay:350ms">t</span> <span style="transition-delay:400ms">R</span><span style="transition-delay:450ms">o</span><span style="transition-delay:500ms">o</span><span style="transition-delay:550ms">m</span> <span style="transition-delay:600ms">T</span><span style="transition-delay:650ms">y</span><span style="transition-delay:700ms">p</span><span style="transition-delay:750ms">e</span>
                    </label>
                    <select id="roomTypeID" name="roomTypeID" class="form-control">
                        <%
                            typeRoomDao typeDao = new typeRoomDao();
                            List<typeRoomBean> typeRoomList = typeDao.read();
                            for (typeRoomBean type : typeRoomList) {
                        %>
                        <option value="<%= type.getRoomTypeID()%>"><%= type.getRoomType()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="form-group col-md-3">
                    <label for="checkIn">
                        <span style="transition-delay:100ms">C</span><span style="transition-delay:150ms">h</span><span style="transition-delay:200ms">e</span><span style="transition-delay:250ms">c</span><span style="transition-delay:300ms">k</span>-<span style="transition-delay:350ms">i</span><span style="transition-delay:400ms">n</span> <span style="transition-delay:450ms">D</span><span style="transition-delay:500ms">a</span><span style="transition-delay:550ms">t</span><span style="transition-delay:600ms">e</span>
                    </label>
                    <input type="date" class="form-control" id="checkIn" name="checkIn" required>
                </div>
                <div class="form-group col-md-3">
                    <label for="checkOut">
                        <span style="transition-delay:100ms">C</span><span style="transition-delay:150ms">h</span><span style="transition-delay:200ms">e</span><span style="transition-delay:250ms">c</span><span style="transition-delay:300ms">k</span>-<span style="transition-delay:350ms">o</span><span style="transition-delay:400ms">u</span><span style="transition-delay:450ms">t</span> <span style="transition-delay:500ms">D</span><span style="transition-delay:550ms">a</span><span style="transition-delay:600ms">t</span><span style="transition-delay:650ms">e</span>
                    </label>
                    <input type="date" class="form-control" id="checkOut" name="checkOut" required>
                </div>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Check Availability</button>
            <button type="button" class="btn btn-secondary btn-block" onclick="window.history.back()">Back</button>
        </form>
    </div>

    <%
        String availability = (String) request.getAttribute("availability");
        if ("available".equals(availability)) {
    %>
    <div class="mt-5">
        <form action="PaymentServlet" method="post">
            <div class="form-group">
                <label for="roomID">
                    <span style="transition-delay:100ms">S</span><span style="transition-delay:150ms">e</span><span style="transition-delay:200ms">l</span><span style="transition-delay:250ms">e</span><span style="transition-delay:300ms">c</span><span style="transition-delay:350ms">t</span> <span style="transition-delay:400ms">R</span><span style="transition-delay:450ms">o</span><span style="transition-delay:500ms">o</span><span style="transition-delay:550ms">m</span> <span style="transition-delay:600ms">N</span><span style="transition-delay:650ms">u</span><span style="transition-delay:700ms">m</span><span style="transition-delay:750ms">b</span><span style="transition-delay:800ms">e</span><span style="transition-delay:850ms">r</span>
                </label>
                <select id="roomID" name="roomID" class="form-control">
                    <%
                        List<roomBean> availableRooms = (List<roomBean>) request.getAttribute("availableRooms");
                        for (roomBean room : availableRooms) {
                    %>
                    <option value="<%= room.getRoomID()%>"><%= room.getRoomNumber()%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <input type="hidden" name="totalPrice" value="<%= request.getAttribute("totalPrice")%>">
            <input type="hidden" name="roomTypeID" value="<%= request.getAttribute("roomTypeID")%>">
            <input type="hidden" name="checkIn" value="<%= request.getAttribute("checkIn")%>">
            <input type="hidden" name="checkOut" value="<%= request.getAttribute("checkOut")%>">
            <input type="hidden" name="custID" value="<%= session.getAttribute("Cust_ID")%>">
            <input type="hidden" name="custName" value="<%= session.getAttribute("Cust_Name")%>">
            <button type="submit" class="btn btn-success btn-block">Proceed to Payment</button>
        </form>

        <h2 class="text-center">Booking Details</h2>
        <p>Price per Night: $<%= request.getAttribute("pricePerNight")%></p>
        <p>Total Price: $<%= request.getAttribute("totalPrice")%></p>
        <p>Facility: <%= request.getAttribute("facility")%></p>
        <p>Room Type ID: <%= request.getAttribute("roomTypeID")%></p>
        <p>Check In: <%= request.getAttribute("checkIn")%></p>
        <p>Check Out: <%= request.getAttribute("checkOut")%></p>
        <p>Cust ID: <%= session.getAttribute("Cust_ID")%></p>
        <p>Cust Name: <%= session.getAttribute("Cust_Name")%></p>
    </div>
    <% } else if ("unavailable".equals(availability)) { %>
    <div class="mt-5 alert alert-danger">
        <p>The selected room type is not available for the chosen dates. Please choose different dates or room type.</p>
    </div>
    <% }%>
</div>

    <script>
        // Mendapatkan elemen input tanggal
        var checkInInput = document.getElementById('checkIn');
        var checkOutInput = document.getElementById('checkOut');

        // Mendapatkan tanggal hari ini dalam format YYYY-MM-DD
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = today.getFullYear();
        var todayFormatted = yyyy + '-' + mm + '-' + dd;

        // Set nilai atribut 'min' pada elemen input tanggal
        checkInInput.setAttribute('min', todayFormatted);
        checkOutInput.setAttribute('min', todayFormatted);
    </script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>