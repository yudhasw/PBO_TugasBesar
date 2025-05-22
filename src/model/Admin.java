

public class Admin extends User {
    private String hakAkses;

    public Admin(String username, String password, String hakAkses) {
        super(username, password, "A"); // Prefix "ADM" untuk ID Admin
        this.hakAkses = hakAkses;
    }

    // Method sesuai class diagram
    public void TambahHapusBuku() {
        
    }

    public void MengaturReview() {
        
    }

    public void DaftarPenjualanBuku() {
        
    }

  
    public String getHakAkses() {
        return hakAkses;
    }

 
    public void setHakAkses(String hakAkses) {
        this.hakAkses = hakAkses;
    }


    public void displayInfo() {
        System.out.println("ID: " + id);
        System.out.println("Username: " + username);
        System.out.println("Hak Akses: " + hakAkses);
    }
}
