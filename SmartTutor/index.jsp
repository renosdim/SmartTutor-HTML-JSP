<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="ErrorPage.jsp"%>
<%@ page import="teamproject_2024_2025_ismgroup17.*"%>
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
            background-color: rgb(73, 0, 128); /* Εφαρμογή του επιθυμητού χρώματος */
            border: none;
        }
        .navbar .navbar-brand {
            color: white; /* Χρώμα του brand */
        }
        .navbar .navbar-brand:hover {
            color: #d1c7f1; /* Εφέ hover στο brand */
        }
        .navbar-nav > li > a {
            color: white; /* Χρώμα του κειμένου */
        }
        .navbar-nav > li > a:hover {
            background-color: #5a007d; /* Χρώμα background κατά το hover */
            color: white;
        }
        h1, p {
            color: black;
            text-align: center;
        }
        h1 {
            font-size: 2em;
            font-weight: bold;
        }
        p {
            font-size: 1em;
            font-weight: normal;
        }
        .container {
            background-color: #FFFFFF;
            padding: 20px;
            border-radius: 10px;
            margin-top: 40px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <%
    User user1 = (User) session.getAttribute("userObj2024");

    if (user1 != null) {%>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp">Smart Tutor</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="ProfilePage.jsp">Your Profile</a></li> 
                    <li><a href="logout.jsp">Sign out</a></li> 
                </ul>
            </div>
        </nav>
        
    <%} else{ %>

    <!-- Navbar -->
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp">Smart Tutor</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="register.jsp">Register</a></li> 
                <li><a href="login.jsp">Login</a></li> 
            </ul>
        </div>
    </nav>
    <% }%>

    <!-- Content of Home Page -->
    <div class="container mt-5">
        <h1>Welcome to Smart Tutor!</h1>
        <p>This website was created to facilitate the search and discovery of private tutors. The platform aims to serve students who wish to enhance their knowledge or improve their skills, as well as adults who want to expand their knowledge in various subjects. All lessons are conducted exclusively online, providing flexibility and convenience for both students and tutors.</p>
<p>To search for tutors, students are required to register on the website, as are tutors who wish to create their profiles. During the registration process, tutors provide additional information that helps students and adults find the right tutor based on their personal needs and preferences.</p>
<p>The website is designed to offer a user-friendly and intuitive experience, with simple and fast processes that make tutor searches quick and easy. A key feature of the platform is the ability to leave feedback and provide evaluations; students can rate their tutors after completing their lessons, providing valuable information for future users.</p>
<p>Overall, the website seeks to simplify the learning process, offering a user-friendly environment that brings together students and tutors. The interaction and teaching methods are designed to be straightforward and effective, promoting a positive educational experience for all users. By focusing exclusively on online lessons, the platform ensures accessibility and convenience, making it an ideal solution for modern learners.</p>

    </div>

    <!-- Optional JavaScript for Bootstrap 3 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
