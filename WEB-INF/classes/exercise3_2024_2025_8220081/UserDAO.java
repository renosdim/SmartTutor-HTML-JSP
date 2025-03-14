package exercise3_2024_2025_8220081;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


/**
 * UserDAO provides all the necessary methods related to users.
 * 
 * @author 
 *
 */
public class UserDAO {
		
	/**
	 * This method returns a List with all Users
	 * 
	 * @return List<User>
	 */
	public List<User> getUsers() throws Exception {
		Connection con = null;
		List<User> users = new ArrayList<>(); 
		DB db = new DB();
				
		// ΘΕΜΑ 1 A
		String sql= " SELECT * FROM users_ex3_8220081_2024_2025;" ;
		try{
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement( sql );
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				User user = new User(rs.getString("firstname"), rs.getString("lastname"), rs.getString("email"),rs.getString("username"), rs.getString("password"));
				users.add(user);
			}

			rs.close(); // closing ResultSet
	   		stmt.close(); // closing PreparedStatement
	   		db.close(); // closing connection
			return users;
	}catch(Exception e){
		throw new Exception(e.getMessage());
	} finally{
		try {
			db.close();
		} catch (Exception e) {
		}
	}
	} //End of getUsers

	/**
	 * Search user by username
	 * 
	 * @param username, String
	 * @return User, the User object or null
	 * @throws Exception
	 */
	public User findUser(String username) throws Exception {
		

		// ΘΕΜΑ 1 B
		Connection con = null;
		DB db = new DB();
		String sql= " SELECT * FROM users_ex3_8220081_2024_2025 WHERE username= ?;";

		try{
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()){
			User user = new User(rs.getString("firstname"), rs.getString("lastname"), rs.getString("email"),rs.getString("username"), rs.getString("password"));
			rs.close(); // closing ResultSet
	   		stmt.close(); // closing PreparedStatement
	   		db.close(); // closing connection
			return user;
			}else{
				return null;
			}
		} catch (Exception e){
			throw new Exception(e.getMessage());
		} finally{
			try {
				db.close();
			} catch (Exception e) {
			}
		}		
	} //End of findUser

	/**
	 * This method is used to authenticate a user.
	 * 
	 * @param username, String
	 * @param password, String
	 * @return User, the User object
	 * @throws Exception, if the credentials are not valid
	 */
	public User authenticate(String username, String password) throws Exception {	
		// ΘΕΜΑ 1 C
		Connection con = null;
		DB db = new DB();
		String sql= " SELECT * FROM users_ex3_8220081_2024_2025 WHERE username= ? AND password= ?;";
		try{
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()){
			User user = new User(rs.getString("firstname"), rs.getString("lastname"), rs.getString("email"),rs.getString("username"), rs.getString("password"));
			rs.close(); // closing ResultSet
	   		stmt.close(); // closing PreparedStatement
	   		db.close(); // closing connection
			return user;
			} else{
				throw new Exception("Wrong username or password");
			}
		} catch (Exception e){
			throw new Exception(e.getMessage());
		} finally{
			try {
				db.close();
			} catch (Exception e) {
			}
		}		
			
		
	} //End of authenticate
	
	/**
	 * Register/create new User.
	 * 
	 * @param user, User
	 * @throws Exception, if encounter any error.
	 */
	public void register(User user) throws Exception {
			// ΘΕΜΑ 1 D
		Connection con = null;
		DB db = new DB();
		String sql= " SELECT * FROM users_ex3_8220081_2024_2025 WHERE username= ? OR email= ?;";
		String sqlregister= "INSERT INTO users_ex3_8220081_2024_2025 (`username`,`firstname`,`lastname`,`email`,`password`) " 
                            + " VALUES (?, ?, ?, ?, ?);";
		try{
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getEmail());
			ResultSet rs = stmt.executeQuery();
			if (rs.next()){
				throw new Exception("Sorry, username or email already exists");
			} else{
				PreparedStatement statement= con.prepareStatement(sqlregister);
				statement.setString(1, user.getUsername() );
				statement.setString(2, user.getFirstname());
				statement.setString(3, user.getLastname());
				statement.setString(4, user.getEmail());
				statement.setString(5, user.getPassword());
				statement.executeUpdate();
			}
			rs.close(); // closing ResultSet
	   		stmt.close(); // closing PreparedStatement
	   		db.close(); // closing connection
		} catch (Exception e){
			throw new Exception(e.getMessage());
		} finally{
			try {
				db.close();
			} catch (Exception e) {
			}
		}		
		
		
	}//end of register

} //End of class
