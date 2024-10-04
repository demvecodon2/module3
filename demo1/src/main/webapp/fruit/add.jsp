<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm sản phẩm</title>
</head>
<body>
<h1>Thêm sản phẩm mới</h1>

<form action="fruitshop" method="post">
    <%--@declare id="category_id"--%><%--@declare id="image"--%><%--@declare id="price"--%><%--@declare id="description"--%><%--@declare id="name"--%><input type="hidden" name="action" value="create">
    <label for="name">Tên sản phẩm:</label>
    <input type="text" name="name" required>
    <br>
    <label for="description">Mô tả:</label>
    <input type="text" name="description">
    <br>
    <label for="price">Giá:</label>
    <input type="number" step="1.0" name="price" required>
    <br>
    <label for="image">Hình ảnh:</label>
    <input type="text" name="image">
    <br>
    <label for="category_id">ID danh mục:</label>
    <input type="number" name="category_id" required>
    <br>
    <input type="submit" value="Thêm sản phẩm">
</form>
<a href="fruitshop">Trở về danh sách sản phẩm</a>
</body>
</html>

