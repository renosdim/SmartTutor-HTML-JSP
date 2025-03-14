
package teamproject_2024_2025_ismgroup17;

public class Rating {
    private int ratingId; // Primary key
    private String studentUsername; // Username of the student giving the rating
    private String tutorUsername; // Username of the tutor being rated
    private int numberOfStars; // Number of stars (e.g., 1-5)
    private String comments; // Comments provided by the student

    // Default Constructor
    public Rating() {
    }

    // Constructor with parameters
    public Rating(int ratingId, String studentUsername, String tutorUsername, int numberOfStars, String comments) {
        this.ratingId = ratingId;
        this.studentUsername = studentUsername;
        this.tutorUsername = tutorUsername;
        this.numberOfStars = numberOfStars;
        this.comments = comments;
    }

    // Getters and Setters
    public int getRatingId() {
        return ratingId;
    }

    public void setRatingId(int ratingId) {
        this.ratingId = ratingId;
    }

    public String getStudentUsername() {
        return studentUsername;
    }

    public void setStudentUsername(String studentUsername) {
        this.studentUsername = studentUsername;
    }

    public String getTutorUsername() {
        return tutorUsername;
    }

    public void setTutorUsername(String tutorUsername) {
        this.tutorUsername = tutorUsername;
    }

    public int getNumberOfStars() {
        return numberOfStars;
    }

    public void setNumberOfStars(int numberOfStars) {
        this.numberOfStars = numberOfStars;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }
}
