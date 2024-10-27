<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="model.TaiKhoan"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.TaiKhoanDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> List</title>
        <style>
            table {
                width: 98%;
                border-collapse: collapse;
                margin: 10px auto;
            }
            th, td {
                padding: 10px;
                text-align: center;
                border-bottom: 1px solid #ddd;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:nth-child(odd) {
                background-color: #e9e9e9;
            }
            .rented-checkbox {
                width: 20px;
                height: 20px;
                cursor: pointer;
            }
            h1 {
                margin-left: 20px;
                margin-top: 20px;
                font-size: 2.5em;
                color: gray;
            }
            a.btn-success {
                display: block;
                text-align: center;
                width: 100px;
                text-decoration: none;
                background-color: #28a745;
                color: white;
                padding: 10px 0;
                border-radius: 5px;
                margin-left: auto;
                margin-right: 20px;
            }
            a.btn-success:hover {
                background-color: #218838;
            }
            a.btn-secondary, a.btn-danger {
                color: white;
                padding: 5px 10px;
                border-radius: 5px;
                text-decoration: none;
            }
            a.btn-secondary { background-color: #007bff; }
            a.btn-secondary:hover { background-color: #0056b3; }
            a.btn-danger { background-color: #dc3545; }
            a.btn-danger:hover { background-color: #c82333; }
            nav {
                background-color: thistle;
                padding: 10px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1000;
                transition: top 0.1s;
            }
            nav .logo { font-size: 1.8em; font-weight: bold; color: white; }
            nav ul { list-style: none; display: flex; }
            nav ul li a { color: whitesmoke; padding: 8px 15px; border-radius: 5px; }
            nav ul li span { color: white; }
            body { padding-top: 70px; }
        </style>
    </head>
    <body>
        <nav>
            <div class="logo">Danh sách tài khoản</div>
            <ul>
                <li><a href="<c:url value='${pageContext.request.contextPath}/trangchu' />">Trang chủ</a></li>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <li><span>Xin chào, ${sessionScope.user.username}, </span> <a href="<c:url value='/Logout'/>">Thoát</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="<c:url value='/Login'/>">Đăng nhập</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>

        <h1>Danh sách tài khoản</h1>
        <a href="<c:url value='/QuanliTaiKhoan?TaiKhoan=create'/>" class="btn btn-success">Create</a>
        
        <c:choose>
            <c:when test="${empty tk}">
                <div>There is no account yet. Please create a new one!</div>
            </c:when>
            <c:otherwise>
                <table>
                    <tr>
                        <th class="n">ID</th>
                        <th class="n">Tài khoản</th>
                        <th class="n">Mật khẩu</th>
                        <th class="n">Nhân viên</th>
                        <th class="n">Quản lí</th>
                        <th class="actions-col">Actions</th>
                    </tr>
                    <tbody>
                        <c:forEach items="${tk}" var="m"> 
                            <tr>
                                <td>${m.id}</td>
                                <td>${m.username}</td>
                                <td>${m.password}</td>
                                <td><input type="checkbox" ${m.isNhanVien ? "checked" : ""} disabled class="rented-checkbox"></td>
                                <td><input type="checkbox" ${m.isAdmin ? "checked" : ""} disabled class="rented-checkbox"></td>
                                <td>
                                    <a href="<c:url value='/QuanliTaiKhoan?TaiKhoan=edit'/>&id=${m.id}" class="btn btn-secondary">Edit</a>
                                    <a href="<c:url value='/QuanliTaiKhoan?TaiKhoan=delete'/>&id=${m.id}" class="btn btn-danger">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>

        <script>
            let lastScrollTop = 0;
            const nav = document.querySelector('nav');
            window.addEventListener('scroll', function () {
                let scrollTop = window.pageYOffset || document.documentElement.scrollTop;
                nav.style.top = scrollTop > lastScrollTop ? "-80px" : "0";
                lastScrollTop = scrollTop;
            });
        </script>
    </body>
</html>
