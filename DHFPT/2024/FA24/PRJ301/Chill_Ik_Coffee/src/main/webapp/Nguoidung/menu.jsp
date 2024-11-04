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
            <h1>Chill Ik Coffee</h1>
            <a href="<c:url value='/cart' />">Gio Hang</a>
        </div>

        <div class="menu-container">
            <c:if test="${empty drinks}">
                <p>There are no products in the menu.</p>
            </c:if>
            <c:forEach items="${drinks}" var="d">
                <div class="menu-item">
                    <h3>${d.name}</h3>
                    <p>Price: ${d.gia} VND</p>
                    <form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="productId" value="${d.id}" />
                        <label for="quantity">Quantity</label>
                        <input type="number" name="quantity" min="1" value="1" required />
                        <button type="submit">Add to cart</button>
                    </form>
                </div>
            </c:forEach>
        </div>

        <footer>
            <p>Địa chỉ: Đại học FPT Cần Thơ | Số điện thoại: 0584428016</p>
        </footer>
    </body>
</html>