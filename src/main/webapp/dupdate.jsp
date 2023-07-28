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
    <title>Updating</title>
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
                String defaultEmail = "";
                String defaultHospitalName = "";
                String defaultAddress = "";
                String defaultAadharNumber = "";
                String defaultPassword = "";
                String defaultSpecialization = "";
                String defaultLocation = "";
                String defaultMobileNo = "";
                if (updateName != null) {
                    try {
                        PreparedStatement selectStatement = connection.prepareStatement(
                            "SELECT * FROM regdoctors WHERE name = ?"
                        );
                        selectStatement.setString(1, updateName);
                        ResultSet resultSet = selectStatement.executeQuery();
                        if (resultSet.next()) {
                            defaultEmail = resultSet.getString("email");
                            defaultHospitalName = resultSet.getString("hospitalname");
                            defaultAddress = resultSet.getString("address");
                            defaultAadharNumber = resultSet.getString("aadhar");
                            defaultPassword = resultSet.getString("pwd");
                            defaultSpecialization = resultSet.getString("specialization");
                            defaultLocation = resultSet.getString("location");
                            defaultMobileNo = resultSet.getString("mobile_no");
                        }
                        resultSet.close();
                        selectStatement.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                %>
                <h2>Update Record for <%= updateName %></h2>
                <form action="dupdateRecord.jsp" method="post">
                    <div class="form-group">
                        <label for="updateEmail">Email</label>
                        <input type="email" class="form-control" id="updateEmail" name="updateEmail" value="<%= defaultEmail %>">
                    </div>
                    <div class="form-group">
                        <label for="updateHospitalname">Hospital Name</label>
                        <input type="text" class="form-control" id="updateHospitalname" name="updateHospitalName" value="<%= defaultHospitalName %>">
                    </div>
                    <div class="form-group">
                        <label for="updateAddress">Address</label>
                        <input type="text" class="form-control" id="updateAddress" name="updateAddress" value="<%= defaultAddress %>">
                    </div>
                    <div class="form-group">
                        <label for="updateAadhar">Aadhar Number</label>
                        <input type="text" class="form-control" id="updateAadhar" name="updateAadharNumber" value="<%= defaultAadharNumber %>">
                    </div>
                    <div class="form-group">
                        <label for="updatePassword">Password</label>
                        <input type="password" class="form-control" id="updatePassword" name="updatePassword" value="<%= defaultPassword %>">
                    </div>
                    <div class="form-group">
                        <label for="updateSpecialization">Specialization</label>
                        <input type="text" class="form-control" id="updateSpecialization" name="updateSpecialization" value="<%= defaultSpecialization %>">
                    </div>
                    <div class="form-group">
                        <label for="updateLocation">Location</label>
                        <input type="text" class="form-control" id="updateLocation" name="updateLocation" value="<%= defaultLocation %>">
                    </div>
                    <div class="form-group">
                        <label for="updateMobile_no">Mobile Number</label>
                        <input type="number" class="form-control" id="updateMobile_no" name="updateMobileNo" value="<%= defaultMobileNo %>">
                    </div>
                    <input type="hidden" name="updateName" value="<%= updateName %>">
                    <button type="submit" class="btn btn-primary">Update Record</button>
                </form>
            </div>
        </div>
    </section>
</body>
</html>
