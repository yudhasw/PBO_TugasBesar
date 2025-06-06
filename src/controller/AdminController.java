/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;
import classes.Buku;
import classes.JDBC;
import classes.Review;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author berli
 */
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            System.out.println("ACTION: "+action);
            
            if ("deleteUser".equals(action)) {
                String id = request.getParameter("id");

                if (id != null && !id.isEmpty()) {
                    try {
                        JDBC db = new JDBC();
                        String sql = "DELETE FROM pengguna WHERE id ='" + id + "';";
                        System.out.println("DELETE FROM pengguna WHERE id ='" + id + "';");
                        db.runQuery(sql);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                response.sendRedirect("AdminPage.jsp");
            }
            
            if ("VerifikasiPembayaran".equals(action)) {
                String id = request.getParameter("id");

                if (id != null && !id.isEmpty()) {
                    try {
                        JDBC db = new JDBC();
                        String sqlUstatus = "UPDATE pembelian SET status = 'lunas' WHERE id_pembelian="+id;
                        String sqlU = "INSERT INTO daftar_penjualan (nama_pembeli, email, judul_buku, harga, metode_pembayaran, status, nama_pentransfer, diskon_nominal, harga_akhir, kode_voucher)\n" +
                                        "SELECT nama_pembeli, email, judul_buku, harga, metode_pembayaran, status, nama_pentransfer, diskon_nominal, harga_akhir, kode_voucher\n" +
                                        "FROM pembelian\n" +
                                        "WHERE id_pembelian ="+id;
                        
                        System.out.println("UPDATE daftarpenjualan SET jumlah_penjualan = jumlah_penjualan + 1 WHERE id = '" + id + "';");
                        db.runQuery(sqlUstatus);
                        db.runQuery(sqlU);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                response.sendRedirect("VerifikasiPage.jsp");
            }
            
            if ("TolakPembayaran".equals(action)) {
                String id = request.getParameter("id");
                String sqlUstatus = "UPDATE pembelian SET status = 'gagal' WHERE id_pembelian="+id;
                if (id != null && !id.isEmpty()) {
                    try {
                        JDBC db = new JDBC();
                        System.out.println("DELETE FROM pembelian WHERE id =" + id + ";");
                        db.runQuery(sqlUstatus);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                response.sendRedirect("VerifikasiPage.jsp");
            }
            
            if ("tambah".equals(action)) {
                String judul = request.getParameter("judul");
                String penulis = request.getParameter("penulis");
                String tahun = request.getParameter("tahun");
                String kategori = request.getParameter("kategori");
                String isbn = request.getParameter("isbn");
                String rating = request.getParameter("rating");
                String harga = request.getParameter("harga");
                String deskripsi = request.getParameter("deskripsi");
                
                try {
                    Buku buku = new Buku();
                    buku.TambahBuku(judul, penulis, tahun, kategori, isbn, rating, deskripsi, harga);
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
                response.sendRedirect("AdminBukuPage.jsp");
            }
            
            if ("hapus".equals(action)) {
                String id = request.getParameter("id");
                    Buku buku = new Buku();
                    buku.HapusBuku(id);
                try {
                    
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
                response.sendRedirect("AdminBukuPage.jsp");
            }
            
            if ("hapusPost".equals(action)){
                String id = request.getParameter("id");
                Review review = new Review();
                try {
                    review.hapusReview(id);
                } catch (Exception e){
                    System.out.println(e.getMessage());
                }
                response.sendRedirect("AdminReviewPage.jsp");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
