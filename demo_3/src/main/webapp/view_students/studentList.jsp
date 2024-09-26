<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách Sinh viên</title>
</head>
 <body>
<h1>Danh sách Sinh viên</h1>
<table border="5">
    <tr>
        <th>ID</th>
        <th>tên</th>
        <th> địa chỉ</th>
    </tr>
    <c:forEach var="student" items="${students}">
    <tr>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>${student.address}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
