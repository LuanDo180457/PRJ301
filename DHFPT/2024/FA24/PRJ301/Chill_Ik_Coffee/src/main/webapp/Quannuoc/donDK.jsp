<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng Ký Nhân Viên</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            h1 {
                color: #333;
            }
            form div {
                margin-bottom: 10px;
            }
            label {
                display: inline-block;
                width: 150px;
            }
            input[type="text"], input[type="date"] {
                width: 200px;
                padding: 5px;
            }
            button {
                padding: 10px 15px;
                background-color: #28a745;
                color: white;
                border: none;
                cursor: pointer;
            }
            button:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <h1>Đăng Ký Nhân Viên</h1>
        <form action="${pageContext.request.contextPath}/DonDK" method="POST">
            <div>
                <label for="tenNV">Tên Nhân Viên:</label>
                <input type="text" id="tenNV" name="tenNV" required>
            </div>
            <div>
                <label for="Sdt">Số Điện Thoại:</label>
                <input type="text" id="Sdt" name="Sdt" required pattern="[0-9]+" title="Chỉ nhập số">
            </div>
            <div>
                <label for="diachi">Địa Chỉ:</label>
                <input type="text" id="diachi" name="diachi" required>
            </div>
            <div>
                <label for="ngaysinh">Ngày Sinh:</label>
                <input type="date" id="ngaysinh" name="ngaysinh" required>
            </div>
            <div>
                <label for="quequan">Quê Quán:</label>
                <input type="text" id="quequan" name="quequan" required>
            </div>
            <div>
                <button type="submit">Đăng Ký</button>
                <button type="button" onclick="window.location.href = '${pageContext.request.contextPath}/Quannuoc/Giaodien.jsp'">Quay Lại</button>
            </div>
        </form>



    </body>
</html>

<c:if test="${not empty message}">
    <div style="color: red;">${message}</div>
</c:if>