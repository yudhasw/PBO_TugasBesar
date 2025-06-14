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
    private String status = "pending";
    private String namaPentransfer;
    private double diskonNominal; // Changed from 'diskon' (int) to 'diskonNominal' (double)
    private String kodeVoucher; // New field to store applied voucher code
    private double hargaAkhir;

    // SETTER & GETTER
    public void setIdPembelian(int idPembelian) {
        this.idPembelian = idPembelian;
    }

    public int getIdPembelian() {
        return idPembelian;
    }

    public void setNamaBuku(String namaBuku) {
        this.namaBuku = namaBuku;
    }

    public String getNamaBuku() {
        return namaBuku;
    }

    public void setHarga(double harga) {
        this.harga = harga;
    }

    public double getHarga() {
        return harga;
    }

    public void setNamaPembeli(String namaPembeli) {
        this.namaPembeli = namaPembeli;
    }

    public String getNamaPembeli() {
        return namaPembeli;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setAlamatPengiriman(String alamatPengiriman) {
        this.alamatPengiriman = alamatPengiriman;
    }

    public String getAlamatPengiriman() {
        return alamatPengiriman;
    }

    public void setMetodePembayaran(String metodePembayaran) {
        this.metodePembayaran = metodePembayaran;
    }

    public String getMetodePembayaran() {
        return metodePembayaran;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setNamaPentransfer(String namaPentransfer) {
        this.namaPentransfer = namaPentransfer;
    }

    public String getnamaPentransfer() {
        return namaPentransfer;
    }
    
    public void setDiskon(double diskonNominal) {
        this.diskonNominal = diskonNominal;
    }

    public double getDiskon() {
        return diskonNominal;
    }

    public void setHargaAkhir(double hargaAkhir) {
        this.hargaAkhir = hargaAkhir;
    }

    public double getHargaAkhir() {
        return hargaAkhir;
    }
    
    public void setKodeVoucher(String kodeVoucher) {
        this.kodeVoucher = kodeVoucher;
    }

    public String getKodeVoucher() {
        return kodeVoucher;
    }

    // Method untuk menyimpan ke database
    public boolean simpanKeDatabase() {
        JDBC db = new JDBC();
        try {
            Connection conn = db.getConnection(); // ambil koneksi dari JDBC

            String query = "INSERT INTO pembelian (judul_buku, harga, nama_pembeli, email, metode_pembayaran, status, nama_pentransfer, diskon_nominal, harga_akhir, kode_voucher) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            stmt.setString(1, namaBuku);
            stmt.setDouble(2, harga);
            stmt.setString(3, namaPembeli);
            stmt.setString(4, email);
            stmt.setString(5, metodePembayaran);
            stmt.setString(6, status);
            stmt.setString(7, namaPentransfer);
            stmt.setDouble(8, diskonNominal); // Set the discount value
            stmt.setDouble(9, hargaAkhir); // Set the final price
            stmt.setString(10, kodeVoucher); // Store the applied voucher code (if any)
 
            
            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    this.idPembelian = generatedKeys.getInt(1); // simpan ID yang baru
                }
                generatedKeys.close();
            }

            stmt.close();
            db.close(); // tutup koneksi pakai method yang baru kamu buat
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
