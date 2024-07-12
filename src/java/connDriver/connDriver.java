package connDriver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connDriver {

    public Connection connDriverr() {
        Connection conn = null;
        try {
            String url = "jdbc:mysql://localhost:3306/hotelaplication";
            String user = "root";
            String pass = "";
            conn = DriverManager.getConnection(url, user, pass);
            System.out.println("Connection established successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
