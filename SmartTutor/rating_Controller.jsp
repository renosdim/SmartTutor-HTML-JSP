<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="teamproject_2024_2025_ismgroup17.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Submit Rating</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #7B68EE;">
    <div class="container" style="margin-top: 50px;">
        <h2 class="text-center">Rating Submission Status</h2>
        <div class="alert alert-info">
            <%
            // Λήψη δεδομένων από τη φόρμα
            String studentUsername = request.getParameter("susername"); 
            String tutorUsername = request.getParameter("tusername"); 
            String numberOfStarsStr = request.getParameter("rating"); 
            String comments = request.getParameter("comments");

            // Δημιουργία αντικειμένου Rating
            Rating rating = new Rating();

            // Έλεγχος και ανάθεση τιμών μόνο αν τα δεδομένα είναι διαθέσιμα
            if (studentUsername != null && !studentUsername.trim().isEmpty()) {
                rating.setStudentUsername(studentUsername.trim());
            } else {
                out.println("<div class='alert alert-danger'>Error: Student username is missing.</div>");
                return;
            }

            if (tutorUsername != null && !tutorUsername.trim().isEmpty()) {
                rating.setTutorUsername(tutorUsername.trim());
            } else {
                out.println("<div class='alert alert-danger'>Error: Tutor username is missing.</div>");
                return;
            }

            if (numberOfStarsStr != null && !numberOfStarsStr.trim().isEmpty()) {
                try {
                    int numberOfStars = Integer.parseInt(numberOfStarsStr.trim());
                    rating.setNumberOfStars(numberOfStars);
                } catch (NumberFormatException e) {
                    out.println("<div class='alert alert-danger'>Error: Invalid number of stars.</div>");
                    return;
                }
            } else {
                out.println("<div class='alert alert-danger'>Error: Number of stars is missing.</div>");
                return;
            }

            if (comments != null && !comments.trim().isEmpty()) {
                rating.setComments(comments.trim());
            } else {
                rating.setComments(null); // Επιτρέπεται να είναι null
            }

            try {
                // Εισαγωγή στη βάση μέσω DAO
                RatingDAO ratingDAO = new RatingDAO();
                ratingDAO.addRating(rating);

                out.println("<div class='alert alert-success'>Your rating was submitted successfully!</div>");
            } catch (Exception e) {
                out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
            }
            %>
        </div>

        <a href="ProfilePage.jsp?uname=<%=tutorUsername%>" class="btn btn-primary">Back to Profile</a>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
