<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="teamproject_2024_2025_ismgroup17.*, java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Status</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #7B68EE;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        .alert {
            font-size: 18px;
        }
    </style>
</head>
<body>



<%
        // Λήψη δεδομένων από τη φόρμα
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    UserDAO userdao = new UserDAO();

    try{
        User user= userdao.authenticate(username,password);
        User userObj2024 = (User) request.getAttribute("user");
        session.setAttribute("userObj2024", user);
        response.sendRedirect("SearchBar.jsp");
    }catch(Exception e){
        request.setAttribute("message", e.getMessage());%>

        <jsp:forward page="login.jsp"/> <%
        return;
    }

%>

<!-- Optional JavaScript for Bootstrap 3 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>
