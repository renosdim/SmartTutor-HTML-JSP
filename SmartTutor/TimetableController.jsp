<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="teamproject_2024_2025_ismgroup17.*"%>
<%@ page errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointment proccesing</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<style>
    .alert{
    position: absolute; /* Position relative to the nearest positioned ancestor */
    top: 50%; /* Position 50% from the top */
    left: 50%; /* Position 50% from the left */
    transform: translate(-50%, -50%); /* Shift it back by 50% of its width and height */
    max-width: 1000px;
    width: 100%; /* Optional: ensure it doesn't exceed the parent width */
    padding: 20px;
    border-radius: 5px;
    background-color: gainsboro;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
    }

</style>
    <body style="background-color: #7B68EE">
        <%@ include file="navbar.jsp" %>
<%
User user1 = (User) session.getAttribute("userObj2024");
    if (user1 == null) {
		request.setAttribute("message", "You are not authorized to access this resource. Please login.");%>
		<jsp:forward page="login.jsp"/> <%
		return;
    }
    String studentId = user1.getUsername();
    String teacherId = request.getParameter("teacherId");
    String date = request.getParameter("date");
    String time = request.getParameter("time");

    try{
        Lesson lesson = new Lesson(studentId,teacherId,date,time);
        LessonDAO lessondao = new LessonDAO();
        lessondao.BookLesson(lesson);
        %>
        <div class="alert">
            Lesson was booked succesfully!
            <div>
            <a href="timetable_st.jsp?uname=<%=teacherId%>" style="color: #7b68ee;"><b>return</b></a>
            </div>
        </div>
        
         <%

        
    }catch(Exception e){
        %>
        <div class="alert">
           <b><%=e.getMessage()%></b>
           <div>
           <a href="timetable_st.jsp?uname=<%=teacherId%>" style="color: #7b68ee;"><b>return</b></a>
           </div>
        </div>
        
<%
    } 
    %>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">	
    <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script	src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>
</html>    
