<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 10/1/2024
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Mô tả</th>
            <th>giá</th>
            <th>hình ảnh</th>
            <th> thao tác</th>

        </tr>
        <c:forEach var="product" items="${listUser}">
            <tr>
                <td><c:out value="${product.id}"/></td>
                <td><c:out value="${product.name}"/></td>
                <td><c:out value="${product.description}"/></td>
                <td><c:out value="${product.price}"/></td>
                <td><c:out value="${product.image}"/></td>
                <td><c:out value="${product.category_id}"/></td>
                <td>
                    <a href="/users?action=edit&id=${product.id}">Edit</a>
                    <a href="/users?action=delete&id=${product.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>