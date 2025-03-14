<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="ErrorPage.jsp"%>
<%@ page import="teamproject_2024_2025_ismgroup17.*, java.util.ArrayList, java.util.List" %>

<% 
String subject = request.getParameter("subject");
String educationlevel = request.getParameter("educationlevel");
String gender = request.getParameter("gender");
String language = request.getParameter("language");
String max_price = request.getParameter("maxprice");
int maxprice = Integer.parseInt(max_price);
%> <p><%= subject%></p>
<p><%= educationlevel%></p>
<p><%= gender%></p>
<p><%= language%></p>
<p><%= maxprice%></p>
<%
try{
    TutorDAO tutordao_search_obj = new TutorDAO();
    List<Tutor> reccomended_tutors = tutordao_search_obj.FilterTutors(subject,educationlevel,gender,language,maxprice);
        
    if (reccomended_tutors.isEmpty()){
        %> <jsp:forward page="NoResultPage.jsp"/> <%
    } else {
        request.setAttribute("ReccomendedTutors", reccomended_tutors);
        %> <jsp:forward page="ResultPage.jsp"/> <%    
    }    
} catch(Exception e){
    %>
        <div class="alert alert-danger text-center" role="alert">
            <%=  e.getMessage()%>
        </div>
<%
}
%>
