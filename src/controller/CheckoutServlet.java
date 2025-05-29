package servlets;

import classes.Pembelian;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/prosesPembayaran")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String judul = request.getParameter("judul");
        String hargaStr = request.getParameter("harga");
        String nama = request.getParameter("nama");
        String email = request.getParameter("email");
        String alamat = request.getParameter("alamat");
        String metode = request.getParameter("metode_pembayaran");

        double harga = 0;
        try {
            harga = Double.parseDouble(hargaStr);
        } catch (Exception e) {
            harga = 0;
        }

        // Buat objek pembelian
        Pembelian pembelian = new Pembelian();
        pembelian.setNamaBuku(judul);
        pembelian.setHarga(harga);
        pembelian.setNamaPembeli(nama);
        pembelian.setEmail(email);
        pembelian.setAlamatPengiriman(alamat);
        pembelian.setMetodePembayaran(metode);

        boolean sukses = pembelian.simpanKeDatabase();
        
        System.out.println("SUKSES: " + sukses);
        if (sukses) {
            request.getSession().setAttribute("pembelian", pembelian);
            response.sendRedirect("nota.jsp");
        } else {
            response.getWriter().println("Gagal menyimpan data pembelian.");
        }
    }
}
