package servlets;

import classes.Pembelian;
import classes.JDBC;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;

@WebServlet("/prosesPembayaran")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String judul = request.getParameter("judul");
        String hargaStr = request.getParameter("harga");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String metode = request.getParameter("metode_pembayaran");
        String namaPentransfer = request.getParameter("nama_pentransfer");
        String kodeVoucher = request.getParameter("kode_voucher");

        double harga = 0;
        try {
            harga = Double.parseDouble(hargaStr);
        } catch (Exception e) {
            harga = 0;
        }

        double diskonNominal = 0;
        double hargaAkhir = harga;
        String appliedKodeVoucher = "Tidak menggunakan voucher";

        if (kodeVoucher != null && !kodeVoucher.trim().isEmpty()) {
            JDBC db = new JDBC();
            try (
                    Connection conn = db.getConnection(); PreparedStatement pstmt = conn.prepareStatement(
                    "SELECT * FROM vouchers WHERE kode_voucher = ?"
            )) {
                pstmt.setString(1, kodeVoucher);

                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    String jenisDiskon = rs.getString("jenis_diskon");
                    double nilaiDiskon = rs.getDouble("nilai_diskon");

                    if ("persen".equals(jenisDiskon)) {
                        diskonNominal = harga * nilaiDiskon;
                    } else if ("nominal".equals(jenisDiskon)) {
                        diskonNominal = nilaiDiskon;
                    }

                    if (diskonNominal > harga) {
                        diskonNominal = harga;
                    }

                    hargaAkhir = harga - diskonNominal;
                    appliedKodeVoucher = kodeVoucher;
                } else {
                    // Voucher tidak valid → kembali ke index.jsp
                    request.setAttribute("voucherMessage", "Kode voucher tidak valid atau tidak memenuhi syarat.");
                    // Set ulang data agar tetap ditampilkan di form
                    request.setAttribute("judul", judul);
                    request.setAttribute("harga", hargaStr);
                    request.setAttribute("username", username);
                    request.setAttribute("email", email);
                    request.setAttribute("metode", metode);
                    request.setAttribute("namaPentransfer", namaPentransfer);
                    request.setAttribute("kodeVoucher", kodeVoucher);
                    request.getRequestDispatcher("checkout.jsp").forward(request, response);
                    return;
                }

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("voucherMessage", "Terjadi kesalahan saat memproses voucher.");
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
                return;
            } finally {
                db.close();
            } 
        }

        // Lanjut ke simpan pembelian
        Pembelian pembelian = new Pembelian();
        pembelian.setNamaBuku(judul);
        pembelian.setHarga(harga);
        pembelian.setNamaPembeli(username);
        pembelian.setEmail(email);
        pembelian.setMetodePembayaran(metode);
        pembelian.setNamaPentransfer(namaPentransfer);
        pembelian.setDiskon(diskonNominal);
        pembelian.setHargaAkhir(hargaAkhir);
        pembelian.setKodeVoucher(appliedKodeVoucher);

        boolean sukses = pembelian.simpanKeDatabase();

        if (sukses) {
            request.getSession().setAttribute("pembelian", pembelian);
            response.sendRedirect("nota.jsp");
        } else {
            response.getWriter().println("Gagal menyimpan data pembelian.");
        }
    }
}
