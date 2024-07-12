package Servlet;

import connDriver.connDriver;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import Model.roomBean; 

@WebServlet("/CheckAvailabilityServlet")
public class CheckAvailabilityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomTypeID = Integer.parseInt(request.getParameter("roomTypeID"));
        Date checkIn = Date.valueOf(request.getParameter("checkIn"));
        Date checkOut = Date.valueOf(request.getParameter("checkOut"));

        try (Connection conn = new connDriver().connDriverr()) {

            String sql = "SELECT Room_ID, Room_Number FROM room WHERE Room_Type_ID = ?";
            List<roomBean> allRooms = new ArrayList<>();
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, roomTypeID);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        roomBean room = new roomBean();
                        room.setRoomID(rs.getInt("Room_ID"));
                        room.setRoomNumber(rs.getInt("Room_Number"));
                        allRooms.add(room);
                    }
                }
            }

            sql = "SELECT DISTINCT Room_ID FROM transaksi WHERE Room_ID IN (SELECT Room_ID FROM room WHERE Room_Type_ID = ?) " +
                  "AND (Check_in_date BETWEEN ? AND ? OR Check_out_date BETWEEN ? AND ? OR ? BETWEEN Check_in_date AND Check_out_date)";
            List<Integer> bookedRooms = new ArrayList<>();
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, roomTypeID);
                ps.setDate(2, checkIn);
                ps.setDate(3, checkOut);
                ps.setDate(4, checkIn);
                ps.setDate(5, checkOut);
                ps.setDate(6, checkIn);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        bookedRooms.add(rs.getInt("Room_ID"));
                    }
                }
            }

            allRooms.removeIf(room -> bookedRooms.contains(room.getRoomID()));
            
            if (allRooms.isEmpty()) {
                request.setAttribute("availability", "unavailable");
            } else {
                sql = "SELECT Price, Room_Facility FROM type_room WHERE RoomType_ID = ?";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setInt(1, roomTypeID);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            int pricePerNight = rs.getInt("Price");
                            String facility = rs.getString("Room_Facility");
                            long daysBetween = (checkOut.getTime() - checkIn.getTime()) / (1000 * 60 * 60 * 24);
                            double totalPrice = pricePerNight * daysBetween;

                            request.setAttribute("availability", "available");
                            request.setAttribute("pricePerNight", pricePerNight);
                            request.setAttribute("totalPrice", totalPrice);
                            request.setAttribute("facility", facility);
                            request.setAttribute("roomTypeID", roomTypeID);
                            request.setAttribute("checkIn", checkIn);
                            request.setAttribute("checkOut", checkOut);
                            request.setAttribute("availableRooms", allRooms);
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("order.jsp").forward(request, response);
    }
}
