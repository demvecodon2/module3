<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f9f9f9;
        }
        .product-container {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .btn-secondary {
            margin-top: 20px;
        }
        img {
            border-radius: 8px;
        }
    </style>
</head>
<body>
<div class="container product-container">
    <h2 class="text-center">${product.name}</h2>
    <img src="${product.image}" alt="${product.name}" class="img-fluid" style="max-height: 400px;">
    <p class="mt-3"><strong>Giá: </strong><c:out value="${product.price}"/> VND</p>
    <p><strong>Mô tả: </strong><c:out value="${product.description}"/></p>
    <a href="fruitshop" class="btn btn-secondary">Trở về</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
