package teamproject_2024_2025_ismgroup17;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;



public class TutorDAO {


    public List<Tutor> FilterTutors(String subject, String educationlevel, String gender,String language,int maxprice) throws Exception {
		Connection con = null;
		List<Tutor> reccomendedTutors  = new ArrayList<>(); 
		DB db = new DB();
				
		// ΘΕΜΑ 1 A
		String sql= " SELECT * FROM Tutor WHERE `subject`= ? AND `course level`= ? AND `gender`= ? AND `teaching language`= ? AND `max price`>= ? AND `min price`<=?;" ;
		String sql1= " SELECT * FROM Tutor WHERE `subject`= ? AND `course level`= ? AND `teaching language`= ? AND `max price`>= ? AND `min price`<=?;" ;
		String sql2= " SELECT * FROM Tutor WHERE `subject`= ? AND `course level`= ? AND `gender`= ? AND `max price`>= ? AND `min price`<=?;" ;
		String sql3= " SELECT * FROM Tutor WHERE `subject`= ? AND `course level`= ?  AND `max price`>= ? AND `min price`<=?;" ;
		try{
			con = db.getConnection();
			if (gender.equals("Any") && language.equals("Any") ){
				PreparedStatement stmt = con.prepareStatement( sql3 );
				stmt.setString(1, subject);
				stmt.setString(2, educationlevel);
				stmt.setInt(3,maxprice);
				stmt.setInt(4,maxprice);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {
					Tutor found_tutor = new Tutor(rs.getString("username"), rs.getString("firstname"), rs.getString("lastname"),rs.getString("email"), rs.getString("password"),rs.getString("phone"),rs.getString("subject"),rs.getString("course level"),rs.getString("gender"),rs.getString("date of birth"),rs.getInt("min price"),rs.getInt("max price"),rs.getString("teaching language"),rs.getString("biography"));
					reccomendedTutors.add(found_tutor);
				}
				rs.close(); // closing ResultSet
	   			stmt.close();
			} else if(gender.equals("Any")){
				PreparedStatement stmt = con.prepareStatement( sql1 );
				stmt.setString(1, subject);
				stmt.setString(2, educationlevel);
				stmt.setString(3,language);
				stmt.setInt(4,maxprice);
				stmt.setInt(5,maxprice);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {
					Tutor found_tutor = new Tutor(rs.getString("username"), rs.getString("firstname"), rs.getString("lastname"),rs.getString("email"), rs.getString("password"),rs.getString("phone"),rs.getString("subject"),rs.getString("course level"),rs.getString("gender"),rs.getString("date of birth"),rs.getInt("min price"),rs.getInt("max price"),rs.getString("teaching language"),rs.getString("biography"));
					reccomendedTutors.add(found_tutor);
				}
				rs.close(); // closing ResultSet
	   			stmt.close();
			} else if(language.equals("Any")){
				PreparedStatement stmt = con.prepareStatement( sql2 );
				stmt.setString(1, subject);
				stmt.setString(2, educationlevel);
            	stmt.setString(3, gender);
            	stmt.setInt(4,maxprice);
				stmt.setInt(5,maxprice);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {
					Tutor found_tutor = new Tutor(rs.getString("username"), rs.getString("firstname"), rs.getString("lastname"),rs.getString("email"), rs.getString("password"),rs.getString("phone"),rs.getString("subject"),rs.getString("course level"),rs.getString("gender"),rs.getString("date of birth"),rs.getInt("min price"),rs.getInt("max price"),rs.getString("teaching language"),rs.getString("biography"));
					reccomendedTutors.add(found_tutor);
				}
				rs.close(); // closing ResultSet
	   			stmt.close();
			}else{
				PreparedStatement stmt = con.prepareStatement( sql );
            	stmt.setString(1, subject);
				stmt.setString(2, educationlevel);
            	stmt.setString(3, gender);
            	stmt.setString(4,language);
            	stmt.setInt(5,maxprice);
				stmt.setInt(6,maxprice);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {
					Tutor found_tutor = new Tutor(rs.getString("username"), rs.getString("firstname"), rs.getString("lastname"),rs.getString("email"), rs.getString("password"),rs.getString("phone"),rs.getString("subject"),rs.getString("course level"),rs.getString("gender"),rs.getString("date of birth"),rs.getInt("min price"),rs.getInt("max price"),rs.getString("teaching language"),rs.getString("biography"));
					reccomendedTutors.add(found_tutor);
				}
				rs.close(); // closing ResultSet
	   			stmt.close(); // closing PreparedStatement
			}
	   		db.close(); // closing connection
			return reccomendedTutors;
	}catch(Exception e){
		throw new Exception(e.getMessage());
	} finally{
		try {
			db.close();
		} catch (Exception e) {
		}
	}
    }

	public Tutor FindTutor(String username) throws Exception{
		Connection con = null;
		DB db = new DB();
		String query= "SELECT * FROM Tutor WHERE username=?;";
		try{
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()){
			Tutor tutor = new Tutor(rs.getString("username"), rs.getString("firstname"), rs.getString("lastname"),rs.getString("email"), rs.getString("password"),rs.getString("phone"),rs.getString("subject"),rs.getString("course level"),rs.getString("gender"),rs.getString("date of birth"),rs.getInt("min price"),rs.getInt("max price"),rs.getString("teaching language"),rs.getString("biography"));
			rs.close();
			stmt.close();;
			db.close();
			return tutor;
			}else {
				rs.close();
				stmt.close();;
				db.close();
				return null;
			}
		}catch(Exception e){
		    throw new Exception(e.getMessage());
		} finally{
			try {
				db.close();
			} catch (Exception e) {
			}
		}

	}
}
