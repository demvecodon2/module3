<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 10/5/2024
  Time: 11:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Giỏ Hàng</h2>
    <table class="table">
        <thead>
        <tr>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${cartItems}">
            <tr>
                <td><c:out value="${item.product.name}"/></td>
                <td><c:out value="${item.product.price}"/> VND</td>
                <td><c:out value="${item.quantity}"/></td>
                <td>
                    <a href="fruitshop?action=remove&id=${item.product.id}" class="btn btn-danger">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <h5>Tổng: <c:out value="${totalPrice}"/> VND</h5>
    <a href="checkout.jsp" class="btn btn-primary">Thanh toán</a>
    <a href="index.jsp" class="btn btn-secondary">Tiếp tục mua sắm</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
