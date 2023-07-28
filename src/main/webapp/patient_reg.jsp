<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <title>Patient Register</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <style>
    body {
      background-color: #4070f4;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      font-size: 13px;
    }

    .container {
      background-color: #ffffff;
      padding: 20px;
      border-radius: 5px;
      margin-top: 10%;
      max-width: 400px;
      width: 100%;
    }

    .container h2 {
      text-align: center;
      margin-bottom: 15px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .error-message {
      color: red;
      margin-top: 5px;
    }

    .agree-label {
      display: inline-block;
      margin-top: 10px;
    }

    .btn-primary {
      width: 100%;
    }

    .login-link {
      text-align: center;
      font-size: 13px;
      margin-top: 15px;
      margin-bottom: 5px;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2> Patient Register</h2>
    <form id="registrationForm" method="post">
      <div class="form-group">
        <input type="text" class="form-control" id="name" placeholder="Patient Name" name="rname">
        <span class="error-message" id="nameError"></span>
      </div>
      <div class="form-group">
        <input type="email" class="form-control" id="email" placeholder="Patient Email" name="remail">
        <span class="error-message" id="emailError"></span>
      </div>
      <div class="form-group">
        <input type="password" class="form-control" id="password" placeholder="Password" name="rpasswd">
        <span class="error-message" id="passwordError"></span>
      </div>
      <div class="form-group">
        <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm Password">
        <span class="error-message" id="confirmPasswordError"></span>
      </div>
      <div class="form-group">
        <input type="text" class="form-control" id="aadhar" placeholder="Aadhar Number" name="raadhar">
        <span class="error-message" id="aadharError"></span>
      </div>
      <div class="form-group">
        <input type="number" class="form-control" id="age" placeholder="Age" name="rage">
        <span class="error-message" id="ageError"></span>
      </div>
      <div class="form-group">
        <label for="gender">Gender:</label>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="gender" id="genderMale" value="Male">
          <label class="form-check-label" for="genderMale">Male</label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="gender" id="genderFemale" value="Female">
          <label class="form-check-label" for="genderFemale">Female</label>
        </div>
        <span class="error-message" id="genderError"></span>
      </div>
      <div class="form-group">
        <select class="form-control" id="location" name="rlocation">
          <option value="">Select location</option>
          <option value="tamilnadu">Tamil Nadu</option>
          <option value="kerala">Kerala</option>
          <option value="andhra">Andhra Pradesh</option>
          <option value="karnataka">Karnataka</option>
        </select>
        <span class="error-message" id="locationError"></span>
      </div>
      <div class="form-group">
        <input type="number" class="form-control" id="number" placeholder="Number" name="rnumber">
        <span class="error-message" id="numberError"></span>
      </div>
      <div class="form-group">
        <span class="error-message" id="agreeError"></span>
      </div>
      <input type="submit" class="btn btn-primary" value="Submit">
    </form>
  </div>

  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script>
    document.getElementById("registrationForm").addEventListener("submit", function(event) {
      var nameInput = document.getElementById("name");
      var emailInput = document.getElementById("email");
      var passwordInput = document.getElementById("password");
      var confirmPasswordInput = document.getElementById("confirmPassword");
      var aadharInput = document.getElementById("aadhar");
      var ageInput = document.getElementById("age");
      var genderInput = document.querySelector('input[name="gender"]:checked');
      var locationInput = document.getElementById("location");
      var numberInput = document.getElementById("number");

      var nameError = document.getElementById("nameError");
      var emailError = document.getElementById("emailError");
      var passwordError = document.getElementById("passwordError");
      var confirmPasswordError = document.getElementById("confirmPasswordError");
      var aadharError = document.getElementById("aadharError");
      var ageError = document.getElementById("ageError");
      var genderError = document.getElementById("genderError");
      var locationError = document.getElementById("locationError");
      var numberError = document.getElementById("numberError");
      var agreeError = document.getElementById("agreeError");

      // Reset error messages
      nameError.innerText = "";
      emailError.innerText = "";
      passwordError.innerText = "";
      confirmPasswordError.innerText = "";
      aadharError.innerText = "";
      ageError.innerText = "";
      genderError.innerText = "";
      locationError.innerText = "";
      numberError.innerText = "";
      agreeError.innerText = "";

      var isValid = true;

      if (nameInput.value.trim() === "") {
        nameError.innerText = "Please enter the patient name.";
        isValid = false;
      }

      if (emailInput.value.trim() === "") {
        emailError.innerText = "Please enter the patient email.";
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

      if (aadharInput.value.trim() === "") {
        aadharError.innerText = "Please enter the Aadhar number.";
        isValid = false;
      }

      if (ageInput.value.trim() === "") {
        ageError.innerText = "Please enter the age.";
        isValid = false;
      }

      if (!genderInput) {
        genderError.innerText = "Please select the gender.";
        isValid = false;
      }

      if (locationInput.value.trim() === "") {
        locationError.innerText = "Please select the location.";
        isValid = false;
      }

      if (numberInput.value.trim() === "") {
        numberError.innerText = "Please enter the number.";
        isValid = false;
      }

      if (!document.getElementById("agree").checked) {
        agreeError.innerText = "Please agree to the terms and conditions.";
        isValid = false;
      }

      if (!isValid) {
        event.preventDefault(); 
      }
    });
  </script>

  <%
    if (request.getMethod().equals("POST")) {
      String name = request.getParameter("rname");
      String email = request.getParameter("remail");
      String pwd = request.getParameter("rpasswd");
      String aadhar = request.getParameter("raadhar");
      String age = request.getParameter("rage");
      String gender = request.getParameter("gender");
      String location = request.getParameter("rlocation");
      String mobile_no = request.getParameter("rnumber");

      String url = "jdbc:mysql://localhost:3306/naresh";
      String dbusername = "root";
      String dbpassword = "Nh2026";

      try {
    	  Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, dbusername, dbpassword);
        String sql = "INSERT INTO regpatient (name, email, gender, password, aadhar, age, location, mobile_no) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, name);
        statement.setString(2, email);
        statement.setString(3, gender);
        statement.setString(4, pwd);
        statement.setString(5, aadhar);
        statement.setString(6, age);
        statement.setString(7, location);
        statement.setString(8, mobile_no);

        statement.executeUpdate();
        response.sendRedirect("patient_login.jsp");
        statement.close();
        conn.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
  %>
</body>
</html>
