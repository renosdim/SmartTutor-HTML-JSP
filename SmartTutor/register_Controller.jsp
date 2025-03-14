<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="teamproject_2024_2025_ismgroup17.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration Status</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <h2 class="text-center">Registration Status</h2>
    <div class="alert alert-info">

<%
    // Retrieve form data
    String username = request.getParameter("username");
    String fname = request.getParameter("fname"); // Διορθώθηκε από firstname -> fname
    String lname = request.getParameter("lname"); // Διορθώθηκε από lastname -> lname
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirm-password");
    String terms = request.getParameter("terms");

    // Verify if terms of service are accepted
    if (terms == null || !terms.equals("accepted")) {
        out.println("<p class='text-danger'>You must accept the Terms of Service.</p>");
    } 
    // Verify if passwords match
    else if (!password.equals(confirmPassword)) {
        out.println("<p class='text-danger'>Error: Passwords do not match!</p>");
    } 
    // If everything is correct, save the user to the database
    else {
        User user = new User();
        user.setUsername(username);
        user.setFname(fname); // Χρήση fname
        user.setLname(lname); // Χρήση lname
        user.setPhone(phone);
        user.setEmail(email);
        user.setPassword(password);

        UserDAO userDAO = new UserDAO();
        try {
            userDAO.register(user); // Χρήση της μεθόδου register αντί για registerUser
            out.println("<p class='text-success'>Your registration was successful!</p>");
            out.println("<p>Thank you, <strong>" + fname + " " + lname + "</strong>.</p>");
            out.println("<p>Your username is: <strong>" + username + "</strong></p>");
        } catch (Exception e) {
            out.println("<p class='text-danger'>An unexpected error occurred during registration. Please try again later.</p>");
            e.printStackTrace(); // Optional: Remove or replace with proper logging
        }
    }
%>

    </div>
    <a href="register.jsp" class="btn btn-warning">Back to Registration</a>
    <a href="login.jsp" class="btn btn-primary">Login</a>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
