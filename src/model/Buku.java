    package classes;

import classes.JDBC;
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
    private String gambar;
    
    public Buku(){};
    
    // Constructor
    public Buku(String id_buku, String judul, String penulis, String tahun, String jenis, String isbn, String rating, String deskripsi, String harga) {
        this.judul = judul;
        this.penulis = penulis;
        this.tahun = tahun;
        this.jenis = jenis;
        this.isbn = isbn;
        this.rating = rating;
        this.deskripsi = deskripsi;
        this.harga = harga;
    }

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

    public void setId_buku(String id_buku) {
        this.id_buku = id_buku;
    }

    public void setJudul(String judul) {
        this.judul = judul;
    }

    public void setPenulis(String penulis) {
        this.penulis = penulis;
    }

    public void setTahun(String tahun) {
        this.tahun = tahun;
    }

    public void setJenis(String jenis) {
        this.jenis = jenis;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    public void setHarga(String harga) {
        this.harga = harga;
    }

//    public String NewestId() {
//        System.out.println("TESSSSSSS");
//        JDBC db = new JDBC();
//        String nextId = "B001";
//        try {
//            ResultSet rs = db.getDataAll("SELECT MAX(id_buku) FROM buku");
//            if (rs.next()) {
//                String lastId = rs.getString(1);
//                System.out.println("LASTID: "+lastId);
//                if (lastId != null) {
//                    int nextNum = Integer.parseInt(lastId.substring(1)) + 1; // increment
//                    nextId = String.format("B%03d", nextNum);
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        System.out.println("NEXTID: "+nextId);
//        return nextId;
//    }

    public void TambahBuku(String judul, String penulis, String tahun, String jenis, String isbn, String rating, String deskripsi, String harga) {
        try {
//            String id = NewestId();
            gambar = "awdadwadwa";
            JDBC db = new JDBC();
            db.runQuery("INSERT INTO buku(judul,penulis,tahun,jenis,isbn,rating,deskripsi,harga,gambar) VALUES ('" + judul + "','" + penulis + "','" + tahun + "','" + jenis + "','" + isbn + "','" + rating + "','" + deskripsi + "','" + harga + "','" + gambar + "')");
            System.out.println("INSERT INTO buku(judul,penulis,tahun,jenis,isbn,rating,deskripsi,harga,gambar) VALUES ('" + judul + "','" + penulis + "','" + tahun + "','" + jenis + "','" + isbn + "','" + rating + "','" + deskripsi + "','" + harga + "','" + gambar + "')");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void HapusBuku(String id) {
        try {
            JDBC db = new JDBC();
            db.runQuery("DELETE FROM buku WHERE id_buku="+id);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
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

