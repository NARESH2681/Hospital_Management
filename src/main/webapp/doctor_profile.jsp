<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <style>
    body {
    background-image: linear-gradient(
  45deg,
  hsl(194deg 100% 50%) 0%,
  hsl(204deg 100% 68%) 11%,
  hsl(216deg 100% 76%) 22%,
  hsl(234deg 91% 82%) 33%,
  hsl(261deg 69% 80%) 44%,
  hsl(290deg 50% 77%) 56%,
  hsl(318deg 56% 77%) 67%,
  hsl(335deg 69% 78%) 78%,
  hsl(348deg 73% 79%) 89%,
  hsl(0deg 70% 79%) 100%
);
    
      font-family: Arial, sans-serif;
    }
    
    table {
      width: 100%;
      border-collapse: collapse;
    }
    
    th, td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    
    th {
      background-color: #f2f2f2;
    }
    
    .profile-image {
      width: 150px;
      height: 150px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
  <h1>Doctors Profiles</h1>
  <table>
    <%
    String url = "jdbc:mysql://localhost:3306/naresh";
    String dbusername = "root";
    String dbpassword = "Nh2026";

      try {
          Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, dbusername, dbpassword);
        String sql = "SELECT * FROM regdoctors";
        Statement statement = conn.createStatement();
        ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
          String name = rs.getString("name");
          String email = rs.getString("email");
          String hospitalname = rs.getString("hospitalname");
          String address = rs.getString("address");
          String aadhar = rs.getString("aadhar");
          String specialization = rs.getString("specialization");
          String location = rs.getString("location");
          String mobile_no = rs.getString("mobile_no");
          %>
          <tr>
            <th>Name:</th>
            <td><%= name %></td>
          </tr>
          <tr>
            <th>Email:</th>
            <td><%= email %></td>
          </tr>
          <tr>
            <th>Hospital Name:</th>
            <td><%= hospitalname %></td>
          </tr>
          <tr>
            <th>Address:</th>
            <td><%= address %></td>
          </tr>
          <tr>
            <th>Aadhar:</th>
            <td><%= aadhar %></td>
          </tr>
          <tr>
            <th>Specialization:</th>
            <td><%= specialization %></td>
          </tr>
          <tr>
            <th>Location:</th>
            <td><%= location %></td>
          </tr>
          <tr>
            <th>Mobile Number:</th>
            <td><%= mobile_no %></td>
          </tr>
          <tr>
            <td></td>
            <td>
              <form action="appoinmentbooking.jsp" method="post">
                <input type="hidden" name="viewName" value="<%= name %>">
                <button type="submit">View</button>
              </form>
            </td>
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
  </table>
</body>
</html>
