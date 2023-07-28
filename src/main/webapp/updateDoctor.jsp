<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
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
    <title>GROCERY</title>
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
        <div class="container-fluid">
            <p class="logo" style="margin-top: 5px; font-size: 2rem; font-weight: bolder; color: white;">
                <i class="fa fa-shopping-basket"></i>Grocery Store
            </p>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto"></ul>
                <ul class="navbar-nav">
                    <li class="nav-item active"><a class="nav-link" href="homepage.jsp">Home Page</a></li>
                    <li class="nav-item active"><a class="nav-link" href="Login.jsp" onclick="alert('Logout Successfully')">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="wrapper" style="top: 30px; height: 100%; width: 100%;">
        <div class="container-fostrap" style="padding: 1em; text-align: center;">
        <div class="container-fluid"><b>You can add your product here :</b>
		<a style="margin: 10px 0" class="btn btn-primary" href="addproduct.jsp">Add Product</a>
		<a style="margin: 10px 0" class="btn btn-primary" href="adminhome.jsp">Back</a>
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
                    String productId = request.getParameter("productId");
                    String productName = request.getParameter("productName");
                    String category = request.getParameter("category");
                    String availableQuantity = request.getParameter("availableQuantity");
                    String price = request.getParameter("price");

                    if (productName != null && category != null && availableQuantity != null && price != null) {
                        try {
                            if (productId.isEmpty()) {
                                PreparedStatement insertStatement = connection.prepareStatement(
                                    "INSERT INTO stock_product (product_name, category, available_quantity, price) VALUES (?, ?, ?, ?)"
                                );
                                insertStatement.setString(1, productName);
                                insertStatement.setString(2, category);
                                insertStatement.setString(3, availableQuantity);
                                insertStatement.setString(4, price);
                                insertStatement.executeUpdate();
                            } else {
                                PreparedStatement updateStatement = connection.prepareStatement(
                                    "UPDATE stock_product SET product_name = ?, category = ?, available_quantity = ?, price = ? WHERE product_id = ?"
                                );
                                updateStatement.setString(1, productName);
                                updateStatement.setString(2, category);
                                updateStatement.setString(3, availableQuantity);
                                updateStatement.setString(4, price);
                                updateStatement.setString(5, productId);
                                updateStatement.executeUpdate();
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
                <% 
                    String deleteProductId = request.getParameter("deleteProductId");

                    if (deleteProductId != null) {
                        try {
                            PreparedStatement deleteStatement = connection.prepareStatement(
                                "DELETE FROM stock_product WHERE product_id = ?"
                            );
                            deleteStatement.setString(1, deleteProductId);
                            deleteStatement.executeUpdate();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
                <table class="table">
                    <tr>
                        <th scope="col">S.No</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Category</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Price</th>
                        <th scope="col">Delete</th> 
                        <th scope="col">Update</th>
                    </tr>
                    <tbody>
                        <%
                            try {
                                Statement selectStatement = connection.createStatement();
                                ResultSet resultSet = selectStatement.executeQuery("SELECT * FROM stock_product");

                                while (resultSet.next()) {
                                    String currentProductId = resultSet.getString("product_id");
                                    String currentProductName = resultSet.getString("product_name");
                                    String currentCategory = resultSet.getString("category");
                                    String currentQuantity = resultSet.getString("available_quantity");
                                    String currentPrice = resultSet.getString("price");
                          %>
                                    <tr>
                                        <td><%= currentProductId %></td>
                                        <td><%= currentProductName %></td>
                                        <td><%= currentCategory %></td>
                                        <td><%= currentQuantity %></td>
                                        <td><%= currentPrice %></td>
                                        <td>
                                            <form action="#" method="post" onsubmit="return confirm('Do you want to delete this product?');">
                                                <input type="hidden" name="deleteProductId" value="<%= currentProductId %>">
                                                <input type="submit" class="btn btn-danger" value="Delete">
                                            </form>
                                        </td>
                                        <td>
                                            <div class="product" style="text-align: center;">
                                                <div class="col-xs-4">
                                                    <form action="#" method="post" id="updateForm" onsubmit="return confirm('Do you want to update this product?');">
                                                        <input type="hidden" name="productId" value="<%= currentProductId %>">
                                                        <div class="modal fade" id="updateModal_<%= currentProductId %>" role="dialog">
                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title">Update Product Details</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body text-center">
                                                                        <label for="name">Name</label> 
                                                                        <input type="text" class="form-control border border-info" id="name_<%= currentProductId %>" name="productName" placeholder="Enter product name" value="<%= currentProductName %>">
                                                                        <div class="error"></div>
                                                                    </div>
                                                                    <div class="modal-body text-center">
                                                                        <label for="category">Category</label> 
                                                                        <input type="text" class="form-control border border-info" id="category_<%= currentProductId %>" name="category" placeholder="Enter product category" value="<%= currentCategory %>">
                                                                        <div class="error"></div>
                                                                    </div>
                                                                    <div class="modal-body text-center">
                                                                        <label for="quantity">Quantity</label> 
                                                                        <input type="number" class="form-control border border-info" id="quantity_<%= currentProductId %>" name="availableQuantity" min="1" placeholder="Quantity" value="<%= currentQuantity %>">
                                                                        <div class="error"></div>
                                                                    </div>
                                                                    <div class="modal-body text-center">
                                                                        <label for="price">Price</label> 
                                                                        <input type="number" class="form-control border border-info" id="price_<%= currentProductId %>" name="price" min="1" placeholder="Price" value="<%= currentPrice %>">
                                                                        <div class="error"></div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                        <button type="submit" class="btn btn-primary">Submit</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#updateModal_<%= currentProductId %>" >
                                                        Update
                                                    </button>
                                                </div>  
                                            </div>
                                        </td>
                                    </tr>
                        <%
                                }
                                resultSet.close();
                                selectStatement.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>
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