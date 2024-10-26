<%-- 
    Document   : list-voucher
    Created on : Oct 26, 2024, 9:07:08 AM
    Author     : Vo Truong Qui - CE181170
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Voucher"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh Sách Voucher</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f9f9f9;
        }
        tr:nth-child(odd) {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #ffffff;
        }
        .btn {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <h1>Danh Sách Voucher</h1>

    <a href="<%= request.getContextPath() %>/Quanly/voucher/CreateVoucher" class="btn btn-success">Tạo Voucher Mới</a>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên Voucher</th>
                <th>Giảm Giá (%)</th>
                <th>Ngày Hết Hạn</th>
                <th>Trạng Thái</th>
                <th>Actions</th> <!-- Cột Actions mới -->
            </tr>
        </thead>
        <tbody>
            <% 
                // Lấy danh sách voucher từ thuộc tính request
                ArrayList<Voucher> vouchers = (ArrayList<Voucher>) request.getAttribute("vouchers");
                // Kiểm tra nếu danh sách không rỗng
                if (vouchers != null && !vouchers.isEmpty()) {
                    for (Voucher voucher : vouchers) {
            %>
                <tr>
                    <td><%= voucher.getId() %></td>
                    <td><%= voucher.getName() %></td>
                    <td><%= voucher.getGiamGia() %></td>
                    <td><%= voucher.getNgayHetHan() %></td>
                    <td><%= voucher.isTrangThai() ? "Active" : "Inactive" %></td>
                    <td>
                        <a href="<%= request.getContextPath() %>/Quanly/voucher/EditVoucher?id=<%= voucher.getId() %>" class="btn btn-primary" aria-label="Edit voucher <%= voucher.getName() %>">Edit</a>
                        <a href="<%= request.getContextPath() %>/Quanly/voucher/DeleteVoucher?id=<%= voucher.getId() %>" class="btn btn-danger" aria-label="Delete voucher <%= voucher.getName() %>">Delete</a>
                    </td>
                </tr>
            <% 
                    }
                } else {
            %>
                <tr>
                    <td colspan="6" class="text-center">Không có voucher nào.</td>
                </tr>
            <% 
                }
            %>
        </tbody>
    </table>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>