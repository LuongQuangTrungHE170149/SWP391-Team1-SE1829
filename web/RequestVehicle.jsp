<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Nhập thông tin phương tiện</title>
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
                margin-bottom: 20px;
                color: #333;
            }
            form {
                display: flex;
                flex-direction: column;
            }
            label {
                margin-bottom: 10px;
                font-weight: bold;
                color: #555;
            }
            input[type="text"] {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
                margin-bottom: 15px;
            }
            input[type="submit"] {
                padding: 12px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
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
                <h2>Nhập thông tin phương tiện ${startDate} ${endDate}</h2>
                <form action="SubmitInforContract" method="post">
                    <!-- Các trường ẩn để giữ lại dữ liệu từ trang trước -->
                    <input type="hidden" name="firstName" value="${firstName}">
                    <input type="hidden" name="lastName" value="${lastName}">
                    <input type="hidden" name="gender" value="${gender}">
                    <input type="hidden" name="email" value="${email}">
                    <input type="hidden" name="phoneNumber" value="${phoneNumber}">
                    <input type="hidden" name="dob" value="${dob}">
                    <input type="hidden" name="address" value="${address}">
                    <input type="hidden" name="motocycleType" value="${motocycleType}">
                    <input type="hidden" name="startDate" value="${startDate}">
                    <input type="hidden" name="endDate" value="${endDate}">
                    <input type="hidden" name="numYear" value="${numYear}">

                    <!-- Các trường mới để nhập thông tin phương tiện -->
                    <label for="licensePlates">Biển số:</label>
                    <input type="text" id="licensePlates" name="licensePlates" required>

                    <label for="chassisNumber">Số khung:</label>
                    <input type="text" id="chassisNumber" name="chassis" required>

                    <label for="engineNumber">Số máy:</label>
                    <input type="text" id="engineNumber" name="engine" required>

                    <input type="submit" value="Thanh toán">
                </form>
            </div>
        </div>
        <jsp:include page="./footer.jsp" />
    </body>
</html>