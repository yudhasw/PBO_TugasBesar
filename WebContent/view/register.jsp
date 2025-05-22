<center>
    <h1>Register</h1>
    <form action="register" method="post">
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
                <td><label for="confirm_password">Konfirmasi Password:</label></td>
                <td><input type="password" id="confirm_password" name="confirm_password" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Login"></td>
            </tr>
            <tr>
                <td>Sudah punya akun? <a href="login.jsp">Login di sini</a></td>
            </tr>
        </table>
    </form>

    <% if (request.getAttribute("error") != null) { %>
        <p style="color: red;"><%= request.getAttribute("error") %></p>
    <% } %>
</center>
