<%-- 
    Document   : logout
    Created on : 28 May 2025, 16.40.26
    Author     : alif
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();

    response.sendRedirect("penggunaGuest.jsp");
%>
