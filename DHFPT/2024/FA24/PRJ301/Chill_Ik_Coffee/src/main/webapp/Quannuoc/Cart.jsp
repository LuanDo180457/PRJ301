<!-- Cart.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Cart</title>
</head>
<body>
    <h1>Your Shopping Cart</h1>
    <table border="1">
        <tr>
            <th>Product ID</th>
            <th>Quantity</th>
            <th>Action</th>
        </tr>
        <c:forEach var="item" items="${cartItems}">
            <tr>
                <td>${item.productId}</td>
                <td>${item.quantity}</td>
                <td>
                    <form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="productId" value="${item.productId}"/>
                        <input type="submit" value="Remove" formaction="${pageContext.request.contextPath}/cart" 
                               onclick="this.form.method='delete'"/>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <form action="${pageContext.request.contextPath}/purchase" method="post">
        <input type="submit" value="Checkout"/>
    </form>
    <c:if test="${not empty sessionScope.mess}">
        <div>${sessionScope.mess}</div>
    </c:if>
</body>
</html>
