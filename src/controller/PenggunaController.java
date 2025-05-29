/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import classes.Pengguna;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alif
 */
@WebServlet(name = "PenggunaController", urlPatterns = {"/PenggunaController"})
public class PenggunaController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String username = (String) request.getSession().getAttribute("username");
        String password = (String) request.getSession().getAttribute("password");

        String newUsername = request.getParameter("newUsername");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("newPasswordConfirm");

        String status = null;

        if (newUsername != null && !newUsername.isEmpty()) {
            Pengguna pengguna = new Pengguna(username, password);
            status = pengguna.updateUsername(newUsername);

            if ("Update username berhasil".equals(status)) {
                request.getSession().setAttribute("username", newUsername);
            }
        }

        if (oldPassword != null && newPassword != null && confirmPassword != null) {
            if (oldPassword.equals(password)) {
                if (newPassword.equals(confirmPassword)) {
                    Pengguna pengguna = new Pengguna(username, oldPassword);
                    status = pengguna.updatePassword(newPassword);
                } else {
                    status = "Password dan konfirmasi password tidak cocok";
                }
            } else {
                status = "Password lama yang Anda masukkan salah";
            }
        }

        if (status != null && status.contains("berhasil")) {
            response.sendRedirect("profilPengguna.jsp?status=" + status);
        } else {
            request.setAttribute("status", status);
            RequestDispatcher dispatcher = request.getRequestDispatcher("profilPengguna.jsp");
            dispatcher.forward(request, response);
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
