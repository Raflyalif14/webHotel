package Servlet;

import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double totalPrice;
        int custID;
        int roomID;
        String checkInStr = request.getParameter("checkIn");
        String checkOutStr = request.getParameter("checkOut");

        totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        custID = Integer.parseInt(request.getParameter("custID"));
        roomID = Integer.parseInt(request.getParameter("roomID"));
        Date checkIn = Date.valueOf(checkInStr);
        Date checkOut = Date.valueOf(checkOutStr);

        Random random = new Random();
        int accountNumber = 100000000 + random.nextInt(900000000);

        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("accountNumber", accountNumber);
        request.setAttribute("custID", custID);
        request.setAttribute("roomID", roomID);
        request.setAttribute("checkIn", checkIn);
        request.setAttribute("checkOut", checkOut);

        request.getRequestDispatcher("payment.jsp").forward(request, response);
    }
}