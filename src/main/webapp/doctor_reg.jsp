<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Registration</title>
    <style>
        body {
        background-image: linear-gradient(
  45deg,
  hsl(55deg 100% 50%) 0%,
  hsl(70deg 87% 58%) 11%,
  hsl(90deg 88% 66%) 22%,
  hsl(123deg 86% 71%) 33%,
  hsl(152deg 89% 59%) 44%,
  hsl(167deg 100% 47%) 56%,
  hsl(175deg 100% 46%) 67%,
  hsl(182deg 100% 46%) 78%,
  hsl(187deg 100% 49%) 89%,
  hsl(190deg 100% 50%) 100%
);
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        h1 {
            text-align: center;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            margin-top: 5px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Doctor Registration</h1>
    <div class="container">
        <form method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="rname" placeholder="Enter your name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="remail" placeholder="Enter your email" required>

            <label for="hospitalName">Hospital Name:</label>
            <input type="text" id="hospitalName" name="rhospitalName" placeholder="Enter hospital name" required>

            <label for="address">Address:</label>
            <input type="text" id="address" name="raddress" placeholder="Enter your address" required>

            <label for="aadharNumber">Aadhar Number:</label>
            <input type="text" id="aadharNumber" name="raadharNumber" placeholder="Enter your Aadhar number" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="rpassword" placeholder="Enter your password" required>

            <label for="specialization">Specialization:</label>
            <input type="text" id="specialization" name="rspecialization" placeholder="Enter your specialization" required>

            <label for="location">Location:</label>
            <input type="text" id="location" name="rlocation" placeholder="Enter your location" required>

            <label for="mobileNo">Mobile Number:</label>
            <input type="number" id="mobileNo" name="rmobileNo" placeholder="Enter your mobile number" required>

            <input type="submit" value="Register">
        </form>
    </div>
    <% 
    if (request.getMethod().equals("POST")) {
        String name = request.getParameter("rname");
        String email = request.getParameter("remail"); 
        String address = request.getParameter("raddress");
        String aadhar = request.getParameter("raadharNumber");
        String pwd = request.getParameter("rpassword");
        String specialization = request.getParameter("rspecialization");
        String location = request.getParameter("rlocation");
        String mobile_no = request.getParameter("rmobileNo");
        String hospitalname = request.getParameter("rhospitalName");

        String url = "jdbc:mysql://localhost:3306/naresh";
        String dbusername = "root";
        String dbpassword = "Nh2026";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, dbusername, dbpassword);
            String sql = "INSERT INTO regdoctors (name, email, address, aadhar, pwd, specialization, location, mobile_no, hospitalname) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, address);
            statement.setString(4, aadhar);
            statement.setString(5, pwd);
            statement.setString(6, specialization);
            statement.setString(7, location);
            statement.setString(8, mobile_no);
            statement.setString(9, hospitalname);

            statement.executeUpdate();
            response.sendRedirect("doctor_login.jsp");

            statement.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    %>
</body>
</html>
