<%-- 
    Document   : hapusWishlist
    Created on : 1 Jun 2025, 00.35.08
    Author     : alif
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="classes.JDBC" %>
<%@ page import="java.sql.*" %>
<%
    String username = (String) session.getAttribute("username");
    String idBuku = request.getParameter("idBuku");

    if (username != null && idBuku != null) {
        JDBC db = new JDBC();
        ResultSet rs = db.getDataAll("SELECT id FROM pengguna WHERE username='" + username + "'");
        String idPengguna = null;

        if (rs != null && rs.next()) {
            idPengguna = rs.getString("id");
            rs.close();
        }

        if (idPengguna != null) {
            db.runQuery("DELETE FROM wishlist WHERE idPengguna='" + idPengguna + "' AND idBuku='" + idBuku + "'");
        }

        db.disconnect();
    }
%>

