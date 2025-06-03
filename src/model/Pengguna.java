/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package src.model;

/**
 *
 * @author GAMING 3
 */

import java.sql.*;

public class Pengguna {

    private String username;
    private String password;

    public Pengguna(String username, String password) {
        this.username = username;
        this.password = password;
    }

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
        String statusR = "Update password berhasil";
        try {
            if (newPassword != null && !newPassword.isEmpty()) {
                JDBC db = new JDBC();
                String updateQuery = "UPDATE pengguna SET password = '" + newPassword + "' WHERE username = '" + this.username + "'";
                db.runQuery(updateQuery);

                statusR = "Password berhasil diperbarui.";
                this.password = newPassword;
            } else {
                statusR = "Password baru tidak valid.";
            }
        } catch (Exception e) {
            statusR = "Terjadi kesalahan: " + e.getMessage();
        }
        return statusR;
    }
}
