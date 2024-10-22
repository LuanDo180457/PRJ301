<%-- 
    Document   : Login
    Created on : Oct 19, 2024, 3:47:11 PM
    Author     : Do Van Luan - CE180457
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Arial', sans-serif;
            }

            body {
                background-color: #f0f0f5;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                flex-direction: column;
            }

            .login-container {
                background-color: #fff;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                width: 320px;
                text-align: center;
            }

            h2 {
                margin-bottom: 20px;
                font-size: 24px;
                color: #333;
            }

            .input-group {
                margin-bottom: 20px;
                text-align: left;
            }

            .input-group label {
                display: block;
                margin-bottom: 5px;
                color: #333;
            }

            .input-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 16px;
            }

            .button-group {
                display: flex;
                justify-content: space-between;
            }

            .btn {
                width: 48%;
                padding: 10px;
                font-size: 16px;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-align: center;
                transition: background-color 0.3s ease;
                text-decoration: none;
                display: inline-block;
            }

            .user-btn {
                background-color: #4CAF50;
            }

            .staff-btn {
                background-color: #2196F3;
            }

            .btn:hover {
                opacity: 0.9;
            }

        </style>
    </head>
    <body>
        <div class="login-container">
            <h2>Login</h2>
            <div class="button-group">
                <a href="user.jsp" class="btn user-btn">Login với vai trò Khách hàng</a>
                <a href="Login_Nhanvien.jsp" class="btn staff-btn">Login với vai trò Nhân sự</a>
            </div>
        </div>
    </body>
</html>