<%-- 
    Document   : list-voucher
    Created on : Oct 26, 2024, 9:07:08 AM
    Author     : Vo Truong Qui - CE181170
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            .back-button {
                background-color: green;
                color: #fff;
                font-size: 1.2em;
                padding: 10px 10px;
                margin: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                display: inline-block;
            }
            .back-button:hover {
                background-color: #333;
            }
            .button-container {
                text-align: right;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <h1 class="text-center">Voucher List</h1>
        <a href="${pageContext.request.contextPath}/Quanly/voucher/CreateVoucher" class="btn btn-success mb-3">Create new voucher</a>

        <div class="button-container">
            <a href="${pageContext.request.contextPath}/Quannuoc/" class="back-button">Back</a>
        </div>

        <table class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th>ID</th>
                    <th>Voucher Name</th>
                    <th>Discount (%)</th>
                    <th>Expiration date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty vouchers}">
                        <c:forEach var="voucher" items="${vouchers}">
                            <tr>
                                <td>${voucher.id}</td>
                                <td>${voucher.name}</td>
                                <td>${voucher.giamGia}</td>
                                <td>${voucher.ngayHetHan}</td>
                                <td>${voucher.trangThai ? "Active" : "Inactive"}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/Quanly/voucher/EditVoucher?id=${voucher.id}" class="btn btn-primary">Edit</a>
                                    <a href="${pageContext.request.contextPath}/Quanly/voucher/DeleteVoucher?id=${voucher.id}" class="btn btn-danger">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="6" class="text-center">Không có voucher nào.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>