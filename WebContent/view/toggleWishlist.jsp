<%-- 
    Document   : toggleWishlist
    Created on : 1 Jun 2025, 13.51.07
    Author     : alif
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="classes.JDBC" %>
<%
    String username = (String) session.getAttribute("username");
    String idBuku = request.getParameter("idBuku");

    if (username != null && idBuku != null) {
        JDBC db = new JDBC();
        ResultSet rsUser = db.getDataAll("SELECT id FROM pengguna WHERE username='" + username + "'");
        String idPengguna = null;

        if (rsUser != null && rsUser.next()) {
            idPengguna = rsUser.getString("id");
            rsUser.close();
        }

        if (idPengguna != null) {
            ResultSet rsCheck = db.getDataAll(
                    "SELECT * FROM wishlist WHERE idPengguna='" + idPengguna + "' AND idBuku='" + idBuku + "'"
            );

            if (rsCheck != null && rsCheck.next()) {
                // Jika sudah ada → hapus
                db.runQuery("DELETE FROM wishlist WHERE idPengguna='" + idPengguna + "' AND idBuku='" + idBuku + "'");
                out.print("removed");
            } else {
                // Jika belum ada → tambah
                db.runQuery("INSERT INTO wishlist (idPengguna, idBuku) VALUES ('" + idPengguna + "', '" + idBuku + "')");
                out.print("added");
            }

            if (rsCheck != null) {
                rsCheck.close();
            }
        }

        db.disconnect();
    } else {
        response.setStatus(400);
        out.print("invalid");
    }
%>
