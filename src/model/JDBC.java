/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;
import java.sql.*;

/**
 *
 * @author yudha
 */
public class JDBC {
    private Connection con;
    private Statement stmt;
    private boolean isConnected;
    private String message;
    
    public void connect() {
        String dbname = "toko_buku";
        String username = "root";
        String password = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"
                    + dbname, username, password);
            stmt = con.createStatement();
            isConnected = true;
            message = "DB connected";
        } catch(Exception e) {
            isConnected = false;
            message = e.getMessage();
        } 
    }
    
    private void disconnect() {
        try {
            stmt.close();
            con.close();
        } catch(Exception e) {
            message = e.getMessage();
        }
    }
    
    public String getData(String query, String namaKolom) {
        String dataDariDB = null;
        try {
            connect();
            ResultSet rs = stmt.executeQuery(query);
            if (rs.next()) {
                dataDariDB = rs.getString(namaKolom).trim();
            }
        } catch (Exception e) {
            return "Exception: " + e.getMessage();
        } finally {
            disconnect();
        }
        return dataDariDB;
    }
    
    public void runQuery(String query) { 
        try { 
            connect();
            int result = stmt.executeUpdate(query); 
            message = "info: " + result + " rows affected"; 
        } catch (Exception e) { 
            message = e.getMessage(); 
        } finally {
            disconnect();
        }
    }
}
