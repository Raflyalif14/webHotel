<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Controller.typeRoomDao" %>
<%@ page import="Model.typeRoomBean" %>

<%
    String action = request.getParameter("action");
    typeRoomDao dao = new typeRoomDao();
    
    if ("create".equals(action)) {
        typeRoomBean typeRoom = new typeRoomBean();
        typeRoom.setRoomType(request.getParameter("roomType"));
        typeRoom.setPrice(Integer.parseInt(request.getParameter("price")));
        typeRoom.setFacility(request.getParameter("facility"));
        dao.create(typeRoom);
        response.sendRedirect("manageTypeRoom.jsp");
        return;
    } else if ("update".equals(action)) {
        typeRoomBean typeRoom = new typeRoomBean();
        typeRoom.setRoomTypeID(Integer.parseInt(request.getParameter("roomTypeID")));
        typeRoom.setRoomType(request.getParameter("roomType"));
        typeRoom.setPrice(Integer.parseInt(request.getParameter("price")));
        typeRoom.setFacility(request.getParameter("facility"));
        dao.update(typeRoom);
        response.sendRedirect("manageTypeRoom.jsp");
        return;
    } else if ("delete".equals(action)) {
        typeRoomBean typeRoom = new typeRoomBean();
        typeRoom.setRoomTypeID(Integer.parseInt(request.getParameter("roomTypeID")));
        dao.delete(typeRoom);
        response.sendRedirect("manageTypeRoom.jsp");
        return;
    }
    
    List<typeRoomBean> typeRoomList = dao.read();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Type Rooms</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: lightslategray;
            font-family: Arial, sans-serif;
            color: white;
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
            border-bottom: 2px white solid;
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
    <h1 class="mt-5">Manage Type Rooms</h1>
    <form action="manageTypeRoom.jsp" method="post" class="mb-3">
        <input type="hidden" name="action" value="create">
        <div class="form-group">
            <label for="roomType">Room Type</label>
            <input type="text" name="roomType" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="price">Price</label>
            <input type="number" name="price" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="facility">Facility</label>
            <input type="text" name="facility" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Type Room</button>
    </form>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Room Type</th>
                <th>Price</th>
                <th>Facility</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <% for (typeRoomBean typeRoom : typeRoomList) { %>
            <tr>
                <td><%= typeRoom.getRoomTypeID() %></td>
                <td><%= typeRoom.getRoomType() %></td>
                <td><%= typeRoom.getPrice() %></td>
                <td><%= typeRoom.getFacility() %></td>
                <td>
                    <form action="manageTypeRoom.jsp" method="post" style="display:inline-block;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="roomTypeID" value="<%= typeRoom.getRoomTypeID() %>">
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#editModal<%= typeRoom.getRoomTypeID() %>">
                        Edit
                    </button>
                    <!-- Modal -->
                    <div class="modal fade" id="editModal<%= typeRoom.getRoomTypeID() %>" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editModalLabel">Edit Type Room</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="manageTypeRoom.jsp" method="post">
                                        <input type="hidden" name="action" value="update">
                                        <input type="hidden" name="roomTypeID" value="<%= typeRoom.getRoomTypeID() %>">
                                        <div class="form-group">
                                            <label for="roomType">Room Type</label>
                                            <input type="text" name="roomType" class="form-control" value="<%= typeRoom.getRoomType() %>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="price">Price</label>
                                            <input type="number" name="price" class="form-control" value="<%= typeRoom.getPrice() %>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="facility">Facility</label>
                                            <input type="text" name="facility" class="form-control" value="<%= typeRoom.getFacility() %>" required>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
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
