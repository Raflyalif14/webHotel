package Controller;

import connDriver.connDriver;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Model.customerBean;
import java.util.List;

public class customerDao {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;
    private static String sql;

    public customerDao() {
        try {
            connDriver cnc = new connDriver();
            conn = cnc.connDriverr();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //create
    public static int create(customerBean cust) {
        int status = 0;
        try {
            connDriver db = new connDriver();
            conn = db.connDriverr();
            sql = """
                  INSERT INTO customer (Cust_Name, Cust_Password, Cust_Email, Cust_Phone) 
                  VALUES (?, ?, ?, ?);
                  """;
            ps = conn.prepareStatement(sql);
            ps.setString(1, cust.getCustName());
            ps.setString(2, cust.getCustPassword());
            ps.setString(3, cust.getCustEmail());
            ps.setString(4, cust.getCustPhone());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    // read
    public static List<customerBean> Read(customerBean cust) {
        List<customerBean> list = new ArrayList<customerBean>();

        try {
            connDriver db = new connDriver();
            conn = db.connDriverr();
            sql = "SELECT * FROM customer";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                customerBean newCust = new customerBean();
                newCust.setCustName(rs.getString("Cust_Name"));
                newCust.setCustPassword(rs.getString("Cust_Password"));
                newCust.setCustID(rs.getInt("Cust_ID"));
                newCust.setCustEmail(rs.getString("Cust_Email"));
                newCust.setCustPhone(rs.getString("Cust_Phone"));
                list.add(newCust);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Update
    public static int update(customerBean cust) {
        int status = 0;

        try {
            connDriver db = new connDriver();
            conn = db.connDriverr();
            sql = "UPDATE customer SET Cust_Name = ?, Cust_Password = ?, Cust_Email = ?, Cust_Phone = ? WHERE Cust_ID = ?;";
            ps = conn.prepareStatement(sql);
            ps.setString(1, cust.getCustName());
            ps.setString(2, cust.getCustPassword());
            ps.setString(3, cust.getCustEmail());
            ps.setString(4, cust.getCustPhone());
            ps.setInt(5, cust.getCustID());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    //Delete
    public static int Delete(customerBean cust) {
        int status = 0;

        try {
            connDriver db = new connDriver();
            conn = db.connDriverr();
            sql = """
                  DELETE FROM customer WHERE Cust_ID = ?;
                  """;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cust.getCustID());

            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    //close all connection 
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

    //additional method
    public boolean checkUsernameExist(String username) {
        sql = "SELECT * FROM customer WHERE Cust_Name=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            closeResources();
        }
    }

}
