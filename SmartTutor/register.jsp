<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <!-- Bootstrap 3 CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #7B68EE;
            font-family: Arial, sans-serif;
        }
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
            background-color: rgb(73, 0, 128); 
            border: none;
        }
        .navbar .navbar-brand {
            color: white; 
        }
        .navbar .navbar-brand:hover {
            color: #d1c7f1; 
        }
        .navbar-nav > li > a {
            color: white; 
        }
        .navbar-nav > li > a:hover {
            background-color: #5a007d; 
            color: white;
        }
        form {
            background-color: #FFFFFF;
            border: 2px solid #000000;
            padding: 20px;
            max-width: 500px;
            margin: 40px auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            font-weight: bold;
            color: #333;
        }
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="range"],
        input[type="date"],
        input[type="password"] {
    width: 60%;
    padding: 8px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-family: Arial, sans-serif; /* Ξ“ΟΞ±ΞΌΞΌΞ±Ο„ΞΏΟƒΞµΞΉΟΞ¬ */
    font-size: 14px; /* ΞΞ­Ξ³ΞµΞΈΞΏΟ‚ Ξ³ΟΞ±ΞΌΞΌΞ±Ο„ΞΏΟƒΞµΞΉΟΞ¬Ο‚ */
}
        input[type="checkbox"],
        input[type="radio"] {
            margin-right: 10px;
        }
        input[type="submit"], 
        input[type="reset"] {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin-right: 10px;
        }
        input[type="submit"] {
            background-color: black;
            color: white;
            border: 2px solid black;
        }
        input[type="reset"] {
            background-color: white;
            color: black;
            border: 2px solid black;
        }
        input[type="submit"]:hover, 
        input[type="reset"]:hover {
            opacity: 0.8;
        }
        #terms-content {
            border: 1px solid #ccc;
            padding: 10px;
            width: 100%;
            height: 150px;
            overflow-y: scroll;
            margin-bottom: 20px;
            background-color: #FFFFFF;
        }
        h2 {
            text-align: center;
            color: black;
        }
        p {
            color: black;
            text-align: center;
            font-weight: bold;
        }
        .price-label {
            margin-left: 10px;
        }
        .range-wrapper {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .range-wrapper label {
            flex: 1;
        }
        .range-wrapper input[type="range"] {
            flex: 3;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="register.jsp">Smart Tutor</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="register.jsp">Register</a></li> 
                <li><a href="login.jsp">Login</a></li> 
            </ul>
        </div>
    </nav>



<!-- Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>

<body>
    <<form action="register_Controller.jsp" method="POST">
        <h2>User Registration</h2>
        <br>
    
        <label for="username">Username: </label><br>
        <input type="text" id="username" name="username" required><br>
    
        <label for="fname">First Name: </label><br>
        <input type="text" id="fname" name="fname" required><br>
    
        <label for="lname">Last Name: </label><br>
        <input type="text" id="lname" name="lname" required><br>
    
        <label for="phone">Phone: </label><br>
        <input type="tel" id="phone" name="phone" placeholder="1234567890" pattern="[0-9]{10}" title="Please enter a 10-digit phone number" required><br>
    
        <label for="email">Email: </label><br>
        <input type="email" id="email" name="email" required><br>
    
        <label for="password">Password: </label><br>
        <input type="password" id="password" name="password" required><br>
    
        <label for="confirm-password">Confirm Password: </label><br>
        <input type="password" id="confirm-password" name="confirm-password" required><br>
    
        <label for="terms-content">Terms of Service: </label><br>
            <div id="terms-content">
                <p>Welcome to our platform! By using our website, you agree to the following terms and conditions. Please read them carefully. The use of our website is governed by our Privacy Policy, which describes how we collect, use, and protect your personal data.
                    To access certain features, you may be required to create an account. You agree to provide accurate and complete information during registration and are responsible for maintaining the confidentiality of your account details. We are not liable for any direct
                    or indirect damages that may result from the use of the website or our services. The use of the platform is at your own risk.</p>
        </div><br>
    
        <label for="terms">I accept the Terms of Service: *</label>
        <input type="checkbox" id="terms" name="terms" value="accepted" required><br><br>
    
        <p>* The field is required</p>
        <input type="submit" value="Submit">
        <input type="reset" value="Clear">
        </form>
        <!-- JavaScript to toggle teacher-specific filters -->
    

    </body>
    </html>
    

    
