<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>


<!DOCTYPE html>
<html lang="en">
	<head>        
	<title> Error </title>

    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="sofos@aueb.gr">
	<link rel="icon" href="images/favicon.ico">



	<![endif]-->

	</head>
    <style>
    .container {
        background-color:rgb(73, 0, 128);
        color:white ; 
    }
    .nav navbar-nav{
        background-color:rgb(73, 0, 128);
        color:white ; 
    }
    .navbar.navbar-inverse.navbar-fixed-top {
        background-color: rgb(73, 0, 128); /* Purple background */
        border: none; /* Remove any border (if present) */
    }

    .navbar.navbar-inverse.navbar-fixed-top a {
        color: white !important; /* Make link text white */
    }

    .navbar.navbar-inverse.navbar-fixed-top a:hover {
        color: white; /* Optional: hover effect */
    }

    .navbar.navbar-inverse .navbar-brand {
        color: white !important; /* Make the brand text white */
    }
    .navbar.navbar-inverse.navbar-fixed-top .nav > .active > a{
        background-color: rgb(73, 0, 128);
        color: white;
    }
    .theme-showcase{
        background-color: #7B68EE;
        color: white;
        width:90%;
        height:80vh;
    }
    .jumbotron{
        background-color: rgb(73, 0, 128);
        color: white;
        margin-top: 100px;
    }

    </style>


		<!-- Fixed navbar -->
        <body style="background-color: #7B68EE">
            <nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span> <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"><b>SmartTutor</b></a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="index.jsp">Home</a></li>					
                            <li><a href="ProfilePage.jsp">Your Profile</a></li>
                                            
                        </ul>	
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </nav> 
		<div class="container theme-showcase" role="main">

			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron" style=" background-color: rgb(73, 0, 128)">
				<h1>SmartTutor</h1>
			</div>

			<!-- Page Title -->
			<div class="page-header" style="color: white;">
				<h1>Oops something went wrong</h1>
			</div>
            
            <div class="row">

				<div class="col-xs-12" style="color:white;">

					<h2>Description</h2>

					<% if(exception != null) { %>	                  	
						<p><code><%= exception %></code></p>						
					<% } %>		

				</div>

			</div> 
			
		</div>
		<!-- /container -->

        <!-- footer -->
        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">	
        <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script	src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
	</body>
</html>


