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
    <title>update page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Titillium Web', sans-serif;
        }
        body {
            background: lightblue;
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
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Password</th>
                            <th scope="col">Location</th>
                            <th scope="col">Mobile No</th>
                            <th scope="col">Age</th>
                            <th scope="col">Aadhar</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                Statement selectStatement = connection.createStatement();
                                ResultSet resultSet = selectStatement.executeQuery("SELECT * FROM regpatient");

                                while (resultSet.next()) {
                                    String currentName = resultSet.getString("name");
                                    String currentEmail = resultSet.getString("email");
                                    String currentGender = resultSet.getString("gender");
                                    String currentPwd = resultSet.getString("password");
                                    String currentLocation = resultSet.getString("location");
                                    String currentMobileNo = resultSet.getString("mobile_no");
                                    String currentAge = resultSet.getString("age");
                                    String currentAadhar = resultSet.getString("aadhar");
                        %>
                                    <tr id="<%= currentName %>">
                                        <td><%= currentName %></td>
                                        <td><%= currentEmail %></td>
                                        <td><%= currentGender %></td>
                                        <td><%= currentPwd %></td>
                                        <td><%= currentLocation %></td>
                                        <td><%= currentMobileNo %></td>
                                        <td><%= currentAge %></td>
                                        <td><%= currentAadhar %></td>
                                        <td>
                                            <form action="update.jsp" method="post">
                                                <input type="hidden" name="updateName" value="<%= currentName %>">
                                                <button type="submit" class="btn btn-warning" style="margin-right: 5px;">Update</button>
                                            </form>
                                            <form action="delete.jsp" method="post" onsubmit="return confirm('Do you want to delete this data?');">
                                                <input type="hidden" name="deleteName" value="<%= currentName %>">
                                                <button type="submit" class="btn btn-danger">Delete</button>
                                            </form>
                                        </td>
                                    </tr>
                        <%
                                }
                                resultSet.close();
                                selectStatement.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            } finally {
                                try {
                                    if (connection != null) {
                                        connection.close();
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</body>
</html>