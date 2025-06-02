/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;
import classes.AksesWeb;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author yudha
 */
@WebServlet(name = "AksesWebController", urlPatterns = {"/AksesWebController"})
public class AksesWebController extends HttpServlet {

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
        String status = null;
        try (PrintWriter out = response.getWriter()) {
            String page = request.getParameter("page"); 
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            
            if ("login".equals(page)){    
                //menyambungkan ke login.java
                AksesWeb login = new AksesWeb(username, password);
                status = login.login();

    //            System.out.println("LOGIN CONTROLLER \n STATUS: " + status);
                if ("Login berhasil".equals(status)) {
                    // Login sukses → redirect ke halaman menu.jsp
                    request.getSession().setAttribute("username", username); // kalau mau simpan session
                    response.sendRedirect("Pengguna.jsp");
                } else if ("admin".equals(status)) {    
                    request.getSession().setAttribute("username", username); // kalau mau simpan session
                    response.sendRedirect("AdminBukuPage.jsp");
                } else {
                    // Login gagal → kembali ke login.jsp dan tampilkan pesan
                    request.setAttribute("status", status);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                    dispatcher.forward(request, response);
                }
            } else if ("register".equals(page)){
                //menyambungkan ke login.java
                String confirmPassword = request.getParameter("confirm-password");
                AksesWeb register = new AksesWeb(username, password, confirmPassword);
                status = register.register();

                if ("Register berhasil".equals(status)) {
                    // Login sukses → redirect ke halaman menu.jsp
                    // request.getSession().setAttribute("username", username); // kalau mau simpan session
                    response.sendRedirect("register-success.jsp");
                } else {
                    // Login gagal → kembali ke login.jsp dan tampilkan pesan
                    request.setAttribute("status", status);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } catch(Exception e) {
            System.out.println("Exception: "+e.getMessage());
        } finally {
            System.out.println("REGISTER CONTROLLER \n STATUS: " + status);            
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
