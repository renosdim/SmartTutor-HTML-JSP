package teamproject_2024_2025_ismgroup17;

// Class definition starts here
public class User {

    // Attributes corresponding to the database columns
    private String username;
    private String fname;
    private String lname;
    private String phone;
    private String email;
    private String password;

    // Default Constructor
    public User() {
    }

    // Constructor with parameters
    public User(String username, String fname, String lname, String email, String password, String phone) {
        this.username = username;
        this.fname = fname;
        this.lname = lname;
        this.phone = phone;
        this.email = email;
        this.password = password;
    }

    // Getters and Setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
