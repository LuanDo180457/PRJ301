<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Thanh Toan</title>
        <script>
            function updateTotal() {
                const voucherSelect = document.getElementById("voucherId");
                const totalPrice = parseFloat('${totalPrice}');
                const discounts = [
            <c:forEach var="voucher" items="${vouchers}">
                    {id: ${voucher.id}, giamGia: ${voucher.giamGia}},
            </c:forEach>
                ];

                let selectedDiscount = 0;
                const selectedVoucherId = parseInt(voucherSelect.value);

                discounts.forEach(voucher => {
                    if (voucher.id === selectedVoucherId) {
                        selectedDiscount = voucher.giamGia;
                    }
                });

                const discountAmount = totalPrice * (selectedDiscount / 100);
                const totalAfterDiscount = totalPrice - discountAmount;

                document.getElementById("discountAmount").innerText = discountAmount.toFixed(2) + " VND";
                document.getElementById("finalAmount").innerText = totalAfterDiscount.toFixed(2) + " VND";

                // C?p nh?t các tr??ng ?n ?? g?i t?i server
                document.getElementById("hiddenDiscountAmount").value = discountAmount.toFixed(2);
                document.getElementById("hiddenFinalAmount").value = totalAfterDiscount.toFixed(2);
            }

            window.onload = function () {
                // C?p nh?t t?ng giá khi t?i trang
                updateTotal();
            };
        </script>
    </head>
    <body>
        <h1>Thanh Toan</h1>

        <c:if test="${not empty cartItems}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Ten San Pham</th>
                        <th>So Luong</th>
                        <th>Gia</th>
                        <th>Tong Gia</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${cartItems}" var="item">
                        <tr>
                            <td>${item.productName}</td>
                            <td>${item.quantity}</td>
                            <td>${item.price} VND</td>
                            <td>${item.totalPrice} VND</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <form action="${pageContext.request.contextPath}/checkout" method="post">
                <!-- Voucher Selection -->
                <label for="voucherId">Select Voucher:</label>
                <select name="voucherId" id="voucherId" onchange="updateTotal()">
                    <option value="0">Don't Use Voucher</option>
                    <c:forEach items="${vouchers}" var="voucher">
                        <option value="${voucher.id}">
                            ${voucher.name} - Giam ${voucher.giamGia}%
                        </option>
                    </c:forEach>
                </select>

                <!-- Address and Phone Number -->
                <br/><br/>
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required />
                <br/><br/>
                <label for="phone">Phone Number:</label>
                <input type="text" id="phone" name="phone" required />
                <br/><br/>

                <!-- Calculated Totals -->
                <p>Tong Gia: ${totalPrice} VND</p>
                <p>Giam Gia: <span id="discountAmount">0 VND</span></p>
                <p>Tong Gia Sau Giam: <span id="finalAmount">${totalPrice} VND</span></p>

                <!-- Hidden Fields for Discount and Final Amount -->
                <input type="hidden" name="totalAmount" value="${totalPrice}" />
                <input type="hidden" name="discountAmount" id="hiddenDiscountAmount" value="0" />
                <input type="hidden" name="finalAmount" id="hiddenFinalAmount" value="${totalPrice}" />

                <br/><br/>

                <!-- Submit Button -->
                <button type="submit" name="action" value="confirmPayment">Xac Nhan Thanh Toan</button>
            </form>
        </c:if>

        <a href="<c:url value='/Menu'/>">Tiep Tuc Mua Sam</a>
    </body>
</html>
