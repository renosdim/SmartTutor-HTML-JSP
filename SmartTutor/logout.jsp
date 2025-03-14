
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>

<%
    // Εξακρίβωση και ακύρωση της συνεδρίας του χρήστη
    session.invalidate();
%>

<!DOCTYPE html>
<html lang="el">
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
    <!-- Bootstrap 3 CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #7B68EE;
            font-family: Arial, sans-serif;
        }
        .navbar-nav > li {
            float: left;
            display: inline-block;
        }
        .navbar-nav > li > a {
            padding-left: 15px;
            padding-right: 15px;
        }
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }
        .alert {
            font-size: 18px;
            font-weight: bold;
            text-align: center;
        }
        footer {
            margin-top: 50px;
            background-color: #222;
            color: white;
            padding: 10px 0;
            text-align: center;
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

    <!-- Logout Success Message -->
    <div class="container">
        <div class="alert alert-success" role="alert">
            You have successfully logged out. You will be redirected to the home page in 2 seconds.
        </div>
    </div>

    

    <!-- Bootstrap core JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- Αυτόματος ανακαθορισμός της σελίδας μετά από 2 δευτερόλεπτα -->
    <meta http-equiv="refresh" content="2;url=index.jsp" />

</body>
</html>
