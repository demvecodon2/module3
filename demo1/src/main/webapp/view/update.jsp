<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sửa Thông Tin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            max-width: 400px;
            margin: auto;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            margin-top: 15px;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h1>Sửa Thông Tin</h1>
<form method="post">
    <label for="name">Họ và Tên</label>
    <input id="name" name="name" type="text" placeholder="Nhập họ và tên" required>

    <label for="address">Địa Chỉ</label>
    <input id="address" name="address" type="text" placeholder="Nhập địa chỉ" required>

    <label for="age">Tuổi</label>
    <input id="age" name="age" type="text" placeholder="nhập tuổi" required>

    <label for="phone">số điện thoại</label>
    <input id="phone" name="phone" type="text" placeholder="nhập số điện thoại" required>


    <button type="submit">Cập Nhật</button>
</form>
</body>
</html>
