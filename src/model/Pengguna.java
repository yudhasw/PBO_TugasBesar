/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

/**
 *
 * @author alif
 */
import java.sql.*;

public class Pengguna {

    private String username;
    private String password;

    public Pengguna(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public Pengguna() {
    }

    ;

    public String updateUsername(String newUsername) {
        String statusR = "Update username berhasil";
        try {
            JDBC db = new JDBC();
            String cekUsername = db.getData("SELECT username FROM pengguna WHERE username ='" + newUsername + "';", "username");

            if (cekUsername == null) {
                String updateQuery = "UPDATE pengguna SET username = '" + newUsername + "' WHERE username = '" + this.username + "'";
                db.runQuery(updateQuery);

                statusR = "Username berhasil diperbarui.";
                this.username = newUsername;
            } else {
                statusR = "Username sudah terdaftar.";
            }
        } catch (Exception e) {
            statusR = "Terjadi kesalahan: " + e.getMessage();
        }
        return statusR;
    }

    public String updatePassword(String newPassword) {
        String statusR = "";

        try {
            if (newPassword != null && !newPassword.trim().isEmpty()) {
                String sanitizedPassword = newPassword.replace("'", "''");

                JDBC db = new JDBC();
                String updateQuery = "UPDATE pengguna SET password = '" + sanitizedPassword + "' WHERE username = '" + this.username + "'";
                db.runQuery(updateQuery);

                this.password = newPassword;
                statusR = "Password berhasil diperbarui.";
            } else {
                statusR = "Password baru tidak valid.";
            }
        } catch (Exception e) {
            statusR = "Terjadi kesalahan: " + e.getMessage();
        }

        return statusR;
    }

    public String getPasswordFromDB() {
        String realPassword = null;
        try {
            JDBC db = new JDBC();
            realPassword = db.getData("SELECT password FROM pengguna WHERE username = '" + this.username + "'", "password");
        } catch (Exception e) {
            System.out.println("Error ambil password dari DB: " + e.getMessage());
        }
        return realPassword;
    }

    public void Wishlist(String idPengguna, String idBuku, String statusWishlist) {
        try {
            JDBC db = new JDBC();
            if ("tambah".equals(statusWishlist)) {
                db.runQuery("INSERT INTO wishlist(idPengguna, idBuku) VALUES ('" + idPengguna + "','" + idBuku + "');");
            } else if ("hapus".equals(statusWishlist)) {
                db.runQuery("DELETE FROM wishlist WHERE idPengguna='" + idPengguna + "' AND idBuku='" + idBuku + "';");
            }
        } catch (Exception e) {
            System.out.println("Exception (Wishlist): " + e.getMessage());
        }
    }

}
