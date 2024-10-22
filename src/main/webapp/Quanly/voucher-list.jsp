<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Voucher" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý mã giảm giá</title>
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
        <%
            List<Voucher> vouchers = (List<Voucher>) request.getAttribute("vouchers");
            if (vouchers != null && !vouchers.isEmpty()) {
                for (Voucher voucher : vouchers) {
        %>
        <tr>
            <td><%= voucher.getId() %></td>
            <td><%= voucher.getName() %></td>
            <td><%= voucher.getGiamGia() %></td>
            <td><%= voucher.getNgayHetHan() %></td>
            <td><%= voucher.getTrangThai() %></td>
            <td>
                <a href="edit-voucher.jsp?id=<%= voucher.getId() %>">Sửa</a>
                <form action="manage-voucher" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= voucher.getId() %>">
                    <input type="submit" value="Xóa">
                </form>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="6">Không có mã giảm giá nào.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <h2>Thêm mã giảm giá mới</h2>
    <form action="manage-voucher" method="post">
        <input type="hidden" name="action" value="add">
        <label>Tên mã:</label>
        <input type="text" name="name" required>
        <label>Giảm giá:</label>
        <input type="number" step="0.01" name="giam_gia" required>
        <label>Ngày hết hạn:</label>
        <input type="date" name="ngay_het_han" required>
        <label>Trạng thái:</label>
        <input type="number" name="trang_thai" required>
        <input type="submit" value="Thêm">
    </form>
</body>
</html>
