<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <!-- Bootstrap 3 CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #7B68EE;
            font-family: Arial, sans-serif;
        }
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
            background-color: rgb(73, 0, 128); 
            border: none;
        }
        .navbar .navbar-brand {
            color: white; 
        }
        .navbar .navbar-brand:hover {
            color: #d1c7f1; 
        }
        .navbar-nav > li > a {
            color: white; 
        }
        .navbar-nav > li > a:hover {
            background-color: #5a007d; 
            color: white;
        }
        form {
            background-color: #FFFFFF;
            border: 2px solid #000000;
            padding: 20px;
            max-width: 500px;
            margin: 40px auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            font-weight: bold;
            color: #333;
        }
        input[type="submit"] {
            padding: 8px 15px;
            background-color: black;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            opacity: 0.8;
        }
        h2 {
            text-align: center;
            color: black;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="login.jsp">Smart Tutor</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="register.jsp">Register</a></li> 
                <li><a href="login.jsp">Login</a></li> 
            </ul>
        </div>
    </nav>
    <div class="container" role="main">
    <% if(request.getAttribute("message") != null) { %>		
        <div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
    <% } %>

    <!-- Login Form -->
    <form action="login_Controller.jsp" method="POST">
        <h2>Login</h2>
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" class="form-control" placeholder="Enter your username">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password">
        </div>
        <input type="submit" value="Submit">
    </form>
    </div>

    <!-- Optional JavaScript for Bootstrap 3 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
