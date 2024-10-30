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
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
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
            h1 {
                text-align: center;
                color: #333;
            }
            form {
                max-width: 600px;
                margin: 20px auto;
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            div {
                margin-bottom: 15px;
            }
            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }
            input[type="text"],
            input[type="number"]
            {
                width: calc(100% - 20px);
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            button {
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                background-color: #5cb85c;
                color: white;
                cursor: pointer;
            }
            button[type="button"] {
                background-color: #007bff;
            }
            button:hover {
                opacity: 0.8;
            }
            p {
                text-align: center;
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
                    <span>Hi, <%= request.getSession().getAttribute("user")%>, </span> 
                    <a href="${pageContext.request.contextPath}/Logout">Logout</a>
                </li>
            </ul>
        </nav>
        <h1>Create New Voucher</h1>
        <p style="color: red;">
            <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : ""%>
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
                <button type="button" onclick="window.location.href = '<%= request.getContextPath()%>/Quanly/voucher/ListVoucher'" id="back">Back</button>
                <button type="submit" id="submit">Create</button>
            </div>
        </form>
    </body>
</html>