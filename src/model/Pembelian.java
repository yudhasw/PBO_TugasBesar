package classes;

import java.sql.*;

public class Pembelian {
    private int idPembelian;
    private String namaBuku;
    private double harga;
    private String namaPembeli;
    private String email;
    private String alamatPengiriman;
    private String metodePembayaran;

    // SETTER & GETTER
    public void setIdPembelian(int idPembelian) { this.idPembelian = idPembelian; }
    public int getIdPembelian() { return idPembelian; }

    public void setNamaBuku(String namaBuku) { this.namaBuku = namaBuku; }
    public String getNamaBuku() { return namaBuku; }

    public void setHarga(double harga) { this.harga = harga; }
    public double getHarga() { return harga; }

    public void setNamaPembeli(String namaPembeli) { this.namaPembeli = namaPembeli; }
    public String getNamaPembeli() { return namaPembeli; }

    public void setEmail(String email) { this.email = email; }
    public String getEmail() { return email; }

    public void setAlamatPengiriman(String alamatPengiriman) { this.alamatPengiriman = alamatPengiriman; }
    public String getAlamatPengiriman() { return alamatPengiriman; }

    public void setMetodePembayaran(String metodePembayaran) { this.metodePembayaran = metodePembayaran; }
    public String getMetodePembayaran() { return metodePembayaran; }

    // Method untuk menyimpan ke database
    public boolean simpanKeDatabase() {
        try {
            JDBC db = new JDBC();
            
            db.runQuery("INSERT INTO pembelian (judul_buku, harga, nama_pembeli, email, alamat_pengiriman, metode_pembayaran) VALUES ('"+namaBuku+"',"+harga+",'"+namaPembeli+"','"+email+"','"+alamatPengiriman+"','"+metodePembayaran+"');");
            

        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }
}
