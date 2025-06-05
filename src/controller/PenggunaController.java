package servlets;

import classes.Pengguna;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "PenggunaController", urlPatterns = {"/PenggunaController"})
public class PenggunaController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String username = (String) request.getSession().getAttribute("username");
        String password = (String) request.getSession().getAttribute("password");

        String newUsername = request.getParameter("newUsername");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("newPasswordConfirm");
        String hashOldPassword = BCrypt.hashpw(oldPassword, BCrypt.gensalt());

        String status = null;

        String statusWishlist = request.getParameter("statusWishlist");

        if (statusWishlist != null && !statusWishlist.isEmpty() && !statusWishlist.isBlank()) {
            String idPengguna = request.getParameter("idPengguna");
            String idBuku = request.getParameter("idBuku");

            if (idPengguna != null && idBuku != null) {
                Pengguna wishlist = new Pengguna();
                wishlist.Wishlist(idPengguna, idBuku, statusWishlist);
            }
        }

        if (newUsername != null && !newUsername.isEmpty()) {
            Pengguna pengguna = new Pengguna(username, password);
            status = pengguna.updateUsername(newUsername);

            if ("Username berhasil diperbarui.".equals(status)) {
                request.getSession().setAttribute("username", newUsername); // update session
                username = newUsername; // sync ke bawah
            }
        }
        
        if (oldPassword != null && newPassword != null && confirmPassword != null) {
            Pengguna pengguna = new Pengguna(username, null);
            String realPassword = pengguna.getPasswordFromDB();
            System.out.println("OLD"+hashOldPassword);
            System.out.println("NEW"+newPassword);
            System.out.println("ereal"+realPassword);
            
            if (realPassword == null) {
                status = "Gagal memverifikasi password lama.";
            } else if (!BCrypt.checkpw(oldPassword, realPassword)) {
                status = "Password lama yang Anda masukkan salah";
            } else if (!newPassword.equals(confirmPassword)) {
                status = "Password baru dan konfirmasi tidak cocok";
            } else {
                status = pengguna.updatePassword(newPassword);
                if ("Password berhasil diperbarui.".equals(status)) {
                    request.getSession().setAttribute("password", newPassword);
                }
            }
        }

        if (status != null && !status.isEmpty()) {
            response.sendRedirect("profilpengguna.jsp?status=" + URLEncoder.encode(status, StandardCharsets.UTF_8.toString()));
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("profilpengguna.jsp");
            dispatcher.forward(request, response);
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
        return "Servlet untuk mengatur perubahan username, password, dan wishlist pengguna";
    }
}
