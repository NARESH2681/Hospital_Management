<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>hospital list</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: lightblue;/* Set the background color for the page */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff; /* Set the background color for the table */
        }

        th,
        td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #e0e0e0; /* Change the hover background color if desired */
        }

        .addButton {
            padding: 5px 10px;
            border: none;
            cursor: pointer;
            font-size: 14px;
            border-radius: 5px;
            background-color: blue;
            color: white;
        }

        @media screen and (max-width: 600px) {
            table {
                font-size: 14px;
            }

            th,
            td {
                padding: 6px;
            }

            .addButton {
                padding: 3px 8px;
                font-size: 12px;
            }
        }
    </style>
</head>

<body>
    <h2>Hospital list </h2>
    <div style="overflow-x: auto;">
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Mobile No</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Address</th>
                </tr>
            </thead>
            <tbody>
                <% 
                String url = "jdbc:mysql://localhost:3306/naresh";
                String dbusername = "root";
                String dbpassword = "Nh2026";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(url, dbusername, dbpassword);
                    
                    String sql = "SELECT * FROM users";
                    Statement statement = conn.createStatement();
                    ResultSet rs = statement.executeQuery(sql);
                    
                    while (rs.next()) {
                        String name = rs.getString("name");
                        String mobileNo = rs.getString("mobile_no");
                        String email = rs.getString("email");
                        String password = rs.getString("pwd");
                        String address = rs.getString("address");
                %>
                <tr>
                    <td><%= name %></td>
                    <td><%= mobileNo %></td>
                    <td><%= email %></td>
                    <td><%= password %></td>
                    <td><%= address %></td>
                </tr>
                <% 
                    }
                    
                    rs.close();
                    statement.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </tbody>
        </table>
    </div>
    
    <button class="addButton" onclick="location.href='hospital_reg.jsp'">Add</button>
</body>

</html>
