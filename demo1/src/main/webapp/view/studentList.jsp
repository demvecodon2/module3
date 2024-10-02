<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách học sinh</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <h1>Danh sách học sinh lớp ${nameClass}</h1>

    <form action="/students" method="get" class="mb-3">
        <input type="hidden" name="action" value="search" />
        <div class="input-group">
            <input type="text" name="name" class="form-control" placeholder="Tìm kiếm theo tên">
            <input type="text" name="phone" class="form-control" placeholder="Tìm kiếm theo số điện thoại">
            <button class="btn btn-outline-secondary" type="submit">Tìm</button>
        </div>
    </form>

    <button class="btn btn-primary mb-3" onclick="window.location.href='/students?action=create'">Thêm mới</button>

    <table class="table table-hover">
        <thead>
        <tr>
            <th>STT</th>
            <th>ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>Age</th>
            <th>Phone</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${students}" var="student" varStatus="temp">
            <tr>
                <td>${temp.index + 1}</td>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.address}</td>
                <td>${student.age}</td>
                <td>${student.phone}</td>
                <td>
                    <button class="btn btn-warning" onclick="openEditModal(${student.id}, '${student.name}', '${student.address}', '${student.age}', '${student.phone}')">
                        Sửa
                    </button>
                    <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal${student.id}">
                        Xóa
                    </button>

                    <div class="modal fade" id="deleteModal${student.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Xóa học sinh</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Bạn có muốn xóa học sinh tên là <strong>${student.name}</strong> hay không?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                    <form action="/students?action=delete&id=${student.id}" method="post">
                                        <button type="submit" class="btn btn-danger">Xác nhận</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="modal fade" id="studentModal" tabindex="-1" aria-labelledby="studentModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="studentModalLabel">Thông tin học sinh</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/students" method="post" id="studentForm">
                        <input type="hidden" name="action" value="save" />
                        <input type="hidden" name="id" id="studentId" value="" />
                        <div class="mb-3">
                            <label for="studentName" class="form-label">Tên:</label>
                            <input type="text" class="form-control" id="studentName" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="studentAddress" class="form-label">Địa chỉ:</label>
                            <input type="text" class="form-control" id="studentAddress" name="address" required>
                        </div>
                        <div class="mb-3">
                            <label for="studentAge" class="form-label">Tuổi:</label>
                            <input type="text" class="form-control" id="studentAge" name="age" required>
                        </div>
                        <div class="mb-3">
                            <label for="studentPhone" class="form-label">Số điện thoại:</label>
                            <input type="text" class="form-control" id="studentPhone" name="phone" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Lưu</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function openEditModal(id, name, address, age, phone) {
            document.getElementById('studentId').value = id;
            document.getElementById('studentName').value = name;
            document.getElementById('studentAddress').value = address;
            document.getElementById('studentAge').value = age;
            document.getElementById('studentPhone').value = phone;
            document.getElementById('studentModalLabel').innerText = "Cập nhật học sinh";
            const modal = new bootstrap.Modal(document.getElementById('studentModal'));
            modal.show();
        }
    </script>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
