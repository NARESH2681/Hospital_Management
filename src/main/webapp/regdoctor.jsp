<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Doctor Register</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f5f5f5;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 10%;
        }

        .container h2 {
            text-align: center;
            margin-bottom: 15px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 8px;
            width: 100%;
        }

        .form-control:focus {
            outline: none;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            border-color: #80bdff;
        }

        .btn-primary {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Doctor Register</h2>
        <form action="register.jsp" method="POST">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="hospital">Hospital Name:</label>
                <input type="text" id="hospital" name="hospital" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="address">Address:</label>
                <textarea id="address" name="address" class="form-control" required></textarea>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="confirm_password">Confirm Password:</label>
                <input type="password" id="confirm_password" name="confirm_password" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="specialization">Specialization:</label>
                <input type="text" id="specialization" name="specialization" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="location">Location:</label>
                <input type="text" id="location" name="location" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="mobile">Mobile Number:</label>
                <input type="text" id="mobile" name="mobile" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-primary">Register</button>
        </form>
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    <% 
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String hospital = request.getParameter("hospital");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm_password");
        String specialization = request.getParameter("specialization");
        String location = request.getParameter("location");
        String mobile = request.getParameter("mobile");

        String url = "jdbc:mysql://localhost:3306/naresh";
        String dbusername = "root";
        String dbpassword = "Nh2026";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, dbusername, dbpassword);
            String sql = "INSERT INTO regdoctors  (name, email, hospital, address, password, specialization, location, mobile) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, hospital);
            statement.setString(4, address);
            statement.setString(5, password);
            statement.setString(6, specialization);
            statement.setString(7, location);
            statement.setString(8, mobile);

            statement.executeUpdate();
            response.sendRedirect("doctor_login.jsp");
            statement.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</body>
</html>
