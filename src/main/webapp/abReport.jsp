<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Appointment Report</title>
    <style>
        /* CSS Styling for the report table */
        body {
            background-image: linear-gradient(
  30deg,
  hsl(303deg 86% 51%) 0%,
  hsl(338deg 82% 59%) 20%,
  hsl(12deg 77% 66%) 58%,
  hsl(47deg 72% 73%) 77%,
  hsl(83deg 68% 80%) 87%,
  hsl(117deg 63% 87%) 93%,
  hsl(124deg 62% 82%) 96%,
  hsl(130deg 62% 76%) 99%,
  hsl(135deg 61% 71%) 100%,
  hsl(142deg 60% 65%) 100%,
  hsl(148deg 59% 60%) 100%
);
            background-size: cover;
            background-repeat: no-repeat;
            height: 100vh;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .accept-button {
            text-align: center;
        }

        .accept-button button {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .accept-button button:hover {
            background-color: #45a049;
        }

        @media only screen and (max-width: 600px) {
            /* Responsive table for smaller screens */
            table {
                font-size: 12px;
            }

            th, td {
                padding: 5px;
            }

            .accept-button {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .accept-button button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
     <h1>Appointment Report</h1>
    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Mobile Number</th>
            <th>Gender</th>
            <th>Type</th>
            <th>Purpose</th>
            <th>Appointment Date</th>
            <th>Appointment Time</th>
            <th></th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/naresh", "root", "Nh2026");
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT name, email, mobile, gender, type, purpose, appointment_date, appointment_time FROM regappointments");

                while (resultSet.next()) {
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String mobile = resultSet.getString("mobile");
                    String gender = resultSet.getString("gender");
                    String type = resultSet.getString("type");
                    String purpose = resultSet.getString("purpose");
                    String appointmentDate = resultSet.getString("appointment_date");
                    String appointmentTime = resultSet.getString("appointment_time");
        %>
        <tr>
            <td><%= name %></td>
            <td><%= email %></td>
            <td><%= mobile %></td>
            <td><%= gender %></td>
            <td><%= type %></td>
            <td><%= purpose %></td>
            <td><%= appointmentDate %></td>
            <td><%= appointmentTime %></td>
            <td class="accept-button">
                <form action="confirmation.jsp" method="get">
                    <input type="hidden" name="name" value="<%= name %>">
                    <input type="hidden" name="email" value="<%= email %>">
                    <input type="hidden" name="appointmentDate" value="<%= appointmentDate %>">
                    <input type="hidden" name="appointmentTime" value="<%= appointmentTime %>">
                    <button type="submit">Accept</button>
                </form>
            </td>
        </tr>
        <%
                }
                resultSet.close();
                statement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
