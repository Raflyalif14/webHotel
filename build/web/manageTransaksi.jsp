<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Controller.transaksiDao" %>
<%@ page import="Model.transaksiBean" %>
<%@ page import="Model.customerBean" %>
<%@ page import="Model.roomBean" %>
<%@ page import="Model.typeRoomBean" %>
<%@ page import="Controller.typeRoomDao" %>

<%
    String action = request.getParameter("action");
    transaksiDao dao = new transaksiDao();

    if ("create".equals(action)) {
        transaksiBean transaksi = new transaksiBean();
        customerBean customer = new customerBean();
        customer.setCustID(Integer.parseInt(request.getParameter("custID")));
        transaksi.setCustomer(customer);
        roomBean room = new roomBean();
        room.setRoomID(Integer.parseInt(request.getParameter("roomID")));
        transaksi.setRoom(room);
        transaksi.setCheckIn(java.sql.Date.valueOf(request.getParameter("checkIn")));
        transaksi.setCheckOut(java.sql.Date.valueOf(request.getParameter("checkOut")));
        dao.create(transaksi);
        response.sendRedirect("manageTransaksi.jsp");
        return;
    } else if ("update".equals(action)) {
        transaksiBean transaksi = new transaksiBean();
        transaksi.setTransactionID(Integer.parseInt(request.getParameter("transactionID")));
        customerBean customer = new customerBean();
        customer.setCustID(Integer.parseInt(request.getParameter("custID")));
        transaksi.setCustomer(customer);
        roomBean room = new roomBean();
        room.setRoomID(Integer.parseInt(request.getParameter("roomID")));
        transaksi.setRoom(room);
        transaksi.setCheckIn(java.sql.Date.valueOf(request.getParameter("checkIn")));
        transaksi.setCheckOut(java.sql.Date.valueOf(request.getParameter("checkOut")));
        dao.update(transaksi);
        response.sendRedirect("manageTransaksi.jsp");
        return;
    } else if ("delete".equals(action)) {
        transaksiBean transaksi = new transaksiBean();
        transaksi.setTransactionID(Integer.parseInt(request.getParameter("transactionID")));
        dao.delete(transaksi);
        response.sendRedirect("manageTransaksi.jsp");
        return;
    }
    List<transaksiBean> transaksiList = dao.read();
    
%><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Transaksi</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: lightslategray;
            color: white;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.9);
            background-color: #343a40;
        }
        .form-group label {
            color: white;
        }
        .form-control {
            background-color: transparent;
            border: 0;
            border-bottom: 2px solid white;
            display: block;
            width: 100%;
            padding: 10px 0;
            font-size: 18px;
            color: white;
        }
        .form-control:focus,
        .form-control:valid {
            outline: 0;
            border-bottom-color: lightblue;
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
        .table th,
        .table td {
            color: white;
        }
        .modal-content {
            background-color: #343a40;
            color: white;
        }
        .modal-header,
        .modal-footer {
            border-color: #495057;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Hotel Management</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="manageCustomers.jsp">Manage Customers</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="manageRooms.jsp">Manage Rooms</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="manageTransaksi.jsp">Manage Transaksi</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="manageTypeRoom.jsp">Manage Type Rooms</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <h1 class="mt-5">Manage Transaksi</h1>
    <form action="manageTransaksi.jsp" method="post" class="mb-3">
        <input type="hidden" name="action" value="create">
        <div class="form-group">
            <label for="custID">Customer ID</label>
            <input type="number" name="custID" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="roomID">Room ID</label>
            <input type="number" name="roomID" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="checkIn">Check In</label>
            <input type="date" name="checkIn" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="checkOut">Check Out</label>
            <input type="date" name="checkOut" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Create</button>
    </form>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Transaction ID</th>
                <th>Customer ID</th>
                <th>Room ID</th>
                <th>Check In</th>
                <th>Check Out</th>
                <th>Total Price</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% for (transaksiBean transaksi : transaksiList) { %>
            <tr>
                <td><%= transaksi.getTransactionID() %></td>
                <td><%= transaksi.getCustomer().getCustID() %></td>
                <td><%= transaksi.getRoom().getRoomID() %></td>
                <td><%= transaksi.getCheckIn() %></td>
                <td><%= transaksi.getCheckOut() %></td>
                <td><%= transaksi.getTotalPrice() %></td>
                <td>
                    <form action="manageTransaksi.jsp" method="post" style="display: inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="transactionID" value="<%= transaksi.getTransactionID() %>">
                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
