<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
</style>
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
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="SearchBar.jsp"><span class=" glyphicon glyphicon-search"></span> Search</a>
                        </li>
                        <li>
                            <a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a>
                        </li>								        	
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
        </nav> 