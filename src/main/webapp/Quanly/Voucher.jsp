<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Danh sách mã giảm giá</title>
</head>
<body>
    <h1>Danh sách mã giảm giá</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên mã</th>
                <th>Giảm giá</th>
                <th>Ngày hết hạn</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="voucher" items="${vouchers}">
                <tr>
                    <td>${voucher.id}</td>
                    <td>${voucher.name}</td>
                    <td>${voucher.giamGia}</td>
                    <td>${voucher.ngayHetHan}</td>
                    <td>${voucher.trangThai}</td>
                    <td>
                        <form action="manage-voucher" method="post">
                            <input type="hidden" name="id" value="${voucher.id}">
                            <input type="submit" name="action" value="delete">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
