<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 9/25/2024
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Discount Results</title>
</head>
<body>
<h1>Discount Results</h1>
<p><strong>Product Description:</strong> <%= request.getAttribute("description") %></p>
<p><strong>List Price:</strong> $<%= request.getAttribute("listPrice") %></p>
<p><strong>Discount Percent:</strong> <%= request.getAttribute("discountPercent") %> %</p>
<p><strong>Discount Amount:</strong> $<%= request.getAttribute("discountAmount") %></p>
<p><strong>Discount Price:</strong> $<%= request.getAttribute("discountPrice") %></p>
<a href="index1.jsp">Back to Calculator</a>
</body>
</html>
