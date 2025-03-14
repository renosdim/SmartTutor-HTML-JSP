<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="ErrorPage.jsp"%>
<%@ page import="teamproject_2024_2025_ismgroup17.*, java.util.ArrayList, java.util.List" %>

<% List<Tutor> resultlist = (List<Tutor>) request.getAttribute("ReccomendedTutors");%>

<html>
    <head>
        <title> Results </title>
        <meta name ="viewport" content="width=device-width,initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

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
    .card {
        background-color:white;
        border-radius: 10px;
        padding: 15px;
        margin: 15px auto;
        width: 20%;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border: 3px solid black;
        margin-top: 70px;
        display: flex; /* Enable Flexbox */
        flex-direction: column; /* Stack items vertically */
        justify-content: center; /* Center vertically */
        align-items: center; /* Center horizontally */
        text-align: center; /* Center text inside elements */
       

    }
    .card-title {
        font-size: 18px;
        font-weight: bold;
        font-family: Arial, Helvetica, sans-serif;
    }
    .card-text {
        font-size: 14px;
        font-family: Arial, Helvetica, sans-serif;
        margin-top: 20px;
    }
    .btn-vertical {
        display: block;
        width: 100%;
        margin-bottom: 8px; /* Adjust spacing as needed */
        font-family: Arial, Helvetica, sans-serif;
    }
    .button {
        width: auto; 
        padding: 10px ; 
        background-color: #FFFFFF;
        color: black;
        border: 2px solid black;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 20px;
    }
    </style>
    <%if (resultlist == null) { 
        out.println("<h3>Result list is null</h3>"); 
    } else if (resultlist.isEmpty()) { 
        out.println("<h3>list is empty</h3> "); 
    } else {
        out.println("Result list contains " + resultlist.size() + " items.");
    }%>
    
    <body style="background-color: #7B68EE">
        <%@ include file="navbar.jsp" %>
        <% for (Tutor t1: resultlist){ %>
            <div class="card">
            <div class="card-body">  
                <h3 class="card-title"><%= t1.getFirstName() + " " + t1.getLastName() %></h3>
                <img src="<%=request.getContextPath() %>/images/member1.png" class="card-img-top" alt="..." >
                <p class="card-text"><%= t1.getBiography()%></p>
                <a href="timetable_st.jsp?uname=<%=t1.getUsername()%>" class="button">Book Lesson </a>
                
            </div>    
            </div>
        <% } %>
        
        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">	
        <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script	src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    </body>
</html>