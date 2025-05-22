<%@page contentType="text/html" pageEncoding="UTF-8"%>
<center>
    <h1>Login</h1>
    <form action="login" method="post">
        <table>
            <tr>
                <td><label for="username">Username:</label></td>
                <td><input type="text" id="username" name="username" required></td>
            </tr>
            <tr>
                <td><label for="password">Password:</label></td>
                <td><input type="password" id="password" name="password" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Login"></td>
            </tr>
            <tr>
                <td>Belum punya akun? <a href="register.jsp">Daftar di sini</a></td>
            </tr>
        </table>
    </form>

    <% if (request.getAttribute("error") != null) { %>
        <p style="color: red;"><%= request.getAttribute("error") %></p>
    <% } %>
</center>
