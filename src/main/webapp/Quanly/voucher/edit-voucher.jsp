<%@page import="model.Voucher"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Voucher</title>
    <style>
        
            /* Style chung cho trang */
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-color: #f4f4f4;
            }

            nav {
                background-color: #ccc;
                padding: 10px;
                color: white;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            nav .logo {
                font-size: 24px;
                font-weight: bold;
            }
            nav ul {
                list-style: none;
                margin: 0;
                padding: 0;
                display: flex;
            }
            nav ul li {
                margin-left: 20px;
            }
            nav ul li a {
                color: white;
                text-decoration: none;
                font-size: 16px;
            }

            /* Tiêu ?? c?a trang */
            h1 {
                margin-top: 20px;
                height: 25vh;
                display: flex;
                justify-content: flex-start;
                align-items: center;
                font-size: 2.5em;
            }

            /* Form ch?nh s?a phim */
            form div {
                margin-bottom: 15px;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            input[type="text"], input[type="number"] {
                width: 100%;
                padding: 8px;
                border-radius: 5px;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            input[type="checkbox"] {
                width: 20px;
                height: 20px;
            }

            .button {
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
                display: inline-block;
            }

            .back-button {
                background-color: #666; /* N?n xám cho nút quay l?i */
                color: white; /* Ch? màu tr?ng */
            }

            .edit-button {
                background-color: #007bff; /* N?n xanh cho nút s?a */
                color: white; /* Ch? màu tr?ng */
            }

            .edit-button:hover {
                background-color: #0056b3;
            }

            .back-button:hover {
                background-color: #444;
            }

            .error {
                color: red;
            }
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

    <h1>Edit Voucher</h1>

    <p style="color: red;">
        <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
    </p>

    <form method="post" action="/Quanly/voucher/EditVoucher">
        <input type="hidden" name="id" value="<%= request.getAttribute("voucher") != null ? ((Voucher) request.getAttribute("voucher")).getId() : "" %>">
        <div>
            <label for="name">Voucher Name</label>
            <input type="text" id="name" name="name" required value="<%= request.getAttribute("voucher") != null ? ((Voucher) request.getAttribute("voucher")).getName() : "" %>">
        </div>
        <div>
            <label for="discount">Discount (%)</label>
            <input type="number" id="discount" name="discount" required min="0" max="100" 
                   value="<%= request.getAttribute("voucher") != null ? ((Voucher) request.getAttribute("voucher")).getGiamGia(): "" %>">
        </div>
        <div>
            <label for="expiry_date">Expiry Date</label>
            <input type="date" id="expiry_date" name="expiry_date" required value="<%= request.getAttribute("voucher") != null ? ((Voucher) request.getAttribute("voucher")).getNgayHetHan().toString() : "" %>">
        </div>
        <div>
            <!-- Nút trở về danh sách voucher -->
            <button type="button" onclick="window.location.href='<%= request.getContextPath() %>/Quanly/voucher/ListVoucher'" id="back">Back</button>
            <button type="submit" id="submit">Save Changes</button>
        </div>
    </form>
</body>
</html>
