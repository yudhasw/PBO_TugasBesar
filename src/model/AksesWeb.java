package classes;

import org.mindrot.jbcrypt.BCrypt;

public class AksesWeb {
    private String username;
    private String password;
    private String confirmPassword;

    public AksesWeb(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public AksesWeb(String username, String password, String confirmPassword) {
        this.username = username;
        this.password = password;
        this.confirmPassword = confirmPassword;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public String login() {
        String status = "Login gagal";
        try {
            JDBC db = new JDBC();
            
            String cekUsername = db.getData("SELECT username FROM pengguna WHERE username ='" + username + "';", "username");
            String hashedPassword = db.getData("SELECT password FROM pengguna WHERE username ='" + username + "';", "password");
            System.out.println("hashedPassword: "+hashedPassword);    
            
            if (cekUsername == null) {
                status = "Username salah";
            } else {
                if (cekUsername.equals("admin")){
                    status = "admin";
                }
                if (hashedPassword != null && BCrypt.checkpw(password, hashedPassword)) {
                    if (cekUsername.equals("admin")){
                        status = "admin";
                    } else {
                        status = "Login berhasil";
                    }
                } else {
                    status = "Password salah";
                }
            }

            System.out.println("STATUS LOGIN: " + status + "\n"
                    + "HASHED PASSWORD: " + hashedPassword + "\n PASSWORD: " + password
                    + "\n USERNAME: " + username);

        } catch (Exception e) {
            status = "Terjadi kesalahan sistem";
        }
        return status;
    }

    public String register() {
        String statusR = "Register gagal";
        try {
            JDBC db = new JDBC();
            String cekUsername = db.getData("SELECT username FROM pengguna WHERE username ='" + username + "';", "username");

            if (cekUsername == null) { // username belum ada
                if (password.equals(confirmPassword)) {
                    String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
                    db.runQuery("INSERT INTO pengguna(username, password) VALUES ('" + username + "', '" + hashed + "');");
                    statusR = "Register berhasil";
                } else {
                    statusR = "Password dan konfirmasi tidak sama";
                }
            } else {
                statusR = "Username sudah terdaftar";
            }

            System.out.println("STATUS REGISTER: " + statusR + "\n"
                    + "PASSWORD: " + password + "\n CONFIRM PASSWORD: " + confirmPassword
                    + "\n USERNAME: " + username);

        } catch (Exception e) {
            statusR = "Terjadi kesalahan: " + e.getMessage();
        }

        return statusR;
    }
}
