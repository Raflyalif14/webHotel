package Controller;

import connDriver.connDriver;
import Model.roomBean;
import Model.typeRoomBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class roomDao {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;
    private static String sql;

    public roomDao() {
        try {
            connDriver cnc = new connDriver();
            conn = cnc.connDriverr();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Create
    public int create(roomBean room) {
        int status = 0;
        try {
            sql = "INSERT INTO room (Room_Number, Room_Type_ID, Status) VALUES (?, ?, ?);";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, room.getRoomNumber());
            ps.setInt(2, room.getTypeRoom().getRoomTypeID());
            ps.setString(3, room.getStatus());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return status;
    }

    // Read
    public List<roomBean> read() {
        List<roomBean> list = new ArrayList<>();
        try {
            sql = "SELECT * FROM room";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                roomBean room = new roomBean();
                room.setRoomID(rs.getInt("Room_ID"));
                room.setRoomNumber(rs.getInt("Room_Number"));
                room.setStatus(rs.getString("Status"));

                typeRoomBean typeRoom = new typeRoomBean();
                typeRoom.setRoomTypeID(rs.getInt("Room_Type_ID"));
                room.setTypeRoom(typeRoom);

                list.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return list;
    }

    // Update
    public int update(roomBean room) {
        int status = 0;
        try {
            sql = "UPDATE room SET Room_Number = ?, Room_Type_ID = ?, Status = ? WHERE Room_ID = ?;";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, room.getRoomNumber());
            ps.setInt(2, room.getTypeRoom().getRoomTypeID());
            ps.setString(3, room.getStatus());
            ps.setInt(4, room.getRoomID());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return status;
    }

    // Delete
    public int delete(roomBean room) {
        int status = 0;
        try {
            sql = "DELETE FROM room WHERE Room_ID = ?;";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, room.getRoomID());
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