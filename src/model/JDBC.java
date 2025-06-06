/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;
import java.util.*;
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
        //Parameter untuk database cloud menggunakan Azure
        String dbname = "tokoBukuDB";
        String username = "martabak";
        String password = ""; //Password disembunyikan, seharusnya ada isinya

        //Parameter untuk database lokal (MySQL XAMPP)
        //String dbname = "toko_buku";
        //String username = "root";
        //String password = "";
        try {
            // Pengaturan connection untuk database lokal
            // class.forName("com.mysql.cj.jdbc.Driver");
            // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+ dbname, username, password);

            // Pengaturan connection untuk database cloud
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String connectionUrl = "jdbc:sqlserver://pbofinalproject.database.windows.net:1433;" +
                       "database=" + dbname + ";" +
                       "user=" + username + ";" +
                       "password=" + password + ";" + 
                       "encrypt=true;" +
                       "trustServerCertificate=false;" +
                       "loginTimeout=30;";

            con = DriverManager.getConnection(connectionUrl);

            stmt = con.createStatement();
            isConnected = true;
            message = "MESSAGE: DB connected";
        } catch(Exception e) {
            isConnected = false;
            message = "MESSAGE: Exception: "+e.getMessage();
        } finally {
            System.out.println(message);
        }
    }
    
    public void disconnect() {
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
    
    public ResultSet getDataAll(String query) {
        ResultSet rs = null;
        try {
            connect();
            rs = stmt.executeQuery(query);
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
        }
        return rs;
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
    
    public List<Map<String, String>> getForumData() {
        List<Map<String, String>> data = new ArrayList<>();
        try {
            connect();
            ResultSet rs = stmt.executeQuery("SELECT * FROM forum_review");
            while (rs.next()) {
                Map<String, String> row = new HashMap<>();
                row.put("kategori", rs.getString("kategori"));
                row.put("judul_forum", rs.getString("judul_forum"));
                row.put("deskripsi", rs.getString("deskripsi"));
                row.put("username_pengirim", rs.getString("username_pengirim"));
                row.put("waktu", rs.getString("waktu"));
                row.put("id_post", rs.getString("id_post"));
                data.add(row);
            }
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
        } finally {
            disconnect();
        }
        return data;
    }
    
    public Connection getConnection() {
        if (con == null) {
            connect();
        }
        return con;
    }
    
    public void close() {
        disconnect();
    }

}
