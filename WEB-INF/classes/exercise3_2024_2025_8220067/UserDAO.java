package exercise3_2024_2025_8220067;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import exercise3_2024_2025_8220067.DB;
import exercise3_2024_2025_8220067.User;

public class UserDAO {
    private static final String TABLE_NAME = "users_ex3_8220067_2024_2025";

    private static void closeResources(Connection conn, PreparedStatement stmt, ResultSet rs) {
        try {
            if (rs != null) rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (stmt != null) stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> getUsers() throws Exception {
        List<User> users = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            DB db = new DB(); // Create an instance of DB
            conn = db.getConnection(); // Use the instance to call getConnection()
            String query = "SELECT firstname, lastname, email, username, password FROM " + TABLE_NAME;
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                User user = new User(
                    rs.getString("firstname"),
                    rs.getString("lastname"),
                    rs.getString("email"),
                    rs.getString("username"),
                    rs.getString("password")
                );
                users.add(user);
            }
        } catch (SQLException e) {
            throw new Exception("Error retrieving users: " + e.getMessage());
        } finally {
            closeResources(conn, stmt, rs);
        }
        return users;
    }

    public User findUser(String username) throws Exception {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            DB db = new DB(); // Create an instance of DB
            conn = db.getConnection(); // Use the instance to call getConnection()
            String query = "SELECT firstname, lastname, email, username, password FROM " + TABLE_NAME + " WHERE username = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            if (rs.next()) {
                return new User(
                    rs.getString("firstname"),
                    rs.getString("lastname"),
                    rs.getString("email"),
                    rs.getString("username"),
                    rs.getString("password")
                );
            } else {
                return null;
            }
        } catch (SQLException e) {
            throw new Exception("Error finding user: " + e.getMessage());
        } finally {
            closeResources(conn, stmt, rs);
        }
    }

    public User authenticate(String username, String password) throws Exception {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            DB db = new DB(); // Create an instance of DB
            conn = db.getConnection(); // Use the instance to call getConnection()
            String query = "SELECT firstname, lastname, email, username, password FROM " + TABLE_NAME + " WHERE username = ? AND password = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password); 
            rs = stmt.executeQuery();

            if (rs.next()) {
                return new User(
                    rs.getString("firstname"),
                    rs.getString("lastname"),
                    rs.getString("email"),
                    rs.getString("username"),
                    rs.getString("password")
                );
            } else {
                throw new Exception("Wrong username or password");
            }
        } catch (SQLException e) {
            throw new Exception("Error during authentication: " + e.getMessage());
        } finally {
            closeResources(conn, stmt, rs);
        }
    }

    public void register(User user) throws Exception {
        Connection conn = null;
        PreparedStatement checkStmt = null;
        PreparedStatement insertStmt = null;
        ResultSet rs = null;

        try {
            DB db = new DB(); // Create an instance of DB
            conn = db.getConnection(); // Use the instance to call getConnection()

            String checkQuery = "SELECT username, email FROM " + TABLE_NAME + " WHERE username = ? OR email = ?";
            checkStmt = conn.prepareStatement(checkQuery);
            checkStmt.setString(1, user.getUsername());
            checkStmt.setString(2, user.getEmail());
            rs = checkStmt.executeQuery();

            if (rs.next()) {
                throw new Exception("Sorry, username or email already registered");
            }

            String insertQuery = "INSERT INTO " + TABLE_NAME + " (firstname, lastname, email, username, password) VALUES (?, ?, ?, ?, ?)";
            insertStmt = conn.prepareStatement(insertQuery);
            insertStmt.setString(1, user.getFirstname());
            insertStmt.setString(2, user.getLastname());
            insertStmt.setString(3, user.getEmail());
            insertStmt.setString(4, user.getUsername());
            insertStmt.setString(5, user.getPassword()); 
            insertStmt.executeUpdate();

        } catch (SQLException e) {
            throw new Exception("Error during registration: " + e.getMessage());
        } finally {
            closeResources(conn, checkStmt, rs);
            closeResources(null, insertStmt, null);
        }
    }
}