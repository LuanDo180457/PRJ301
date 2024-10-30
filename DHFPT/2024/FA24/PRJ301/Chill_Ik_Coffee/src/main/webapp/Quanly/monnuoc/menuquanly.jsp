<%-- 
    Document   : menuquanly
    Created on : Oct 30, 2024, 2:45:49 PM
    Author     : Nguyen Ngoc Phat - CE180321
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Drink"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DrinkDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chill Ik Coffee</title>
        <style>
            html, body {
                margin: 0;
                padding: 0;
                height: 100%; /* Đảm bảo trang chiếm hết chiều cao */
                overflow-x: hidden; /* Ẩn thanh trượt ngang nếu có */
            }

            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-image: url('../image/backgroup1.png');
                background-size: cover;
                background-position: center;
                background-attachment: fixed; /* Giữ cố định nền khi cuộn */
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px;
                background-color: cornsilk;
                max-width: 100%;
                box-sizing: border-box;
            }

            .header img {
                height: 10vh;
                margin-left: 20px;
            }

            .navbar {
                position: relative;
                display: inline-block;
            }

            .navbar a {
                text-decoration: none;
                font-weight: bold;
                color: #333;
                padding: 10px 20px;
                display: inline-block;
                text-align: center;
            }

            .navbar .dropdown {
                display: none;
                position: absolute;
                background-color: cornsilk;
                min-width: 120px;
                box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
                z-index: 1;
                max-width: 100%; /* Giới hạn chiều rộng của menu */
                overflow: hidden; /* Đảm bảo menu không tràn */
                box-sizing: border-box;
            }

            .navbar .dropdown a {
                display: block;
                padding: 8px 10px;
                text-decoration: none;
                color: #333;
            }

            .navbar:hover .dropdown {
                display: block;
            }

            .dropdown a:hover {
                background-color: #f1f1f1;
            }

            .slideshow-container {
                position: relative;
                max-width: 90%; /* Giới hạn chiều rộng của slideshow */
                margin: auto;
                margin-top: 20px;
                box-sizing: border-box;
            }

            .mySlides img {
                width: 100%;
                height: auto;
                max-height: 400px; /* Giới hạn chiều cao của hình ảnh */
                object-fit: cover;
            }

            .main-content {
                text-align: center;
                margin: 20px;
                background-color: rgba(255, 255, 255, 0.9);
                padding: 20px;
            }

            /* Dots/Pagination */
            .dot-container {
                text-align: center;
                padding: 20px;
            }

            .dot {
                height: 15px;
                width: 15px;
                margin: 0 5px;
                background-color: #bbb;
                border-radius: 50%;
                display: inline-block;
                transition: background-color 0.6s ease;
            }

            .active {
                background-color: #717171;
            }

            /* Responsive adjustments */
            @media screen and (max-width: 768px) {
                .header img {
                    height: 8vh;
                }

                .nav a {
                    font-size: 14px;
                }
            }

            @media screen and (max-width: 480px) {
                .header {
                    flex-direction: column;
                    align-items: center;
                }

                .nav {
                    flex-direction: column;
                    align-items: center;
                }

                .nav a {
                    margin: 5px 0;
                }
            }

            /* Footer styles */
            footer {
                background-color: cornsilk; /* Màu nền cho footer */
                text-align: center; /* Căn giữa nội dung */
                padding: 10px 0; /* Khoảng cách bên trên và dưới */
                position: relative; /* Để footer không bị ảnh hưởng bởi các phần khác */
                bottom: 0; /* Đặt footer ở dưới cùng */
                width: 100%; /* Đảm bảo footer chiếm toàn bộ chiều rộng */
            }

            .menu-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 1.5rem;
                padding: 20px;
            }

            .menu-item {
                width: 200px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                overflow: hidden;
                text-align: center;
            }

            .menu-item img {
                width: 100%;
                height: auto;
            }

            .menu-info {
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <img src="../image/Chill_Ik_Coffee_logo.jpg" alt="Chill Ik Coffee Logo">
            <h1>Chill Ik Coffee</h1>
            <div class="navbar">
                <a href="#">Trang chủ</a>
                <div class="dropdown">
                    <c:if test="${empty sessionScope.user}">
                        <a href="<c:url value='/Menu' />">Menu</a>
                        <a href="${pageContext.request.contextPath}/Quannuoc/Login.jsp">Đăng nhập</a>
                        <a href="DK_taikhoan.jsp">Đăng ký</a>
                    </c:if>
                    <c:if test="${not empty sessionScope.user}">
                        <a href="<c:url value="/Logout" />">Thoát</a>
                    </c:if>
                </div>
            </div>
        </div>

        <div class="menu-container">
            <c:if test="${empty drinks}">
                <p>Không có sản phẩm nào trong menu.</p>
            </c:if>
            <c:forEach items="${drinks}" var="d" >
                <div class="menu-item">
                    <div class="menu-info">
                        <h3>${d.name}</h3>
                        <p>Giá: ${d.gia} VND</p>
                        <p>Trạng thái: 
                            <c:choose>
                                <c:when test="${d.trangthai}">Còn</c:when>
                                <c:otherwise>Hết</c:otherwise>
                            </c:choose>
                        </p>
                        <a href="<c:url value="/Edit" />?id=${m.id}" class="btn btn-secondary">Edit</a>
                        <a href="<c:url value="/Delete" />?id=${m.id}" class="btn btn-danger">Delete</a>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="main-content">
            <div class="voucher">
                <h2>Special Vouchers</h2>
                <img src="../image/voucher.jpg" alt="Voucher" width="300px">
                <img src="../image/voucher.jpg" alt="Voucher" width="300px">
                <img src="../image/voucher.jpg" alt="Voucher" width="300px">
            </div>
        </div>

        <footer>
            <p>Địa chỉ: Đại học FPT Cần Thơ | Số điện thoại: 0584428016</p>
        </footer>

        <script>
            let slideIndex = 0;
            showSlides();

            function showSlides() {
                let i;
                let slides = document.getElementsByClassName("mySlides");
                let dots = document.getElementsByClassName("dot");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) {
                    slideIndex = 1;
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
                setTimeout(showSlides, 3000); // Change image every 3 seconds
            }

            function currentSlide(n) {
                let i;
                let slides = document.getElementsByClassName("mySlides");
                let dots = document.getElementsByClassName("dot");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[n - 1].style.display = "block";
                dots[n - 1].className += " active";
                slideIndex = n; // Set the slideIndex to the current slide
            }
        </script>
    </body>
</html>