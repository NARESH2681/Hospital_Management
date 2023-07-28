<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>
    <link rel="stylesheet" href="regstyle.css">
    <script>
        function validateForm() {
            var username = document.getElementById("username").value.trim();
            var email = document.getElementById("email").value.trim();
            var password = document.getElementById("password").value.trim();
            var cpassword = document.getElementById("cpassword").value.trim();
            var date = document.getElementById("date").value.trim();
            var address = document.getElementById("address").value.trim();
            var country = document.getElementById("country").value;
            var state = document.getElementById("state").value;
            var district = document.getElementById("districts").value;
            var gender = document.querySelector('input[name="gender"]:checked');
            var isValid = true;
            var emailReg = /^\w+([\.-]?\w+)@\w+([\.-]?\w+)(\.\w{2,3})+$/;
            if (username === "") {
                document.getElementById("username-error").innerText = "Enter your name";
                isValid = false;
            } else {
                document.getElementById("username-error").innerText = "";
            }
            if (email === "") {
                document.getElementById("email-error").innerHTML = "Please enter your email address";
                isValid = false;
            } else if (!emailReg.test(email)) {
                document.getElementById("email-error").innerHTML = "Please enter a valid email address";
                isValid = false;
            } else {
                document.getElementById("email-error").innerHTML = "";
            }
            if (password === "") {
                document.getElementById("password-error").innerText = "Enter your password";
                isValid = false;
            } else if (password.length < 8) {
                 document.getElementById("password-error").innerText = "Password must be at least 8 characters long";
                 isValid = false;
            } else if (!/[A-Z]/.test(password)) {
                 document.getElementById("password-error").innerText = "Password must contain at least one uppercase letter";
                 isValid = false;
            } else if (!/[a-z]/.test(password)) {
                 document.getElementById("password-error").innerText = "Password must contain at least one lowercase letter";
                 isValid = false;
            } else if (!/[0-9]/.test(password)) {
                 document.getElementById("password-error").innerText = "Password must contain at least one number";
                 isValid = false;
            } else if (!/[!@#$%^&*]/.test(password)) {
                 document.getElementById("password-error").innerText = "Password must contain at least one special character";
                 isValid = false;
            } else {
                 document.getElementById("password-error").innerText = "";
            }
            if (cpassword === "") {
                document.getElementById("cpassword-error").innerText = "Enter your Confirm password";
                isValid = false;
            } else if (cpassword !== password) {
                document.getElementById("cpassword-error").innerText = "Passwords do not match";
                isValid = false;
            } else {
                document.getElementById("cpassword-error").innerText = "";
            }
            if (date === "") {
                document.getElementById("date-error").innerText = "Enter your Date of Birth";
                isValid = false;
            } else {
                document.getElementById("date-error").innerText = "";
            }
            if (address === "") {
                document.getElementById("address-error").innerText = "Enter your Address";
                isValid = false;
            } else {
                document.getElementById("address-error").innerText = "";
            }
            if (country === "country") {
                document.getElementById("country-error").innerText = "Please select your country";
                isValid = false;
            } else {
                document.getElementById("country-error").innerText = "";
            }
            if (state === "state") {
                document.getElementById("state-error").innerText = "Please select your state";
                isValid = false;
            } else {
                document.getElementById("state-error").innerText = "";
            }
            if (district === "district") {
                document.getElementById("districts-error").innerText = "Please select your district";
                isValid = false;
            } else {
                document.getElementById("districts-error").innerText = "";
            }
            if (gender === null) {
                document.getElementById("gender-error").innerText = "Please select your gender";
                isValid = false;
            } else {
                document.getElementById("gender-error").innerText = "";
            }
            if (isValid) {
                return true;
            } else {
                return false;
            }
        }
    </script>
</head>
<body>
    <div>
        <div class="grandParentContaniner">
            <div class="parentContainer">
                <form id="regform" method="post" onsubmit="return validateForm();">
                    <h2><strong>Register</strong></h2>
                    <div class="input-group">
                        <label for="username">Name:</label><br>
                        <input type="text" id="username" name="username" class="form-control" placeholder="Enter your name">
                        <div class="error" id="username-error"></div>
                    </div>
                    <div class="input-group">
                        <label for="email">Email:</label><br>
                        <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email address">
                        <div class="error" id="email-error"></div>
                    </div>
                    <div class="input-group">
                        <label for="password">Password:</label><br>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password">
                        <div class="error" id="password-error"></div>
                    </div>
                    <div class="input-group">
                        <label for="cpassword">Confirm Password:</label><br>
                        <input type="password" id="cpassword" name="cpassword" class="form-control" placeholder="Enter your confirm password">
                        <div class="error" id="cpassword-error"></div>
                    </div>
                    <div class="input-group">
                        <label for="date">Date Of birth</label>
                        <input type="date" id="date" name="date" class="form-control" placeholder="Enter your date of birth">
                        <div class="error" id="date-error"></div>
                    </div>
                    <div class="input-group">
                        <label for="address">Address:</label><br>
                        <textarea id="address" name="address" rows="4" cols="70" placeholder="Enter your address"></textarea>
                        <div class="error" id="address-error"></div>
                    </div>
                    <div class="input-group">
                        <label for="country">Country</label><br>
                        <select id="country" name="country" class="form-select">
                            <option value="country">Select your country</option>
                            <option value="USA">United States</option>
                            <option value="CAN">Canada</option>
                            <option value="UK">United Kingdom</option>
                            <option value="AUS">Australia</option>
                            <option value="IND">India</option>
                        </select>
                        <div class="error" id="country-error"></div>
                    </div>
                    <div class="input-group">
                        <label for="state">State</label><br>
                        <select id="state" name="state" class="form-select">
                            <option value="state">Select your state</option>
                            <option value="Andra Pradesh">Andra Pradesh</option>
                            <option value="Karnataka">Karnataka</option>
                            <option value="Kerala">Kerala</option>
                            <option value="Tamil Nadu">Tamil Nadu</option>
                            <option value="Telangana">Telangana</option>
                        </select>
                        <div class="error" id="state-error"></div>
                    </div>  
                    <div class="input-group">
                        <label for="districts">Districts</label><br>
                        <select id="districts" name="districts" class="form-select">
                            <option value="district">Select your district</option>
                            <option value="Chennai">Chennai</option>
                            <option value="Coimbatore">Coimbatore</option>
                            <option value="Madurai">Madurai</option>
                            <option value="Salem">Salem</option>
                            <option value="Trichy">Trichy</option>
                        </select>
                        <div class="error" id="districts-error"></div>
                    </div>
                    <div class="input-group">
                        <label for="gender">Gender:</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" id="male" value="male">
                            <label class="form-check-label" for="male">Male</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" id="female" value="female">
                            <label class="form-check-label" for="female">Female</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" id="other" value="other">
                            <label class="form-check-label" for="other">Other</label>
                        </div>
                        <div class="error" id="gender-error"></div>
                    </div>
                    <button type="submit" class="btn btn-primary">Register</button>
                    <div class="registerhere">
                        Already have an account?
                        <a href="Login.jsp" target="_blank">Login</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
<%
    String url = "jdbc:mysql://localhost:3306/naresh";
    String dbusername = "root";
    String dbpassword = "Nh2026";
    Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbusername, dbpassword);
    } catch (Exception e) {
        e.printStackTrace();
    }
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String date = request.getParameter("date");
    String address = request.getParameter("address");
    String country = request.getParameter("country");
    String state = request.getParameter("state");
    String district = request.getParameter("districts");
    String gender = request.getParameter("gender");
    try {
        Statement stmt = conn.createStatement();
        String query = "INSERT INTO register (name, email, password, date, address, country, state, district, gender) " +
                       "VALUES ('" + username + "', '" + email + "', '" + password + "', '" + date + "', '" + address + "', '" + country + "', '" + state + "', '" + district + "', '" + gender + "')";
        stmt.executeUpdate(query);
        response.sendRedirect("Login.jsp");
        stmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</body>
</html>