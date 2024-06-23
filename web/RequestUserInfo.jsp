<%-- 
    Document   : RequestUserInfo.jsp
    Created on : 17 thg 6, 2024, 02:00:05
    Author     : QUANG TRUNG
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Nhập thông tin Chủ sở hữu</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }
            .content {
                flex: 1;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .container {
                background-color: #fff;
                padding: 30px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                max-width: 700px;
                margin: 20px;
                width: 100%;
            }
            h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }
            form {
                display: flex;
                flex-direction: column;
            }
            label {
                margin-bottom: 5px;
                font-weight: bold;
                color: #555;
            }
            .form-group {
                display: flex;
                justify-content: space-between;
                margin-bottom: 15px;
            }
            .form-group div {
                display: flex;
                flex-direction: column;
                width: 48%;
            }
            input[type="text"], input[type="email"], input[type="date"], select {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
            }
            input[type="submit"] {
                padding: 12px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-top: 10px;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <jsp:include page="./header.jsp" />
        <div class="content">
            <div class="container">
                <h2>Nhập thông tin chủ sở hữu ${startDate} ${endDate}</h2>
                <form action="RequestVehicle" method="post">
                    <input type="hidden" id="startDate" name="startDate" value="${startDate}">
                    <input type="hidden" id="endDate" name="endDate" value="${endDate}">
                    <input type="hidden" id="numYear" name="numYear" value="${numYear}">
                    <input type="hidden" id="motocycleType" name="motocycleType" value="${motocycleType}">
                    <div class="form-group">
                        <div>
                            <label for="firstName">Họ:</label>
                            <input type="text" id="firstName" name="firstName" maxlength="255" required>
                        </div>
                        <div>
                            <label for="lastName">Tên:</label>
                            <input type="text" id="lastName" name="lastName" maxlength="255" required>
                        </div>
                    </div>

                    <label for="gender">Giới tính:</label>
                    <select id="gender" name="gender" required>
                        <option value="1">Nam</option>
                        <option value="0">Nữ</option>
                    </select>

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" maxlength="255" required>

                    <label for="phoneNumber">Số điện thoại:</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" maxlength="20" required>

                    <label for="dob">Ngày sinh:</label>
                    <input type="date" id="dob" name="dob" required>

                    <label for="address">Địa chỉ:</label>
                    <input type="text" id="address" name="address" maxlength="255" required>

                    <input type="submit" value="Tiếp tục">
                </form>
            </div>
        </div>
        <jsp:include page="./footer.jsp" />
    </body>
</html> 