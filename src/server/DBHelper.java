package server;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class DBHelper {

    Connection con;

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public DBHelper() {
        Properties p = new Properties();
        try {
            FileReader fin = new FileReader(new File("connection.properties"));
            p.load(fin);
            String host = p.getProperty("ServerID");
            String port = p.getProperty("Port");
            String dbName = p.getProperty("Database");
            String user = p.getProperty("Username");
            String pw = p.getProperty("Password");
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://" + host + ":" + port + "/" + dbName + "?useSSL=false&useLegacyDatetimeCode=false&characterEncoding=UTF-8&jdbcCompliantTruncation=false&sessionVariables=sql_mode='NO_ENGINE_SUBSTITUTION'";
            con = DriverManager.getConnection(url, user, pw);
        } catch (ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, "Lỗi 100:: Không tìm thấy lớp.");
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Lỗi 101:: Không thể kết nối đến máy chủ.");
        } catch (NullPointerException e) {
            JOptionPane.showMessageDialog(null, "Lỗi 102:: Cấu hình bị trống.");
        } catch (FileNotFoundException ex) {
            Logger.getLogger(DBHelper.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(DBHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
