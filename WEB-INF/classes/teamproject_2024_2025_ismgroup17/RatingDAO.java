package teamproject_2024_2025_ismgroup17;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RatingDAO {

    private DB db = new DB(); // Database helper class instance

    /**
     * Add a new rating to the database.
     *
     * @param rating The rating object to insert.
     * @throws Exception If an error occurs during the operation.
     */
    public void addRating(Rating rating) throws Exception {
        String sql = "INSERT INTO rating (`student username`, `tutor username`, `number of stars`, `comments`) VALUES (?, ?, ?, ?)";
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, rating.getStudentUsername());
            stmt.setString(2, rating.getTutorUsername());
            stmt.setInt(3, rating.getNumberOfStars());
            stmt.setString(4, rating.getComments());

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted == 0) {
                throw new Exception("Failed to add rating. Please try again.");
            }
        } catch (SQLException e) {
            throw new Exception("Error while adding rating: " + e.getMessage());
        }
    }

    /**
     * Retrieve all ratings for a specific tutor.
     *
     * @param tutorUsername The username of the tutor.
     * @return A list of ratings for the tutor.
     * @throws Exception If an error occurs during the operation.
     */
    public List<Rating> getRatingsForTutor(String tutorUsername) throws Exception {
        String sql = "SELECT * FROM rating WHERE `tutor username` = ?";
        List<Rating> ratings = new ArrayList<>();
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, tutorUsername);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Rating rating = new Rating();
                    rating.setRatingId(rs.getInt("rating id"));
                    rating.setStudentUsername(rs.getString("student username"));
                    rating.setTutorUsername(rs.getString("tutor username"));
                    rating.setNumberOfStars(rs.getInt("number of stars"));
                    rating.setComments(rs.getString("comments"));
                    ratings.add(rating);
                }
            }
        } catch (SQLException e) {
            throw new Exception("Error while retrieving ratings: " + e.getMessage());
        }
        return ratings;
    }

    /**
     * Retrieve all ratings given by a specific student.
     *
     * @param studentUsername The username of the student.
     * @return A list of ratings given by the student.
     * @throws Exception If an error occurs during the operation.
     */
    public List<Rating> getRatingsByStudent(String studentUsername) throws Exception {
        String sql = "SELECT * FROM rating WHERE `student username` = ?";
        List<Rating> ratings = new ArrayList<>();
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, studentUsername);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Rating rating = new Rating();
                    rating.setRatingId(rs.getInt("rating id"));
                    rating.setStudentUsername(rs.getString("student username"));
                    rating.setTutorUsername(rs.getString("tutor username"));
                    rating.setNumberOfStars(rs.getInt("number of stars"));
                    rating.setComments(rs.getString("comments"));
                    ratings.add(rating);
                }
            }
        } catch (SQLException e) {
            throw new Exception("Error while retrieving ratings: " + e.getMessage());
        }
        return ratings;
    }

    /**
     * Delete a rating by its ID.
     *
     * @param ratingId The ID of the rating to delete.
     * @throws Exception If an error occurs during the operation.
     */
    public void deleteRating(int ratingId) throws Exception {
        String sql = "DELETE FROM rating WHERE `rating id` = ?";
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, ratingId);

            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted == 0) {
                throw new Exception("Failed to delete rating. Rating not found.");
            }
        } catch (SQLException e) {
            throw new Exception("Error while deleting rating: " + e.getMessage());
        }
    }

    public boolean FindRating(String student, String tutor) throws Exception {
        String sql = "SELECT * FROM rating WHERE `student username`=? AND `tutor username`=?";
        boolean beenrated= false;
        try (Connection con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, student);
            stmt.setString(2, tutor);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    beenrated= true;
                }
            }
            return beenrated;
        } catch (SQLException e) {
            throw new Exception("Error while adding rating: " + e.getMessage());
        }
    }
}
