<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="allstyle.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <title>updated page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Titillium Web', sans-serif;
        }
        body {
            background: rgb(177, 173, 226);
            background: linear-gradient(90deg, rgba(177, 173, 226, 1) 0%, rgba(125, 223, 248, 1) 100%);
        }
        .error {
            color: red;
            font-size: 15px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
       
    </nav>
    <section class="wrapper" style="top: 30px; height: 100%; width: 100%;">
        <div class="container-fostrap" style="padding: 1em; text-align: center;">
            <div class="container-fluid">
                <% 
                String url = "jdbc:mysql://localhost:3306/naresh";
                String dbusername = "root";
                String dbpassword = "Nh2026";
                    Connection connection = null;
                    try {
                    	   Class.forName("com.mysql.jdbc.Driver");
                        connection = DriverManager.getConnection(url, dbusername, dbpassword);
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
                <% 
                    String updateName = request.getParameter("updateName");
                    String updateEmail = request.getParameter("updateEmail");
                    String updateGender = request.getParameter("updateGender");
                    String updatePassword = request.getParameter("updatePassword");
                    String updateLocation = request.getParameter("updateLocation");
                    String updateMobileNo = request.getParameter("updateMobileNo");
                    String updateAge = request.getParameter("updateAge");
                    String updateAadhar = request.getParameter("updateAadhar");

                    try {
                        PreparedStatement updateStatement = connection.prepareStatement(
                            "UPDATE regpatient SET email = ?, gender = ?, password = ?, location = ?, mobile_no = ?, age = ?, aadhar = ? WHERE name = ?"
                        );
                        updateStatement.setString(1, updateEmail);
                        updateStatement.setString(2, updateGender);
                        updateStatement.setString(3, updatePassword);
                        updateStatement.setString(4, updateLocation);
                        updateStatement.setString(5, updateMobileNo);
                        updateStatement.setString(6, updateAge);
                        updateStatement.setString(7, updateAadhar);
                        updateStatement.setString(8, updateName);
                        updateStatement.executeUpdate();
                        updateStatement.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
                <h2>Record Updated Successfully</h2>
                <p>Name: <%= updateName %></p>
                <p>Email: <%= updateEmail %></p>
                <p>Gender: <%= updateGender %></p>
                <p>Password: <%= updatePassword %></p>
                <p>Location: <%= updateLocation %></p>
                <p>Mobile No: <%= updateMobileNo %></p>
                <p>Age: <%= updateAge %></p>
                <p>Aadhar: <%= updateAadhar %></p>
                <a href="patientlist.jsp">back to patientlist page</a>
                <% 
                    try {
                        if (connection != null) {
                            connection.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
            </div>
        </div>
    </section>
</body>
</html>