package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Buku {

    private String id_buku;
    private String judul;
    private String penulis;
    private String tahun;
    private String jenis;
    private String isbn;
    private String rating;
    private String deskripsi;
    private String harga;

    // Constructor (using all fields)
    public Buku(String id_buku, String judul, String penulis, String tahun, String jenis, String isbn, String rating, String deskripsi, String harga) {
        this.id_buku = id_buku;
        this.judul = judul;
        this.penulis = penulis;
        this.tahun = tahun;
        this.jenis = jenis;
        this.isbn = isbn;
        this.rating = rating;
        this.deskripsi = deskripsi;
        this.harga = harga;
    }

    // Getters and setters
    public String getId_buku() {
        return id_buku;
    }

    public String getJudul() {
        return judul;
    }

    public String getPenulis() {
        return penulis;
    }

    public String getTahun() {
        return tahun;
    }

    public String getJenis() {
        return jenis;
    }

    public String getIsbn() {
        return isbn;
    }

    public String getRating() {
        return rating;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public String getHarga() {
        return harga;
    }

    // Static method to fetch book details from the database
    public static Buku getBookById(String id_buku) {
        JDBC db = new JDBC();
        Buku buku = null;
        try {
            // Query untuk mendapatkan data buku berdasarkan id_buku
            String query = "SELECT * FROM buku WHERE id_buku = '" + id_buku + "'";
            System.out.println("SELECT * FROM buku WHERE id_buku = '" + id_buku + "'");
            ResultSet rs = db.getDataAll(query);

            if (rs != null && rs.next()) {
                buku = new Buku(
                        rs.getString("id_buku"),
                        rs.getString("judul"),
                        rs.getString("penulis"),
                        rs.getString("tahun"),
                        rs.getString("jenis"),
                        rs.getString("isbn"),
                        rs.getString("rating"),
                        rs.getString("deskripsi"),
                        rs.getString("harga")
                );
            }

            // Debugging: Pastikan kita mendapatkan buku
            if (buku != null) {
                System.out.println("Buku found: " + buku.getJudul());
            }

            // Tutup result set
            if (rs != null) {
                rs.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return buku;
    }

}
