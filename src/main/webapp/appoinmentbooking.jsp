<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.sql.*" %>
<%@ page import="java.io.*, java.sql.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #3498db;
        }

        h1 {
            text-align: center;
        }

        form {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="email"],
        input[type="number"],
        select,
        textarea {
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

        .error-message {
            color: red;
            margin-top: 5px;
        }

        /* Responsive design */
        @media screen and (max-width: 500px) {
            form {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <h1>Doctor Appointment Booking</h1>
    <form id="registrationForm" method="post" action="<%=request.getRequestURI()%>">
        <div class="form-group">
            <label for="name">Patient Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>
        </div>
        <div class="form-group">
            <label for="email">Patient Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <div class="form-group">
            <label for="mobile">Patient Mobile No:</label>
            <input type="text" id="mobile" name="mobile" placeholder="Enter your mobile number" required>
        </div>
        <div class="form-group">
            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="">Select gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select>
        </div>
        <div class="form-group">
            <label for="detail">Have you ever applied to our facility before?</label>
            <input type="radio" id="detailYes" name="detail" value="yes" required>
            <label for="detailYes">New Patient</label>
            <input type="radio" id="detailNo" name="detail" value="no" required>
            <label for="detailNo">Old Patient</label>
        </div>
        <div class="form-group">
            <label for="purpose">Appointment for:</label>
            <select id="purpose" name="purpose" required>
                <option value="">Select purpose</option>
                <option value="Normal checkup">Normal checkup</option>
                <option value="Operation">Operation</option>
                <option value="Result Analysis">Result Analysis</option>
                <option value="Medicine">Medicine</option>
            </select>
        </div>
       
        <div class="form-group">
            <label for="appointmentDate">Appointment Date:</label>
            <input type="date" id="appointmentDate" name="appointmentDate" required>
        </div>
        <div class="form-group">
            <label for="appointmentTime">Appointment Time:</label>
            <input type="time" id="appointmentTime" name="appointmentTime" required>
        </div>
        <input type="submit" value="Submit">
    </form>

    <%@ page import="java.util.logging.*" %>
    <% if (request.getMethod().equals("POST")) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String type = request.getParameter("detail");
        String purpose = request.getParameter("purpose");
        String appointmentDate = request.getParameter("appointmentDate");
        String appointmentTime = request.getParameter("appointmentTime");
        
        String url = "jdbc:mysql://localhost:3306/naresh";
        String dbusername = "root";
        String dbpassword = "Nh2026";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, dbusername, dbpassword);
            String sql = "INSERT INTO regappointments (name, email, mobile, gender, type, purpose, appointment_date, appointment_time) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, mobile);
            statement.setString(4, gender);
            statement.setString(5, type);
            statement.setString(6, purpose);
            
            // Parse date and time strings into Date and Time objects
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
            java.util.Date date = dateFormat.parse(appointmentDate);
            java.util.Date time = timeFormat.parse(appointmentTime);
            Date sqlDate = new Date(date.getTime());
            Time sqlTime = new Time(time.getTime());

            statement.setDate(7, sqlDate);
            statement.setTime(8, sqlTime);

            statement.executeUpdate();
            response.sendRedirect("scheduled.jsp");
            statement.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to an error page if needed
        }
    }
    %>
</body>
</html>
