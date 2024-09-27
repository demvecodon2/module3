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
<h2> học sinh có điểm trên 8</h2>
<table border="5">
    <tr>
        <th>ID</th>
        <th>tên</th>
        <th> địa chỉ</th>
        <th> điểm </th>
    </tr>
    <c:if test="${not empty students}">
    <c:forEach var="student" items="${students}">
        <c:if test="${student.score >8}">
    <tr>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>${student.address}</td>
            <td>${student.pount}</td>
        </tr>
        </c:if>
    </c:forEach>
    </c:if>

</table>
</body>
</html>
