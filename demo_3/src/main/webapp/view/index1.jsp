<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 9/25/2024
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h1>Calculate Discount</h1>
<form action="/DiscountServlet" method="post">
    <label for="description">Product Description:</label>
    <input type="text" id="description" name="description" required><br><br>

    <label for="listPrice">List Price:</label>
    <input type="number" id="listPrice" name="listPrice" step="0.01" required><br><br>

    <label for="discountPercent">Discount Percent:</label>
    <input type="number" id="discountPercent" name="discountPercent" step="0.01" required><br><br>

    <button type="submit">Calculate Discount</button>
</form>
</body>
</html>
