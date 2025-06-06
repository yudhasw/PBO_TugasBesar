/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import classes.JDBC;
import classes.Review;
import java.time.LocalDate;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yudha
 */
@WebServlet(name = "ReviewController", urlPatterns = {"/ReviewController"})
public class ReviewController extends HttpServlet {

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
            String action = request.getParameter("action");
            String judul_postingan = request.getParameter("judul_postingan");
            String judul_buku = request.getParameter("judul_buku");
            String kategori = request.getParameter("kategori");
            String konten = request.getParameter("konten");
            String username = request.getParameter("username");
            Review review = new Review(username,judul_buku,judul_postingan,kategori,konten);
            
            if ("kembali".equals(action)) {
                response.sendRedirect("Review.jsp");
            } else if ("buat".equals(action)) {
                try {
                    review.tambahReview();
                } catch (Exception e){
                    System.out.println(e.getMessage());
                }
                response.sendRedirect("Review.jsp");
            } else if ("hapus".equals(action)){
                String id = request.getParameter("id");
                try {
                    review.hapusReview(id);
                } catch (Exception e){
                    System.out.println(e.getMessage());
                }
                response.sendRedirect("Review_hapusPost.jsp");
            } else if ("detail".equals(action)){
                 String id = request.getParameter("id");
                 System.out.println("Review_DetailPost?id="+id);
                 response.sendRedirect("Review_detailPost.jsp?id="+id);
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
