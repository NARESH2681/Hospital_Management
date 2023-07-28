<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospitals | Register</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: rgb(6, 161, 227);
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            margin-top: 50px;
        }

        h2 {
            text-align: center;
            margin-bottom: 15px;
        }

        form {
            margin-top: 20px;
        }

        input[type="text"],
        input[type="number"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .error-message {
            color: red;
            font-size: 14px;
        }

        button {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>Hospital Register</h2>
        <form id="registrationForm" method="post">
            <input type="text" id="name" placeholder="Hospital Name" name="rname">
            <span class="error-message" id="nameError"></span>
            <br>
            <input type="number" id="mobile" placeholder="Contact Number" name="contact">
            <span class="error-message" id="mobileError"></span>
            <br>
            <input type="email" id="email" placeholder="Hospital Email" name="remail">
            <span class="error-message" id="emailError"></span>
            <br>
            <input type="text" id="address" placeholder="Hospital Address" name="raddress">
            <span class="error-message" id="addressError"></span>
            <br>
            <input type="password" id="password" placeholder="Password" name="rpasswd">
            <span class="error-message" id="passwordError"></span>
            <br>
            <input type="password" id="confirmPassword" placeholder="Confirm Password">
            <span class="error-message" id="confirmPasswordError"></span>
            <br>
            <button class="btn btn-primary">Register</button>
        </form>
    </div>
    <script>
        document.getElementById("registrationForm").addEventListener("submit", function (event) {
            var nameInput = document.getElementById("name");
            var mobileInput = document.getElementById("mobile");
            var emailInput = document.getElementById("email");
            var addressInput = document.getElementById("address");
            var passwordInput = document.getElementById("password");
            var confirmPasswordInput = document.getElementById("confirmPassword");

            var nameError = document.getElementById("nameError");
            var mobileError = document.getElementById("mobileError");
            var emailError = document.getElementById("emailError");
            var addressError = document.getElementById("addressError");
            var passwordError = document.getElementById("passwordError");
            var confirmPasswordError = document.getElementById("confirmPasswordError");

            var isValid = true;

            // Reset error messages
            nameError.innerText = "";
            mobileError.innerText = "";
            emailError.innerText = "";
            addressError.innerText = "";
            passwordError.innerText = "";
            confirmPasswordError.innerText = "";

            if (nameInput.value.trim() === "") {
                nameError.innerText = "Please enter the hospital name.";
                isValid = false;
            }

            if (mobileInput.value.trim() === "") {
                mobileError.innerText = "Please enter the contact number.";
                isValid = false;
            }

            if (emailInput.value.trim() === "") {
                emailError.innerText = "Please enter the email.";
                isValid = false;
            }

            if (addressInput.value.trim() === "") {
                addressError.innerText = "Please enter the hospital address.";
                isValid = false;
            }

            if (passwordInput.value.trim() === "") {
                passwordError.innerText = "Please enter a password.";
                isValid = false;
            }

            if (confirmPasswordInput.value.trim() === "") {
                confirmPasswordError.innerText = "Please confirm the password.";
                isValid = false;
            } else if (passwordInput.value !== confirmPasswordInput.value) {
                confirmPasswordError.innerText = "Passwords do not match.";
                isValid = false;
            }

            if (!isValid) {
                event.preventDefault(); // Prevent form submission if there are errors
            }
        });
    </script>

    <% 
    if (request.getMethod().equals("POST")) {
        String name = request.getParameter("rname");
        String mobile_no = request.getParameter("contact");
        String email = request.getParameter("remail");
        String pwd = request.getParameter("rpasswd");
        String address = request.getParameter("raddress");

        String url = "jdbc:mysql://localhost:3306/naresh";
        String dbusername = "root";
        String dbpassword = "Nh2026";


        try {
        	 Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, dbusername, dbpassword);
            String sql = "INSERT INTO users (name, mobile_no, email, pwd, address) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, mobile_no);
            statement.setString(3, email);
            statement.setString(4, pwd);
            statement.setString(5, address);

            statement.executeUpdate();
            response.sendRedirect("hospital_login.html");
            statement.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

</body>

</html>
