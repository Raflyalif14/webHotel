package Servlet;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import connDriver.connDriver;
@WebServlet("/CompletePaymentServlet")
public class CompletePaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double totalPrice;
        int custID;
        int roomID;
        Date checkIn;
        Date checkOut;

        totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        custID = Integer.parseInt(request.getParameter("custID"));
        roomID = Integer.parseInt(request.getParameter("roomID"));
        checkIn = Date.valueOf(request.getParameter("checkIn"));
        checkOut = Date.valueOf(request.getParameter("checkOut"));

        try (Connection conn = new connDriver().connDriverr()) {
            String sql = "INSERT INTO transaksi (Cust_ID, Room_ID, Check_in_date, Check_out_date, Total_price) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, custID);
                ps.setInt(2, roomID);
                ps.setDate(3, checkIn);
                ps.setDate(4, checkOut);
                ps.setDouble(5, totalPrice);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error occurred while processing the payment.");
        }

        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("custID", custID);
        request.setAttribute("roomID", roomID);
        request.setAttribute("checkIn", checkIn);
        request.setAttribute("checkOut", checkOut);

        request.getRequestDispatcher("paymentSuccess.jsp").forward(request, response);
    }
}