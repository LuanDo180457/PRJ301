<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.TaiKhoan" %>
<%@ page import="DAO.TaiKhoanDAO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Account</title>
        <style>
            /* Định dạng cho nút Back */
            #back {
                background-color: gray;
                color: white;
                padding: 5px 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
            }

            #back:hover {
                background-color: darkgray;
            }

            /* Định dạng cho nút Delete */
            #submit {
                background-color: red;
                color: white;
                padding: 5px 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            #submit:hover {
                background-color: darkred;
            }

            /* Định dạng cho khối chứa văn bản xác nhận */
            .m_title {
                margin-bottom: 20px;
            }

            h1 {
                padding-top: 20px;
                margin-left: 18px;
                text-align: left;
                color: gray;
            }

            body {
                padding-top: 70px;
            }

            .ma p {
                margin-left: 18px;
                color: gray;
            }

            .nut {
                display: flex;
                margin-left: 18px;
                gap: 10px;
            }

            p.error-message {
                color: red;
                font-weight: bold;
            }
        </style>
    </head>
    <body>

        <h1>Delete Account</h1>

        <c:if test="${not empty errorMessage}">
            <p class="error-message">${errorMessage}</p>
        </c:if>

        <c:choose>
            <c:when test="${not empty taiKhoan}">
                <form action="<c:url value='/QuanliTaiKhoan'/>" method="post">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="${taiKhoan.id}"> <!-- Thêm ID ở đây -->

                    <div class="ma">
                        <p>Are you sure you want to delete 
                            <b class="m_title">${taiKhoan.username}</b> 
                            with ID 
                            <b class="m_id">${taiKhoan.id}</b>?</p>
                    </div>
                    <div class="nut">
                        <a href="<c:url value='/QuanliTaiKhoan' />" id="back">Back</a>
                        <button type="submit" id="submit">Delete</button>
                    </div>
                </form>
            </c:when>
            <c:otherwise>
                <p>No account selected for deletion.</p>
            </c:otherwise>
        </c:choose>
    </body>
</html>