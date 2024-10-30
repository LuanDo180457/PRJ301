<%-- 
    Document   : doanhthu
    Created on : Oct 30, 2024, 2:45:32 PM
    Author     : Vo Truong Qui - CE181170
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.DoanhThu" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doanh thu</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
    <style>
        .header-title {
            color: green; /* Màu xanh lá cho tiêu đề */
            text-align: center; /* Căn giữa tiêu đề */
            font-size: 2.5rem; /* Kích thước chữ lớn hơn */
            margin-bottom: 20px; /* Khoảng cách dưới tiêu đề */
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h1 class="header-title">Doanh thu mặt hàng</h1>

        <!-- Doanh thu theo ngày -->
        <div class="d-flex justify-content-between align-items-center">
            <h2>Doanh thu theo ngày</h2>
            <a href="your_back_link.jsp" class="btn btn-primary">Back</a>
        </div>
        
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Tên món nước</th>
                    <th>Ngày</th>
                    <th>Doanh thu</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="doanhThuTheoNgay" value="${requestScope.doanhThuTheoNgay}" />
                <c:forEach var="dt" items="${doanhThuTheoNgay}">
                    <tr>
                        <td>${dt.tenMonNuoc}</td>
                        <td>${dt.thoiGian}</td>
                        <td>${dt.doanhThu}</td>
                    </tr>
                </c:forEach>
                <tr class="font-weight-bold">
                    <td colspan="2">Tổng doanh thu theo ngày</td>
                    <td>
                        <c:set var="totalDoanhThuNgay" value="0.0" />
                        <c:forEach var="dt" items="${doanhThuTheoNgay}">
                            <c:set var="totalDoanhThuNgay" value="${totalDoanhThuNgay + dt.doanhThu}" />
                        </c:forEach>
                        ${totalDoanhThuNgay}
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- Doanh thu theo tuần -->
        <h2>Doanh thu theo tuần</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Tên món nước</th>
                    <th>Tuần</th>
                    <th>Doanh thu</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="doanhThuTheoTuan" value="${requestScope.doanhThuTheoTuan}" />
                <c:forEach var="dt" items="${doanhThuTheoTuan}">
                    <tr>
                        <td>${dt.tenMonNuoc}</td>
                        <td>${dt.thoiGian}</td>
                        <td>${dt.doanhThu}</td>
                    </tr>
                </c:forEach>
                <tr class="font-weight-bold">
                    <td colspan="2">Tổng doanh thu theo tuần</td>
                    <td>
                        <c:set var="totalDoanhThuTuan" value="0.0" />
                        <c:forEach var="dt" items="${doanhThuTheoTuan}">
                            <c:set var="totalDoanhThuTuan" value="${totalDoanhThuTuan + dt.doanhThu}" />
                        </c:forEach>
                        ${totalDoanhThuTuan}
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- Doanh thu theo tháng -->
        <h2>Doanh thu theo tháng</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Tên món nước</th>
                    <th>Tháng</th>
                    <th>Doanh thu</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="doanhThuTheoThang" value="${requestScope.doanhThuTheoThang}" />
                <c:forEach var="dt" items="${doanhThuTheoThang}">
                    <tr>
                        <td>${dt.tenMonNuoc}</td>
                        <td>${dt.thoiGian}</td>
                        <td>${dt.doanhThu}</td>
                    </tr>
                </c:forEach>
                <tr class="font-weight-bold">
                    <td colspan="2">Tổng doanh thu theo tháng</td>
                    <td>
                        <c:set var="totalDoanhThuThang" value="0.0" />
                        <c:forEach var="dt" items="${doanhThuTheoThang}">
                            <c:set var="totalDoanhThuThang" value="${totalDoanhThuThang + dt.doanhThu}" />
                        </c:forEach>
                        ${totalDoanhThuThang}
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
