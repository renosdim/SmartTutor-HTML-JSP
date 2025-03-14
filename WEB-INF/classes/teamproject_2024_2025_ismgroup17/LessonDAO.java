package teamproject_2024_2025_ismgroup17;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LessonDAO {

    public void BookLesson(Lesson lesson ) throws Exception{
    Connection conn = null;
    DB db = new DB();
    String sql= " SELECT * FROM lesson WHERE `tutor username`= ? AND `lesson date`= ? AND `lesson hour`=?;";
    String query = "INSERT INTO lesson (`student username`, `tutor username`, `lesson date`, `lesson hour`) VALUES (?, ?, ?, ?)";
    try{
          // Create an instance of the DB class
        conn = db.getConnection();  // Call getConnection() on the DB instance
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, lesson.getTutorId());
        ps.setString(2, lesson.getDate());
        ps.setString(3, lesson.getTime());
        ResultSet rs = ps.executeQuery();
		if (rs.next()){
			throw new Exception("Sorry, time slot is unavailable");
		} else{  
            PreparedStatement statement= conn.prepareStatement(query); 
            statement.setString(1, lesson.getStudentId());
            statement.setString(2, lesson.getTutorId());
            statement.setString(3, lesson.getDate());
            statement.setString(4, lesson.getTime());
            statement.executeUpdate();
            statement.close();
        }
        rs.close(); // closing ResultSet
	   	ps.close(); // closing PreparedStatement
	   	db.close(); // closing connection
		} catch (Exception e){
			throw new Exception(e.getMessage());
		} finally{
			try {
				db.close();
			} catch (Exception e) {
			}
		}
    }		
    
    
    

    public List<Lesson> findLessons(String keyword) throws Exception{
        List<Lesson> lessons = new ArrayList<Lesson>();
        Connection con = null;
        DB db = new DB();
        String query="SELECT* FROM lesson WHERE `student username`=? OR `tutor username`=?;";
        try{
            con= db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, keyword);
			stmt.setString(2, keyword);
            ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Lesson lesson = new Lesson(rs.getString("student username"), rs.getString("tutor username"), rs.getString("lesson date"),rs.getString("lesson hour"));
				lessons.add(lesson);
			}
			rs.close(); // closing ResultSet
	   		stmt.close();
            db.close();
            return lessons;
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
