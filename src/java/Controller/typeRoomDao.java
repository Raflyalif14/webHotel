package Controller;

import connDriver.connDriver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.typeRoomBean;

public class typeRoomDao {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;
    private static String sql;

    public typeRoomDao() {
        try {
            connDriver cnc = new connDriver();
            conn = cnc.connDriverr();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Create
    public int create(typeRoomBean typeRoom) {
        int status = 0;
        try {
            sql = "INSERT INTO type_room (Room_Type, Price, Room_Facility) VALUES (?, ?, ?);";
            ps = conn.prepareStatement(sql);
            ps.setString(1, typeRoom.getRoomType());
            ps.setInt(2, typeRoom.getPrice());
            ps.setString(3, typeRoom.getFacility());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement();
        }
        return status;
    }

    // Read
    public List<typeRoomBean> read() {
        List<typeRoomBean> list = new ArrayList<>();
        try {
            sql = "SELECT * FROM type_room";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                typeRoomBean typeRoom = new typeRoomBean();
                typeRoom.setRoomTypeID(rs.getInt("RoomType_ID"));
                typeRoom.setRoomType(rs.getString("Room_Type"));
                typeRoom.setPrice(rs.getInt("Price"));
                typeRoom.setFacility(rs.getString("Room_Facility"));
                list.add(typeRoom);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResultSet();
            closePreparedStatement();
        }
        return list;
    }

    // Update
    public int update(typeRoomBean typeRoom) {
        int status = 0;
        try {
            sql = "UPDATE type_room SET Room_Type = ?, Price = ?, Room_Facility = ? WHERE RoomType_ID = ?;";
            ps = conn.prepareStatement(sql);
            ps.setString(1, typeRoom.getRoomType());
            ps.setInt(2, typeRoom.getPrice());
            ps.setString(3, typeRoom.getFacility());
            ps.setInt(4, typeRoom.getRoomTypeID());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement();
        }
        return status;
    }

    // Delete
    public int delete(typeRoomBean typeRoom) {
        int status = 0;
        try {
            sql = "DELETE FROM type_room WHERE RoomType_ID = ?;";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, typeRoom.getRoomTypeID());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement();
        }
        return status;
    }

    // Close resources
    private void closePreparedStatement() {
        try {
            if (ps != null) {
                ps.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void closeResultSet() {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
