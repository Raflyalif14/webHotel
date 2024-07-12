package Servlet;

import Model.customerBean;
import connDriver.connDriver;
import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class loginServlet extends HttpServlet {

    Connection conn;
    PreparedStatement stmt;
    ResultSet rs;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        String Uname = request.getParameter("username");
        String Pname = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connDriver cnc = new connDriver();
            conn = cnc.connDriverr();

            String sql = "SELECT * FROM customer WHERE Cust_Name=? AND Cust_Password=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, Uname);
            stmt.setString(2, Pname);

            rs = stmt.executeQuery();

            if (rs.next()) {
                customerBean cust = new customerBean();
                cust.setCustName(rs.getString("Cust_Name"));
                cust.setCustEmail(rs.getString("Cust_Email"));
                cust.setCustPassword(rs.getString("Cust_Password"));
                cust.setCustPhone(rs.getString("Cust_Phone"));
                cust.setCustID(rs.getInt("Cust_ID"));
                String roll = rs.getString("roll");

                HttpSession session = request.getSession();
                session.setAttribute("Cust_ID", cust.getCustID());
                session.setAttribute("Cust_Name", cust.getCustName());

                if ("admin".equals(roll)) {
                    response.sendRedirect("homeAdmin.jsp");
                } else {
                    response.sendRedirect("home.jsp");
                }
            } else {
                request.setAttribute("errorMessage", "Login failed: incorrect username or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException | SQLException e) {
            request.setAttribute("errorMessage", "Login failed: an error occurred.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}