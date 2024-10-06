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
    <title>Chi tiết sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">${product.name}</h2>
    <img src="${product.image}" alt="${product.name}" class="img-fluid" style="max-height: 400px;">
    <p class="mt-3"><strong>Giá: </strong><c:out value="${product.price}"/> VND</p>
    <p><strong>Mô tả: </strong><c:out value="${product.description}"/></p>
    <form action="fruitshop" method="post">
        <input type="hidden" name="productId" value="${product.product_id}">
        <button type="submit" class="btn btn-success">Thêm vào giỏ hàng</button>
    </form>
    <a href="index.jsp" class="btn btn-secondary mt-3">Trở về</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
