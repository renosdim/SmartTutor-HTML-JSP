<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="ErrorPage.jsp"%>
<%@ page import="teamproject_2024_2025_ismgroup17.*"%>
<% String tutoruname= request.getParameter("uname");%>

<%
    User user1 = (User) session.getAttribute("userObj2024");

    if (user1 == null) {
		request.setAttribute("message", "You are not authorized to access this resource. Please login.");%>
		<jsp:forward page="login.jsp"/> <%
		return;
    }
%>
<%
Tutor ntutor= null;
try{
TutorDAO extutor = new TutorDAO();
ntutor = extutor.FindTutor(tutoruname);
}catch(Exception e){
    e.getMessage();
}
if(ntutor == null){
    %><h3> Tutor null</h3><%
}%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <title>Lesson Appointment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #7B68EE;
        }
        .calendar-container {
            max-width: 800px;
            width: 80%;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-top: 100px;
           
        }
        .profile {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .profile img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }
        .profile-details {
            display: flex;
            flex-direction: column;
        }
        .profile-details span {
            margin: 2px 0;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .header button {
            padding: 5px;
            background-color: transparent;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: #007bff;
        }
        .calendar {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 5px;
            text-align: center;
        }
        .day {
            padding: 20px;
            border-radius: 4px;
            background: #e9ecef;
            cursor: pointer;
        }
        .day:hover {
            background: #d1e7dd;
        }
        .past {
            color: #bbb;
            background: #f8f9fa;
            cursor: not-allowed;
        }
        .selected {
            background: #007bff;
            color: white;
        }
        .time-picker {
            display: none;
            margin-top: 20px;
            max-height: 200px;
            overflow-y: auto;
            border: 1px solid #ccc;
            border-radius: 4px;
            background: white;
            padding: 10px;
        }
        .time-item {
            padding: 10px;
            cursor: pointer;
            border-radius: 4px;
            margin: 5px 0;
            background: #e9ecef;
            text-align: center;
        }
        .time-item:hover {
            background: #d1e7dd;
        }
        .time-item.past {
            color: #bbb;
            background: #f8f9fa;
            cursor: not-allowed;
        }
        .time-item.selected {
            background: #007bff;
            color: white;
        }
        .submit-btn {
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }
        .submit-btn:hover {
            background-color: #0056b3;
        }
        .result {
            margin-top: 20px;
            padding: 10px;
            background-color: #e9ecef;
            border-radius: 4px;
            display: none;
        }
    </style>
</head>
<%@ include file="navbar.jsp" %>
<div class="calendar-container">
    
    <!-- Profile Section -->
    <div class="profile">
        <img src="profile-image-url.jpg" alt="Profile Image" id="profileImage">
        <div class="profile-details">
            <span id="profileName">Name: <%=ntutor.getFirstName() +" " + ntutor.getLastName()%></span>
            <span id="profileLevel">Teaching Level: <%= ntutor.getCourseLevel()%></span>
            <span id="profileGender">Gender: <%=ntutor.getGender()%></span>
            <span id="profileAge">Born in: <%=ntutor.getDateOfBirth()%></span>
            <span id="profileHourlyRate">Hourly Rate: <%= ntutor.getMinPrice() + "$ - " + ntutor.getMaxPrice() +"$"%></span>
        </div>
        <input type="hidden" id="studentId" value="8220149"> 
        <input type="hidden" id="teacherId" value="101"> 
    </div>
    <h1>Lesson Appointment</h1>
    <div class="header">
        <button id="prevMonth">&larr;</button>
        <h2 id="monthYear"></h2>
        <button id="nextMonth">&rarr;</button>
    </div>
    <div class="calendar" id="calendar"></div>
    <div class="time-picker" id="timePicker"></div>

    <!-- Form for appointment submission -->
    <form id="appointmentForm" method="POST" action="TimetableController.jsp">
        <input type="hidden" id="hiddenStudentId" name="studentId">
        <input type="hidden" id="hiddenTeacherId" value="<%= tutoruname%>" name="teacherId">
        <input type="hidden" id="hiddenDate" name="date">
        <input type="hidden" id="hiddenTime" name="time">
        <button type="submit" class="submit-btn" id="submitTime" style="display:none;">Reserve Appointment</button>
    </form>

    <!-- Result message section -->
    <div class="result" id="result"></div>
</div>

<script>
    const calendarElement = document.getElementById('calendar');
    const monthYearElement = document.getElementById('monthYear');
    const prevMonthButton = document.getElementById('prevMonth');
    const nextMonthButton = document.getElementById('nextMonth');
    const timePickerElement = document.getElementById('timePicker');
    const submitTimeButton = document.getElementById('submitTime');
    const resultDiv = document.getElementById('result');

    let currentDate = new Date();
    let selectedDate = null;
    let selectedTime = null;

    function renderCalendar() {
        calendarElement.innerHTML = '';
        const year = currentDate.getFullYear();
        const month = currentDate.getMonth();

        // Set the month and year in English
        monthYearElement.textContent = currentDate.toLocaleString('en-US', { month: 'long', year: 'numeric' });
        const firstDay = new Date(year, month, 1).getDay();
        const lastDate = new Date(year, month + 1, 0).getDate();

        for (let i = 0; i < firstDay; i++) {
            const emptyDiv = document.createElement('div');
            calendarElement.appendChild(emptyDiv);
        }

        const today = new Date();
        for (let date = 1; date <= lastDate; date++) {
            const dayDiv = document.createElement('div');
            dayDiv.textContent = date;
            dayDiv.classList.add('day');
            const dayDate = new Date(year, month, date);
            if (dayDate < today) {
                dayDiv.classList.add('past');
                dayDiv.style.pointerEvents = 'none';
            } else {
                dayDiv.addEventListener('click', () => {
                    document.querySelectorAll('.day').forEach(d => d.classList.remove('selected'));
                    dayDiv.classList.add('selected');
                    selectedDate = dayDate;
                    showTimePicker();
                });
            }
            calendarElement.appendChild(dayDiv);
        }
    }

    function showTimePicker() {
        timePickerElement.innerHTML = '';
        const today = new Date();
        const options = { timeZone: 'Europe/Athens', hour: '2-digit', minute: '2-digit', hour12: true }; // AM/PM format

        for (let hour = 0; hour < 24; hour++) {
            const timeDate = new Date(selectedDate);
            timeDate.setHours(hour, 0, 0, 0);
            const timeItem = document.createElement('div');
            timeItem.textContent = timeDate.toLocaleTimeString('en-US', options); // Display in AM/PM

            timeItem.classList.add('time-item');

            if (selectedDate.toDateString() === today.toDateString() && timeDate < today) {
                timeItem.classList.add('past');
                timeItem.style.pointerEvents = 'none';
            }

            timeItem.addEventListener('click', () => {
                if (!timeItem.classList.contains('past')) {
                    document.querySelectorAll('.time-item').forEach(t => t.classList.remove('selected'));
                    timeItem.classList.add('selected');
                    selectedTime = timeItem.textContent;
                    submitTimeButton.style.display = 'block';
                }
            });
            timePickerElement.appendChild(timeItem);
        }

        timePickerElement.style.display = 'block';
    }

    submitTimeButton.addEventListener('click', async () => {
        const studentId = document.getElementById('studentId').value;
        const teacherId = document.getElementById('teacherId').value;
        const lessonDate = selectedDate.toISOString().split('T')[0];
        const lessonTime = selectedTime;

        document.getElementById('hiddenDate').value = lessonDate;
        document.getElementById('hiddenTime').value = lessonTime;
        document.getElementById('appointmentForm').submit();
        try {
            const response = await fetch('', {
                method: 'POST',
                body: new URLSearchParams({
                    studentId,
                    teacherId,
                    date: lessonDate,
                    time: lessonTime
                })
            });
            const result = await response.text();
            resultDiv.textContent = result;
            resultDiv.style.display = 'block';
        } catch (error) {
            console.error('Error scheduling lesson:', error);
        }
    });

    prevMonthButton.addEventListener('click', () => {
        currentDate.setMonth(currentDate.getMonth() - 1);
        renderCalendar();
    });

    nextMonthButton.addEventListener('click', () => {
        currentDate.setMonth(currentDate.getMonth() + 1);
        renderCalendar();
    });

    renderCalendar();

    // JSP logic to handle form submission and database interaction
    

</script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
       	
<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
         <!--Bootstrap core JavaScript -->
<script	src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>

</body>
</html>
