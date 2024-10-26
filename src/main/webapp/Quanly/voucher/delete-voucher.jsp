<%-- 
    Document   : delete-voucher
    Created on : Oct 26, 2024, 9:58:53 AM
    Author     : Vo Truong Qui - CE181170
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Delete Voucher</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-color: #f4f4f4;
            }

            h1 {
                font-size: 2em;
                margin-bottom: 20px;
            }

            .error {
                color: red;
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
                background-color: #666;
                color: white;
            }

            .delete-button {
                background-color: #dc3545;
                color: white;
            }

            .delete-button:hover {
                background-color: #c82333;
            }

            .back-button:hover {
                background-color: #444;
            }
        </style>
    </head>
    <body>
        <h1>Delete Voucher</h1>

        <c:if test="${not empty selectedVoucher}">
            <p>Are you sure you want to delete the voucher <b>${selectedVoucher.name}</b> with ID <b>${selectedVoucher.id}</b>?</p>
            <form method="post" action="DeleteVoucher">
                <input type="hidden" name="id" value="${selectedVoucher.id}"/>
                <a href="<c:url value='/Quanly/voucher/ListVoucher'/>" id="back" class="button back-button">Back</a>
                <input id="submit" type="submit" value="Delete" class="button delete-button"/>
            </form>
        </c:if>

        <c:if test="${empty selectedVoucher}">
            <p>No voucher selected for deletion.</p>
            <a href="<c:url value='/Quanly/voucher/ListVoucher'/>" class="button back-button">Back to List</a>
        </c:if>
    </body>
</html>
