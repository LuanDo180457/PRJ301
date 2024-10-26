<%-- 
    Document   : create-voucher
    Created on : Oct 26, 2024, 9:21:38 AM
    Author     : Vo Truong Qui - CE181170
--%>

<%-- 
    Document   : create-voucher
    Created on : Oct 26, 2024, 9:21:38 AM
    Author     : Vo Truong Qui - CE181170
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create New Voucher</title>
    <style>
        /* Thêm các kiểu CSS nếu cần */
    </style>
</head>
<body>
    <nav>
        <div class="logo">Voucher Management</div>
        <ul>
            <li><a href="vouchers.jsp">Vouchers</a></li>
            <li>
                <span>Hi, <%= request.getSession().getAttribute("user") %>, </span> 
                <a href="${pageContext.request.contextPath}/Logout">Logout</a>
            </li>
        </ul>
    </nav>

    <h1>Create New Voucher</h1>

    <p style="color: red;">
        <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
    </p>

    <form method="post" action="CreateVoucher">
        <div>
            <label for="name">Voucher Name</label>
            <input type="text" id="name" name="name" required placeholder="Enter voucher name">
        </div>
        <div>
            <label for="discount">Discount (%)</label>
            <input type="number" id="discount" name="discount" required min="0" max="100" 
                   placeholder="Enter discount percentage">
        </div>
        <div>
            <label for="expiry_date">Expiry Date</label>
            <input type="date" id="expiry_date" name="expiry_date" required>
        </div>
        <div>
            <!-- Nút trở về danh sách voucher -->
            <button type="button" onclick="window.location.href='<%= request.getContextPath() %>/Quanly/voucher/ListVoucher'" id="back">Back</button>
            <button type="submit" id="submit">Create</button>
        </div>
    </form>
</body>
</html>