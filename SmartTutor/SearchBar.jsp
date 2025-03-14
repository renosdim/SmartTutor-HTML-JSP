<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_ex2_8220081.jsp"%>
<html>
    <head>
        <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	    
	   

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
       
        .form-horizontal {
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
            border-radius: 5px;
            background-color: #FFFFFF;
            border: 2px solid black;
            width: 40%;
            border-radius: 10px;
        }
        .label {
            display: block; /* Making labels block elements */
            margin-bottom: 5px;
        }
        select, input, button {
            width: 100%; /* Make inputs fill the form width */
            padding: 10px;
            margin-bottom: 15px; /* Space between inputs */
            border-radius: 5px;
        }
        #priceValue {
            text-align: center; 
            margin-bottom: 10px;
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
        body {
            background-color: #7B68EE;
            display: flex; /* Enables Flexbox */
            justify-content: center; /* Centers horizontally */
            align-items: center; /* Centers vertically */
            min-height: 100vh; /* Makes the body take up the full height of the viewport */
            margin: 0; /* Removes default margin */
        }
        </style>
    <body style="background-color: #7B68EE">
        <%@ include file="navbar.jsp" %>
        <form action="SearchController.jsp" method="POST" class="form-horizontal">
            <h2 style="color: black; text-align: center;font-family: Arial; font-size: 20px;"><b>Select your Preferences</b></h2>

            <div class="form-group">
            <select class="form-select" aria-label="subject" name="subject" required>
                <option value="" disabled selected>Choose a subject</option>
                <option >Physics</option>
                <option >Chemistry</option>
                <option >Mathematics</option>
                <option >Essay Writing</option>
                <option >History</option>
                <option >Latin</option>
                <option >Ancient Greek</option>
            </select>
            </div>

            <div class="form-group">
            <select class="form-select"  aria-label="level" name="educationlevel" required>
                <option value= "" disabled selected>Choose the level of your education </option>
                <option > Elementary School</option>
                <option> Middle School</option>
                <option> High School</option>
                <option> University</option>
                <option> University Graduate </option>
                <option> Amateur</option>
            </select>
            </div>

            

            <div class="form-group">
            <select class="form-select" aria-label="Gender" name="gender" required>
                <option  value= "" disabled selected>Choose the gender of your professor</option> 
                <option> Male</option>
                <option> Female</option>
                <option> Any</option>
            </select>
            </div>

            <div class="form-group">
            <select class="form-select" aria-label="Language" name=language required>
                <option  value= "" disabled selected>Choose the teaching language</option> 
                <option> Greek</option>
                <option> English</option>
                <option> Any</option>
            </select>
            </div>

            <label for="pricerange" class="form-label">Average price per Hour</label>
            <input type="range" class="form-range" id="pricerange" name="maxprice" min="0" max="100"  step="1" value="55" oninput="updatePrice()" required >
            <p id="priceValue"> Average $55 per hour</p>
            <button type="submit">Search for tutors</button>
            <button type = "reset" >Clear</button>
            
        </form>

         
        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
       	
        <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
         <!--Bootstrap core JavaScript -->
        <script	src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
        
        <script>
            // JavaScript to update the displayed price 
            function updatePrice() {
                var price = document.getElementById('pricerange').value;
                document.getElementById('priceValue').textContent = ` Average ` + price + `$ per hour`;
            }
        </script>

    </body>
</html>