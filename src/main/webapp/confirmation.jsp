<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Appointment Confirmation</title>
    <style>
        /* CSS Styling for the confirmation message */
        body {
            background-image: linear-gradient(
                30deg,
                hsl(303deg 86% 51%) 0%,
                hsl(283deg 82% 59%) 20%,
                hsl(263deg 77% 66%) 58%,
                hsl(243deg 72% 73%) 77%,
                hsl(223deg 68% 80%) 87%,
                hsl(203deg 63% 87%) 93%,
                hsl(203deg 64% 70%) 96%,
                hsl(204deg 63% 52%) 99%,
                hsl(204deg 63% 35%) 100%,
                hsl(203deg 64% 17%) 100%,
                hsl(0deg 0% 0%) 100%
            );
            background-size: cover;
            background-repeat: no-repeat;
            height: 100vh;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            text-align: center;
        }

        h1 {
            text-align: center;
        }

        .confirmation-message {
            text-align: center;
            margin-bottom: 20px;
        }

        .appointment-details {s
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>Appointment Confirmation</h1>
    <div class="confirmation-message">
        <p>Your appointment has been confirmed!</p>
    </div>
    <div class="appointment-details">
        <p><strong>Name:</strong> <%= request.getParameter("name") %></p>
        <p><strong>Email:</strong> <%= request.getParameter("email") %></p>
        <p><strong>Date:</strong> <%= request.getParameter("appointmentDate") %></p>
        <p><strong>Time:</strong> <%= request.getParameter("appointmentTime") %></p>
    </div>
</body>
</html>
