/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;
/**
 *
 * @author yudha
 */
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
        String status = "Login berhasil";
        try {
            JDBC db = new JDBC();
            String cekUsername = db.getData("SELECT username FROM pengguna WHERE username ='" + username + "';", "username");
            String cekPassword = db.getData("SELECT password FROM pengguna WHERE username ='" + username + "';", "password");
            
            //Memeriksa apakah username ada di DB
            if (cekUsername != null && "admin".equals(cekUsername.trim())){
                status = "admin";
            } else if (cekUsername != null){                  
                status = "Login berhasil";         
            } else {
                status = "Username salah";
            }
            
            //Memeriksa apakah password benar
            if (cekPassword != null && !cekPassword.trim().equals(password.trim())) {
                status = "Password salah"; 
            }

            System.out.println("STATUS: " + status +"\n"
                    + "cekPASSWORD: "+cekPassword +"\n PASSWORD: "+password 
                    + "\n cekUSERNAME: "+cekUsername +"\n USERNAME: "+username);
        } catch(Exception e){
            status = "Terjadi kesalahan sistem";
        }
        return status;  
    }

    public String register() {
        String statusR = "Register berhasil";
        try {
            JDBC db = new JDBC();
            String cekUsername = db.getData("SELECT username FROM pengguna WHERE username ='" + username + "';", "username");
            
            if (cekUsername == null){ //Username belum terdaftar di DB
                if (password.equals(confirmPassword)){ //Password dan confirm password sama
                    db.runQuery("INSERT pengguna(username, password) VALUES ('"+username+"','"+password+"');");
                    System.out.println("INSERT pengguna(username, password) VALUES ('"+username+"','"+password+"');");
                    statusR = "Register berhasil";
                } else { //Password dan confirm password tidak sama
                    statusR = "password dan konfirmasi password tidak sama";
                }
            } else { //Username sudah digunakan
                statusR = "Username sudah terdaftar";
            }
            
            System.out.println("STATUS: " + statusR +"\n"
                    +"\n PASSWORD: "+password+ "\n CONFIRM PASSWORD: " + confirmPassword
                    + "\n cekUSERNAME: "+cekUsername +"\n USERNAME: "+username);
        } catch (Exception e) {
            statusR = e.getMessage();
        }
        return statusR;
    } 
}

