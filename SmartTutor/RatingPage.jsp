<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="ErrorPage.jsp"%>
<%@ page import="teamproject_2024_2025_ismgroup17.*"%>
<%User user1 = (User) session.getAttribute("userObj2024");

if (user1 == null) {
    request.setAttribute("message", "You are not authorized to access this resource. Please login.");%>
    <jsp:forward page="login.jsp"/> <%
    return;
}
Tutor torate= null;
String tname= request.getParameter("tname");
try{
    TutorDAO extutordao = new TutorDAO();
    torate = extutordao.FindTutor(tname);
    }catch(Exception e){
        e.getMessage();
    }
    if(torate == null){
        %><h3> Tutor null</h3><%
    }%>
<html>
    <head>
        <title> Rating </title>
        <meta name ="viewport" content="width=device-width,initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
            .card {
                width: 100%;
                max-width: 400px; /* Optional, to limit card width */
                background-color: #f9f9f9;
                padding: 15px;
                border-radius: 10px;
                margin-bottom: 20px; /* Space below the card */
                border: 1px solid #ddd;
                align-items: center;
                
            }

            form {
                background-color: #FFFFFF;
                padding: 20px;
                border-radius: 10px;
                max-width: 1000px; /* Limiting form width */
                width: 50%;
                margin: 0 auto; /* Centering form horizontally */
                border: 2px solid black;
                font-family: Arial, Helvetica, sans-serif;
                
            }
            .star-rating {
                direction: rtl;
                font-size: 5rem;
                display: inline-flex;
                
            }
          
            .star-rating input {
                display: none;
            }
          
            .star-rating label {
                color: #ccc;
                cursor: pointer;
                transition: color 0.2s;
            }
          
            .star-rating input:checked ~ label,
            .star-rating label:hover,
            .star-rating label:hover ~ label {
                color: gold;
            }
            button {
                width: auto; 
                padding: 10px 20px; 
         	    background-color: #FFFFFF;
                color: black;
                border: 2px solid black;
                border-radius: 5px;
                cursor: pointer;
                
            }
            textarea{
                width: 100%; /* Make inputs fill the form width */
                padding: 10px;
                margin-bottom: 15px; /* Space between inputs */
                border-radius: 5px;
            }
            body {
            background-color: #7B68EE;
            display: flex; /* Enables Flexbox */
            justify-content: center; /* Centers horizontally */
            align-items: center; /* Centers vertically */
            min-height: 100vh; /* Makes the body take up the full height of the viewport */
            margin: 0; /* Removes default margin */
            }
            .form-control{
                margin-bottom: 20px; 
                padding: 10px;
            }
        </style>
    <body style="background-color: #7B68EE">
        <%@ include file="navbar.jsp" %>
        <form action="rating_Controller.jsp" method="GET" class="form-label"> 
            <h2 style="color: black; text-align: center;font-family: Arial; font-size: 20px;"><b>Rate Your Experience With This Professor</b></h2>
            <div class="card">     
                <div class="card-body">
                    <h3 class="card-title"> <%=torate.getFirstName() +" " + torate.getLastName()%> </h3>
                    <img src="%=request.getContextPath() %>/images/member1.png" class="card-img-top" alt="...">
                    <p class="card-text"><%=torate.getBiography()%></p>
                </div>     
            </div>
            <input type="hidden" name="tusername" value="<%=tname%>">
            <input type="hidden" name="susername" value="<%=user1.getUsername()%>">
            

            <div class="star-rating">
                <input type="radio" name="rating" id="star5" value="5"><label for="star5">&#9733;</label>
                <input type="radio" name="rating" id="star4" value="4"><label for="star4">&#9733;</label>
                <input type="radio" name="rating" id="star3" value="3"><label for="star3">&#9733;</label>
                <input type="radio" name="rating" id="star2" value="2"><label for="star2">&#9733;</label>
                <input type="radio" name="rating" id="star1" value="1"><label for="star1">&#9733;</label>
            </div>

            <textarea class="form-control" id="Comment Section" name="comments" rows="10" placeholder="Leave a comment here"></textarea>
            <button type="submit">Submit</button>
            <button type="reset">Clear</button>
        </form> 
        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">	
        <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script	src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    </body>
</html>