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
<table border="1">
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Địa chỉ</th>
    </tr>
    <c:if test="${not empty students}">
        <c:forEach var="student" items="${students}">
            <tr>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.address}</td>
            </tr>
        </c:forEach>
    </c:if>
    <c:if test="${empty students}">
        <tr>
            <td colspan="3">Không có sinh viên nào được tìm thấy.</td>
        </tr>
    </c:if>
</table>
</body>
</html>
