<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="ErrorPage.jsp"%>
<%@ page import="teamproject_2024_2025_ismgroup17.User, teamproject_2024_2025_ismgroup17.LessonDAO, teamproject_2024_2025_ismgroup17.TutorDAO, java.util.List, java.time.LocalDate, java.time.format.DateTimeFormatter;" %>
<%
    User user1 = (User) session.getAttribute("userObj2024");

    if (user1 == null) {
		request.setAttribute("message", "You are not authorized to access this resource. Please login.");%>
		<jsp:forward page="login.jsp"/> <%
		return;
    }

    String stuser= user1.getUsername();
    LessonDAO ldao= new LessonDAO();
    List<Lesson> scheduledlessons = ldao.findLessons(stuser);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile with Appointment List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <body>
    <style>
        /* General reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            background-color:rgb(73, 0, 128);
            color:white ; 
        }
        
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            background: linear-gradient(135deg, #7b68ee, #7b68ee);
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start; /* Allows for vertical scrolling */
            padding: 20px;
            min-height: 100vh; /* Ensures page height for scrolling */
        }

        /* Profile Card */
        .profile-card {
        
            background: #f3e5f5;
            color: #7b68ee;
            border-radius: 15px;
            padding: 20px;
            max-width: 600px;
            width: 90%;
            text-align: center;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            margin: 0 auto 20px auto;
            margin-top: 100px;
        }

        .profile-card img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            margin-bottom: 20px;
            border: 4px solid #7b68ee;
        }

        .profile-card h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .profile-card p {
            font-size: 16px;
            color: #7b68ee;
            margin-bottom: 20px;
        }

        /* Appointment Cards Container */
        .appointment-list {
            display: flex;
            flex-direction: column;
            align-items: center; /* Centers all cards horizontally */
            gap: 20px; /* Spacing between cards */
            width: 100%;
            max-width: 600px;
        }

        /* Individual Appointment Card */
        .appointment-card {
            display: flex;
            align-items: center;
            background: #fff;
            border-radius: 10px;
            padding: 10px;
            width: 100%; /* Full width of the container */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .appointment-card img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .appointment-details {
            flex: 1;
        }

        .appointment-details h2 {
            font-size: 18px;
            color: #7b68ee;
            margin: 0;
        }

        .appointment-details p {
            font-size: 14px;
            color: #7b68ee;
            margin: 2px 0;
        }
        .appointment-link {
            position: absolute;
            bottom: 10px;
            right: 10px;
            text-decoration: none;
            color: #7b68ee;
            font-weight: bold;
            font-size: 0.9rem;
            margin-top: 10px; /* Space between the link and the content above */
            align-self: flex-end; 
            font-family: Arial, Helvetica, sans-serif;
            font-size: 15px;
}
    </style>
</head>
<%@ include file="navbar.jsp" %>
<body>
    
    <%@ include file="navbar.jsp" %>
    <!-- Profile Card -->
    <div class="profile-card">
        <img src="https://via.placeholder.com/120" alt="Profile Picture">
        <h1><%= user1.getFname() +" " + user1.getLname()%></h1>
        <p>Student</p>
    </div>

    <!-- Appointment List -->
   
        <!-- Appointment cards will be dynamically added here -->
   
    <div class="appointment-list" id="appointmentList">
        <%if(scheduledlessons.isEmpty()){
            %> <h2 style="color: #fff;"><b>There are no sceduled lessons yet</b></h2>
        <%
        } else {
            for(Lesson l1: scheduledlessons){
                TutorDAO tfind = new TutorDAO();
                Tutor bookedtutor= tfind.FindTutor(l1.getTutorId());
                String date= l1.getDate();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate lessonDate = LocalDate.parse(date, formatter);
                LocalDate currentDate = LocalDate.now();
                 %>
        <div class="appointment-card" >
            <img src="https://via.placeholder.com/50" class="appointment-card img ">
        
            <div class="appointment-details">
                <p>Date:<%= l1.getDate()%> </p>
                <p>Time:<%= l1.getTime()%> </p>
                <p>Subject:<%= bookedtutor.getSubject()%> </p>
                <p>Professor: <%=bookedtutor.getFirstName()+" " + bookedtutor.getLastName()%></p>
            </div>
            <% 
            RatingDAO ratingdao= new RatingDAO();
            boolean showrating= ratingdao.FindRating(user1.getUsername(),l1.getTutorId());
            if (showrating ){
                %>
                <div class="appointment-link">
                    <a style="color: #7b68ee;">You have already rated this tutor</a>
                </div>
                <%
            }else{
            if(lessonDate.isBefore(currentDate) || lessonDate.isEqual(currentDate)){%>
            <div class="appointment-link">
                <a href="RatingPage.jsp?tname=<%=l1.getTutorId()%>" style="color: #7b68ee;">Rate this Tutor</a>
            </div>
            <%} } %>
        </div> <%
            }
        }%>
        
    </div>
   
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">	
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script	src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>

</body>
</html>
