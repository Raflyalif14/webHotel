package Controller;

import connDriver.connDriver;
import Model.transaksiBean;
import Model.customerBean;
import Model.roomBean;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class transaksiDao {
    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;
    private static String sql;

    public transaksiDao() {
        try {
            connDriver cnc = new connDriver();
            conn = cnc.connDriverr();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Create
    public int create(transaksiBean transaksi) {
        int status = 0;
        try {
            sql = "INSERT INTO transaksi (Cust_ID, Room_ID, Check_in_date, Check_out_date) VALUES (?, ?, ?, ?);";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, transaksi.getCustomer().getCustID());
            ps.setInt(2, transaksi.getRoom().getRoomID());
            ps.setDate(3, new Date(transaksi.getCheckIn().getTime()));
            ps.setDate(4, new Date(transaksi.getCheckOut().getTime()));
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return status;
    }

    // Read
    public List<transaksiBean> read() {
    List<transaksiBean> list = new ArrayList<>();
    try {
        sql = "SELECT * FROM transaksi";
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            transaksiBean transaksi = new transaksiBean();
            transaksi.setTransactionID(rs.getInt("Transaction_ID"));
            
            customerBean customer = new customerBean();
            customer.setCustID(rs.getInt("Cust_ID"));
            transaksi.setCustomer(customer);
            
            roomBean room = new roomBean();
            room.setRoomID(rs.getInt("Room_ID"));
            transaksi.setRoom(room);
            
            transaksi.setCheckIn(rs.getDate("Check_in_date"));
            transaksi.setCheckOut(rs.getDate("Check_out_date"));
            transaksi.setTotalPrice(rs.getDouble("Total_price"));
            
            list.add(transaksi);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    System.out.println("Size of list in DAO: " + list.size()); // Debug statement
    return list;
}


    // Update
    public int update(transaksiBean transaksi) {
        int status = 0;
        try {
            sql = "UPDATE transaksi SET Cust_ID = ?, Room_ID = ?, Check_in_date = ?, Check_out_date = ?, Total_price = ? WHERE Transaction_ID = ?;";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, transaksi.getCustomer().getCustID());
            ps.setInt(2, transaksi.getRoom().getRoomID());
            ps.setDate(3, new Date(transaksi.getCheckIn().getTime()));
            ps.setDate(4, new Date(transaksi.getCheckOut().getTime()));
            ps.setDouble(5, transaksi.getTotalPrice());
            ps.setInt(6, transaksi.getTransactionID());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return status;
    }

    // Delete
    public int delete(transaksiBean transaksi) {
        int status = 0;
        try {
            sql = "DELETE FROM transaksi WHERE Transaction_ID = ?;";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, transaksi.getTransactionID());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return status;
    }

    // Close resources
    private void closeResources() {
        try {
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
