<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
    <head>
    <title> No Results </title>

    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="sofos@aueb.gr">
	<link rel="icon" href="images/favicon.ico">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">



	<![endif]-->

    </head>
    <style>
    
        .center-message {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh; /* Full viewport height */
    text-align: center;
    
}

/* Large, bold text for the main message */
.center-message h1 {
    font-size: 4em; /* Adjust size as needed */
    font-weight: bold;
    margin: 0;
    color: white; /* Customize color if desired */
}

/* Smaller text for the additional message */
.center-message p {
    font-size: 2em; /* Adjust size as needed */
    color: white; /* Customize color if desired */
    margin-top: 10px;
}
    </style>
    <%@ include file="navbar.jsp" %>
   
    <body style="background-color: #7B68EE">
        <div class="center-message">
            <h1>We are sorry...</h1>
            <p>At the moment there are no tutors that match your specific preferences .</p>
            <a href="SearchBar.jsp" style="color: white; font-size: 2em;">Go back to the SearchBar</a>
        </div>
        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">	
        <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script	src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    </body>
</html>