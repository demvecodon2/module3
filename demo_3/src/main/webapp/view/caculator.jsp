<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 9/26/2024
  Time: 8:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Máy Tính Đơn Giản</title>
</head>
<body>
<h1>Máy Tính Đơn Giản</h1>
<form action="ad" method="post">
    <input type="text" id="num1" name="num1" required><br><br>
    <label for="num2">Toán hạng 2:</label>
    <input type="text" id="num2" name="num2" required><br><br>
    <label for="operator">Toán tử:</label>
    <select id="operator" name="operator">
        <option value="+">Cộng</option>
        <option value="-">Trừ</option>
        <option value="*">Nhân</option>
        <option value="/">Chia</option>
    </select><br><br>
    <input type="submit" value="Tính">
</form>
</body>
</html>
