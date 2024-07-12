<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Controller.customerDao" %>
<%@ page import="Model.customerBean" %>
<%
    String action = request.getParameter("action");
    customerDao dao = new customerDao();
    
    if ("create".equals(action)) {
        customerBean cust = new customerBean();
        cust.setCustName(request.getParameter("name"));
        cust.setCustPassword(request.getParameter("password"));
        cust.setCustEmail(request.getParameter("email"));
        cust.setCustPhone(request.getParameter("phone"));
        dao.create(cust);
    } else if ("update".equals(action)) {
        customerBean cust = new customerBean();
        cust.setCustID(Integer.parseInt(request.getParameter("id")));
        cust.setCustName(request.getParameter("name"));
        cust.setCustPassword(request.getParameter("password"));
        cust.setCustEmail(request.getParameter("email"));
        cust.setCustPhone(request.getParameter("phone"));
        dao.update(cust);
    } else if ("delete".equals(action)) {
        customerBean cust = new customerBean();
        cust.setCustID(Integer.parseInt(request.getParameter("id")));
        dao.Delete(cust);
    }
    
    List<customerBean> customerList = dao.Read(new customerBean());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Customers</title>
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
    <h1 class="mt-5">Manage Customers</h1>
    <form action="manageCustomers.jsp" method="post" class="mb-3">
        <input type="hidden" name="action" value="create">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" name="name" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" name="email" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="text" name="phone" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Customer</button>
    </form>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Password</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <% for (customerBean cust : customerList) { %>
            <tr>
                <td><%= cust.getCustID() %></td>
                <td><%= cust.getCustName() %></td>
                <td><%= cust.getCustPassword() %></td>
                <td><%= cust.getCustEmail() %></td>
                <td><%= cust.getCustPhone() %></td>
                <td>
                    <form action="manageCustomers.jsp" method="post" style="display:inline-block;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= cust.getCustID() %>">
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#editModal<%= cust.getCustID() %>">
                        Edit
                    </button>
                    <!-- Modal -->
                    <div class="modal fade" id="editModal<%= cust.getCustID() %>" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editModalLabel">Edit Customer</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="manageCustomers.jsp" method="post">
                                        <input type="hidden" name="action" value="update">
                                        <input type="hidden" name="id" value="<%= cust.getCustID() %>">
                                        <div class="form-group">
                                            <label for="name">Name</label>
                                            <input type="text" name="name" class="form-control" value="<%= cust.getCustName() %>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="password">Password</label>
                                            <input type="password" name="password" class="form-control" value="<%= cust.getCustPassword() %>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="email" name="email" class="form-control" value="<%= cust.getCustEmail() %>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="phone">Phone</label>
                                            <input type="text" name="phone" class="form-control" value="<%= cust.getCustPhone() %>" required>
                                        </div>
                                        <button type="submit" class="btn btn-primary">
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
