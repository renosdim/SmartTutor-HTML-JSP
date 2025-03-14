package teamproject_2024_2025_ismgroup17;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private DB db = new DB(); // Instance of your database helper class

    /**
     * This method returns a List with all Users.
     *
     * @return List<User>
     * @throws Exception
     */
    public List<User> getUsers() throws Exception {
        String sql = "SELECT * FROM users";
        List<User> userList = new ArrayList<>();

        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setFname(rs.getString("fname"));
                user.setLname(rs.getString("lname"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                userList.add(user);
            }

        } catch (SQLException e) {
            throw new Exception("Error retrieving users: " + e.getMessage());
        }

        return userList;
    }

    /**
     * Search user by username.
     *
     * @param username, String
     * @return User, the User object or null
     * @throws Exception
     */
    public User findUser(String username) throws Exception {
        Connection con = null;
		DB db = new DB();
        String sql = "SELECT * FROM user WHERE username = ?";
        try{
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery(); 
            if (rs.next()) {
                User user = new User(rs.getString("username"),rs.getString("firstname"),rs.getString("lastname"),rs.getString("email"),rs.getString("password"),rs.getString("phone"));
                rs.close(); // closing ResultSet
	   		    stmt.close(); // closing PreparedStatement
	   		    db.close(); // closing connection
                return user;
            } else{
                return null;
            }
            } catch (SQLException e) {
                throw new Exception("Error finding user: " + e.getMessage());
            }finally{
                try {
                    db.close();
                } catch (Exception e) {
                }
            }	
    }

    /**
     * This method is used to authenticate a user.
     *
     * @param username, String
     * @param password, String
     * @return User, the User object if credentials are valid, or null otherwise
     * @throws Exception, for database-related errors
     */
    public User authenticate(String username, String password) throws Exception {
        Connection con = null;
		DB db = new DB();
        String sql = "SELECT * FROM user WHERE username = ? AND password = ?";

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, username);
            stmt.setString(2, password); // Assuming passwords are not hashed for simplicity

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                User user = new User(rs.getString("username"),rs.getString("firstname"),rs.getString("lastname"),rs.getString("email"),rs.getString("password"),rs.getString("phone"));
                rs.close(); // closing ResultSet
	   		    stmt.close(); // closing PreparedStatement
	   		    db.close(); // closing connection
			    return user;
			} else{
				throw new Exception("Wrong username or password");
			}  
        } catch (Exception e) {
            throw new Exception("Error during authentication: " + e.getMessage());
        }finally{
			try {
				db.close();
			} catch (Exception e) {
			}
		}	
    }

    /**
     * Register/create new User.
     *
     * @param user, User
     * @throws Exception, if encounter any error.
     */
    public void register(User user) throws Exception {
        String sql = "INSERT INTO user (username, firstname, lastname, email, password, phone) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getFname());
            stmt.setString(3, user.getLname());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getPassword());
            stmt.setString(6, user.getPhone());

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted == 0) {
                throw new Exception("User registration failed. Please try again.");
            }

        } catch (SQLException e) {
            throw new Exception("Error during user registration: " + e.getMessage());
        }
    }
}
