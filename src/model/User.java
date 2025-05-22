

import java.util.Random;

public class User {
    public String id;
    public String username;
    public String password;

    public User(String username, String password, String prefix) {
        this.username = username;
        this.password = password;
        this.id = generateID(prefix);
    }

    public String generateID(String prefix) {
        Random rand = new Random();
        int number = rand.nextInt(9000) + 1000;
        return prefix + number;
    }
}
