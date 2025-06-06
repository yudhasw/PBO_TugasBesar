/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

import classes.JDBC;
import java.time.LocalDate;
import java.sql.ResultSet;

/**
 *
 * @author yudha
 */
public class Review {
    private String username;
    private String judul_buku;
    private String judul_postingan;
    private String kategori;
    private String konten;

    public Review(String username, String judul_buku, String judul_postingan, String kategori, String konten) {
        this.username = username;
        this.judul_buku = judul_buku;
        this.judul_postingan = judul_postingan;
        this.kategori = kategori;
        this.konten = konten;
    }
    
    public Review(){};
    
    public void tambahReview() {
        try {
            JDBC db = new JDBC();
            String tanggal = LocalDate.now().toString();
            db.runQuery("INSERT INTO forum_review(judul_buku, username_pengirim, waktu, deskripsi, judul_forum, kategori)"
                    + " VALUES ('" + judul_buku + "','" + username + "','" + tanggal + "','" + konten + "','" + judul_postingan + "','" + kategori + "');");
        } catch (Exception e) {
            System.out.println("EXCEPTION" + e.getMessage());
        }
    }

    public void hapusReview(String id) {
        try {
            JDBC db = new JDBC();
            String tanggal = LocalDate.now().toString();
            db.runQuery("DELETE FROM forum_review WHERE id_post="+id);
            System.out.println("DELETE FROM forum_review WHERE id_post="+id);
        } catch (Exception e) {
            System.out.println("EXCEPTION" + e.getMessage());
        }
    }
}
