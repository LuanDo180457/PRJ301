<%-- 
    Document   : menu
    Created on : Oct 28, 2024, 11:34:26 PM
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
                height: 100%;
                overflow-x: hidden;
            }
            body {
                font-family: Arial, sans-serif;
                background-image: url('../image/backgroup1.png');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
            }
            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px;
                background-color: cornsilk;
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
            .menu-info {
                padding: 10px;
            }
            footer {
                background-color: cornsilk;
                text-align: center;
                padding: 10px 0;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <img src="../image/Chill_Ik_Coffee_logo.jpg" alt="Chill Ik Coffee Logo">
            <h1>Chill Ik Coffee</h1>
            <a href="<c:url value='/cart' />">Giỏ hàng</a>
            <a href="<c:url value='/purchase' />">Mua hàng</a>
            <div class="navbar">
                <a href="#">Trang chủ</a>
                <div class="dropdown">
                    <c:if test="${empty sessionScope.user}">
                        <a href="<c:url value='/Menu' />">Menu</a>
                        <a href="${pageContext.request.contextPath}/Quannuoc/Login.jsp">Đăng nhập</a>
                        <a href="DK_taikhoan.jsp">Đăng ký</a>
                    </c:if>
                    <c:if test="${not empty sessionScope.user}">
                        <a href="<c:url value='/Logout' />">Thoát</a>
                    </c:if>
                </div>
            </div>
        </div>

        <div class="menu-container">
            <c:if test="${empty drinks}">
                <p>Không có sản phẩm nào trong menu.</p>
            </c:if>
            <c:forEach items="${drinks}" var="d">
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

                        <!-- Add a form for each drink -->
                        <form action="${pageContext.request.contextPath}/cart" method="post">
                            <input type="hidden" name="productId" value="${product.id}" />
                            <label for="quantity">Quantity:</label>
                            <input type="number" name="quantity" min="1" value="1" required />
                            <button type="submit">Add to Cart</button>
                        </form>

                    </div>
                </div>
            </c:forEach>
        </div>

        <footer>
            <p>Địa chỉ: Đại học FPT Cần Thơ | Số điện thoại: 0584428016</p>
        </footer>

        <script>
            function incrementQuantity(button) {
                const input = button.previousElementSibling; // Get the quantity input
                let value = parseInt(input.value);
                input.value = value + 1; // Increment the quantity
            }

            function decrementQuantity(button) {
                const input = button.nextElementSibling; // Get the quantity input
                let value = parseInt(input.value);
                if (value > 1) { // Ensure quantity does not go below 1
                    input.value = value - 1; // Decrement the quantity
                }
            }
        </script>
    </body>
</html>
