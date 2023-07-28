<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>
    <title> hospital Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src="js/login.js" defer></script>
    <style>
        html,body{
            background: rgb(177,173,226);
            background: linear-gradient(90deg, rgba(177,173,226,1) 0%, rgba(125,223,248,1) 100%);
            background-attachment: fixed;
            height: 100%;
        }
        *{
          font-family: 'Poppins', sans-serif;
        }
        .grandParentContaniner{
          display:table; 
          height:10; 
          margin: 0 auto;
          margin-bottom: 500;
        }
        .parentContainer{
          display:table-cell; 
          vertical-align:middle;
        }
        .container{
          padding: 20px;
          border: 1px solid #ccc;
          box-shadow: 0 5px 10px rgba(0,0,0,0.3);
          border-radius: 20px;
          background-color: white;
        }
        h2{
            margin-left: 60px;
            margin-right: 60px;
            color: rgb(0, 162, 255);
            font-size: 2rem;
            font-weight: 500;
            text-align: center;
        }
        .input-group,input[type="password"]{
            margin-bottom: 10px;
        }
        button {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            color: #fff;
            border: none;
            background-color: aqua;
            margin-top: 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        input#email,input#password{
            width: 100%; 
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input#email:hover,input#password:hover{
            border: 1px solid aqua;
            box-shadow:  black;
            border-radius: 5px;
        }
        button:hover{
            background: rgb(0, 162, 255);
        }
        .registerhere{
            margin-top: 20px;
            font-size: 18px;
            text-align: center;
        }
        .registerhere a[href="Login.html"]:hover{
            background-color: aqua;
        }
        .registerhere a[href="Login.html"]:focus{
            background-color: yellow;
        }
        .registerhere a[href="Register.html"]:hover{
            background-color: aqua;
        }
        .registerhere a[href="Register.html"]:focus{
            background-color: yellow;
        }
        .registerhere a{
            color: #049ca7;
            cursor: pointer;
        }
        .registerhere a:hover{
            text-decoration: underline;
            color: rgb(0, 162, 255);
        }
        .error,.errorradio{
            color: red;
            font-size: 15px;
            margin-top: 5px;
        }
    </style>
    <script>
    function validateForm() {
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;
        var isValid = true;
        var emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if (email === "") {
            document.getElementById("email-error").innerHTML = "Please enter your email address";
            isValid = false;
        } else if (!emailRegex.test(email)) {
            document.getElementById("email-error").innerHTML = "Please enter a valid email address";
            isValid = false;
        } else {
            document.getElementById("email-error").innerHTML = "";
        }
            if (password === "") {
                document.getElementById("password-error").innerHTML = "Please enter your password";
                isValid = false;
            } else {
                document.getElementById("password-error").innerHTML = "";
            }
            return isValid;
        }
        function isValidEmail(email) {
            const emailcheck = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailcheck.test(email);
          }
    </script>
</head>

<body>
    <div class="grandParentContaniner">
        <div class="parentContainer">
            <div class="container">
                <form id="loginform" onsubmit="return validateForm();">
                    <h2><strong> hospital Login</strong></h2>
                    <div class="input-group mb-3">
                        <label for="email">Email:</label><br>
                        <input type="email" id="email" name="email" class="form-control"
                            placeholder="Enter your email address">
                        <div class="error" id="email-error"></div>
                    </div>
                    <div class="input-group mb-3">
                        <label for="password">Password:</label><br>
                        <input type="password" id="password" name="password" class="form-control"
                            placeholder="Enter your password">
                        <div class="error" id="password-error"></div>
                    </div>
                    <input type="checkbox" id="rememberMe" name="rememberMe">
                    <label for="rememberMe">Remember me</label>
                    <button type="submit" class="btn btn-primary">Login</button>
                    <div class=registerhere>Don't have an account?<a href="patient_reg.jsp" target="_blank">Register here</a></div>
                </form>
            </div>
        </div>
    </div>

    <%
        String email = request.getParameter("email");
        String password = request.getParameter("password");
                    		String url = "jdbc:mysql://localhost:3306/naresh";
                    	    String dbusername = "root";
                    	    String dbpassword = "Nh2026";



        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection(url, dbusername, dbpassword);
            String sql = "SELECT * FROM regdoctors WHERE email = ? AND PWD = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                response.sendRedirect("Doctorview.html");
            }

            rs.close();
            statement.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</body>

</html>