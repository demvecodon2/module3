<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/3/2024
  Time: 8:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cửa Hàng Hoa Quả</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="casetudy.css">
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
    }

    .logo {
        height: 80px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s;
    }

    .logo:hover {
        transform: scale(1.05);
    }

    form {
        flex-grow: 1;
        max-width: 400px;
    }

    .banner {
        background-color: #ffcc80;
    }

    .card {
        transition: transform 0.3s;
    }

    .card:hover {
        transform: scale(1.05);
    }

    .card-title {
        font-weight: bold;
        color: #333;
    }

    .text-danger {
        font-size: 1.25rem;
        color: #e74c3c;
    }

    .card-img-top {
        height: 300px;
        object-fit: cover;
    }

    .navbar-nav .nav-link {
        color: #27ae60;
    }

    .navbar-nav .nav-link:hover {
        color: #fff;
        background-color: #2ecc71;
    }

    .form-control {
        width: 250px;
    }

    .btn-outline-success {
        border-color: #27ae60;
        color: #27ae60;
    }

    .btn-outline-success:hover {
        background-color: #d4edda;
        color: #155724;
    }

    .custom-carousel {
        max-width: 100%;
        margin: auto;
    }

    .custom-carousel .carousel-inner {
        position: relative;
        overflow: hidden;
        width: 100%;
        height: 600px;
    }

    .custom-carousel .carousel-inner img {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 100%;
        height: 100%;
        object-fit: cover;
        transform: translate(-50%, -50%);
    }

    .carousel img {
        max-height: 400px;
        width: 100%;
        object-fit: cover;
    }

    .navbar {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 1000;
        background-color: #ffffff;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    body {
        padding-top: 160px;
    }

    .navbar.sticky {
        background-color: #f8f9fa;
        padding: 10px 0;
    }

    .contact-links {
        position: fixed;
        right: 15px;
        bottom: 100px;
        z-index: 1000;
    }

    .contact-item {
        display: block;
        background-color: rgba(255, 255, 255, 0.8);
        border-radius: 50%;
        width: 50px;
        height: 50px;
        text-align: center;
        line-height: 50px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        margin-bottom: 10px;
        color: #ff7c2a;
        transition: background-color 0.3s;
    }

    .contact-item:hover {
        background-color: #ff7c2a;
        color: white;
    }

    .fixed-top {
        position: fixed;
        top: 56px;
        left: 0;
        right: 0;
        background-color: #ffd2ab;
        z-index: 1000;
    }

    .container {
        max-width: 100%;
        padding: 0 15px;
    }
</style>
<body>
<header style="background-color: #ffd2ab;">
    <div class="container d-flex align-items-center justify-content-between fixed-top" style="top: 0;">
        <img src="https://free.vector6.com/wp-content/uploads/2020/07/KhoThietKe-0000000184.jpg" alt="Logo" class="logo"
             style="height: 80px;">
        <form class="d-flex ms-3" action="fruitshop" method="get">
            <input class="form-control me-2" type="search" name="keyword" placeholder="Tìm sản phẩm"
                   aria-label="Search">
            <button class="btn btn-outline-light" style="color: lavenderblush; background: #ff7c2a;" type="submit"
                    name="action" value="search">Tìm
            </button>
        </form>
    </div>

    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin-top: 80px;">
        <div class="container-fluid justify-content-center">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">Sản Phẩm</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Trái Cây</a></li>
                            <li><a class="dropdown-item" href="#">Giỏ Trái Cây</a></li>
                            <li><a class="dropdown-item" href="#">Hoa Quả Nhập Khẩu</a></li>
                            <li><a class="dropdown-item" href="#">Hoa Quả Sấy</a></li>
                            <li><a class="dropdown-item" href="#">Hoa Quả Tươi</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#">Giới Thiệu</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Tin Tức</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Liên Hệ</a></li>
                    <button class="btn btn-primary" onclick="window.location.href='/login'">Đăng nhập</button>
                </ul>
            </div>
        </div>
    </nav>
</header>

    <div class="banner text-center text-white py-5">
        <div class="container">
            <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="2000">
                        <img src="https://tfruit.com.vn/wp-content/uploads/2023/04/Voucher-50k.jpg" class="d-block w-100" alt="Voucher 50k">
                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                        <img src="https://tfruit.com.vn/wp-content/uploads/2020/11/GV2-1.jpg" class="d-block w-100" alt="Hình ảnh sản phẩm 2">
                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                        <img src="https://www.thietkewebchuanseo.com/images/bai-viet-quang-cao-ban-trai-cay-4942.jpg" class="d-block w-100" alt="Hình ảnh sản phẩm 3">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
     <div class="container">
        <h3 class="text-center mb-5">Sản Phẩm Nổi Bật</h3>
        <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                    <div class="card shadow-sm">
                        <img src="${product.image}" alt="${product.name}" class="card-img-top" style="max-height: 200px;">
                        <div class="card-body">
                            <h5 class="card-title"><c:out value="${product.name}"/></h5>
                            <p class="card-text"><c:out value="${product.description}"/></p>
                            <p class="text-danger"><c:out value="${product.price}"/> VND</p>
                            <div class="actions">
                                <a href="fruitshop?action=search&id=${product.product_name}" class="btn btn-info">Xem</a>
                                <a href="fruitshop?action=add&name=${product.product_name}" class="btn btn-success" onclick="return confirm('Bạn có chắc chắn muốn mua sản phẩm này?');">Mua</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>



<footer class="text-center text-white" style="background-color: #ff7c2a;">
    <div class="container p-4">
        <h5>Liên Hệ Chúng Tôi</h5>
        <p>Email: contact@fruitshop.com</p>
        <p>Điện thoại: 0123 456 789</p>
        <p>Địa chỉ: 123 Đường Hoa Quả, TP. HCM</p>
    </div>
    <div class="contact-links">
        <a href="mailto:contact@fruitshop.com" class="contact-item">
            <i class="fas fa-envelope"></i>
        </a>
        <a href="tel:0123456789" class="contact-item">
            <i class="fas fa-phone"></i>
        </a>
        <a href="https://www.facebook.com/messages/e2ee/t/7946518635382626?locale=vi_VN" class="contact-item">
            <i class="fas fa-comment-dots"></i>
        </a>
    </div>

</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>