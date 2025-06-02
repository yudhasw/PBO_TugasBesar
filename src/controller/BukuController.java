package servlets;

import classes.Buku;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "BukuController", urlPatterns = {"/BukuController"})
public class BukuController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Dapatkan ID Buku dari parameter URL
        String bookId = request.getParameter("id");
        System.out.println("ID: "+bookId);
        // Jika ID Buku kosong atau null, redirect ke pengguna.jsp
        if (bookId == null || bookId.isEmpty()) {
            response.sendRedirect("pengguna.jsp");
            return;
        }

        try {
            // Menggunakan Buku class untuk mendapatkan buku berdasarkan ID
            Buku buku = Buku.getBookById(bookId);

            // Debugging: Pastikan buku ditemukan
            if (buku == null) {
                System.out.println("Buku not found for ID: " + bookId);
            }
            System.out.println(buku.getJudul());
            if (buku != null) {
                // Set objek Buku ke dalam request untuk diteruskan ke JSP
                request.setAttribute("buku", buku);
                // Meneruskan ke halaman JSP
                request.getRequestDispatcher("buku.jsp").forward(request, response);
            } else {
                // Jika Buku tidak ditemukan, redirect ke pengguna.jsp
                response.sendRedirect("pengguna.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving book details");
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet that handles displaying book details";
    }
}
