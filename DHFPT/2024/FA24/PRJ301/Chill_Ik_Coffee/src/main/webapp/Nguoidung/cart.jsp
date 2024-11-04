<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gio hang</title>
</head>
<body>
    <h1>Gio hang cua ban</h1>
    <c:if test="${empty cartItems}">
        <p>Gio hang cua ban dang trong. Vui long chon nuoc ban muon</p>
    </c:if>
    <c:if test="${not empty cartItems}">
        <table>
            <thead>
                <tr>
                    <th>Ten san pham</th>
                    <th>So luong</th>
                    <th>Gia</th> <!-- New column for price -->
                    <th>Tong gia</th> <!-- New column for total price -->
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${cartItems}" var="item">
                    <tr>
                        <td>${item.productName}</td>
                        <td>${item.quantity}</td>
                        <td>${item.price}</td> <!-- Display price -->
                        <td>${item.totalPrice}</td> <!-- Display total price -->
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <a href="<c:url value='/Menu'/>">Tiep tuc mua sam</a>
    <a href="<c:url value='/checkout'/>">Thanh Toan</a>
    
</body>
</html>
