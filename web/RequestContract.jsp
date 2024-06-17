<%-- 
    Document   : RequestContract.jsp
    Created on : 17 thg 6, 2024, 01:19:13
    Author     : QUANG TRUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Contract</title>
        <script>
            function calculateEndDate() {
                const startDate = document.getElementById('start_date').value;
                const numYears = parseInt(document.getElementById('num_years').value);

                if (startDate && !isNaN(numYears)) {
                    const startDateObj = new Date(startDate);
                    const endDateObj = new Date(startDateObj.setFullYear(startDateObj.getFullYear() + numYears));
                    const endDate = endDateObj.toISOString().split('T')[0];
                    document.getElementById('end_date').value = endDate;
                } else {
                    document.getElementById('end_date').value = '';
                }
            }
            function validateForm() {
                const startDate = document.getElementById('start_date').value;
                const today = new Date().toISOString().split('T')[0];
                const errorMessageElement = document.getElementById('error_message');

                if (startDate <= today) {
                    errorMessageElement.textContent = "Ngày bắt đầu phải lớn hơn ngày hiện tại.";
                    errorMessageElement.style.display = 'block';
                    return false;
                } else {
                    errorMessageElement.style.display = 'none';
                    return true;
                }
            }
        </script>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            h1 {
                text-align: center;
                margin-top: 20px;
                color: #333;
            }

            .insurance-form {
                display: flex;
                align-items: center;
                justify-content: center;
                flex-wrap: wrap;
                gap: 15px;
                margin: 20px;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .insurance-form label {
                margin: 0 5px;
                font-weight: bold;
            }

            .insurance-form select,
            .insurance-form input[type="date"],
            .insurance-form button {
                margin: 0 5px;
                padding: 5px 10px;
                border-radius: 4px;
                border: 1px solid #ccc;
            }

            .insurance-form button {
                background-color: #007bff;
                color: #fff;
                border: none;
                cursor: pointer;
            }

            .insurance-form button:hover {
                background-color: #0056b3;
            }

            .error-message {
                color: red;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <jsp:include page="./header.jsp" />
        <form action="RequestContract" method="post" class="insurance-form" onsubmit="return validateForm()">
            <label for="vehicle_type">Loại xe:</label>
            <select id="vehicle_type" name="vehicle_type" required>
                <option value="motorbike_under_50cc">Xe moto 2 bánh dung tích nhỏ hơn 50cc</option>
                <option value="motorbike_over_50cc">Xe moto 2 bánh dung tích lớn hơn 50cc</option>
                <option value="electric_bike">Xe điện</option>
                <option value="three_wheel_motorbike">Moto 3 bánh</option>
                <option value="other">Các loại xe còn lại</option>
            </select>

            <label for="num_years">Số năm bảo hiểm:</label>
            <select id="num_years" name="num_years" required onchange="calculateEndDate()">
                <option value="1">1 năm</option>
                <option value="2">2 năm</option>
                <option value="3">3 năm</option>
            </select>

            <label for="start_date">Ngày bắt đầu:</label>
            <input type="date" id="start_date" name="startDate" required onchange="calculateEndDate()">

            <label for="end_date">Ngày kết thúc:</label>
            <input type="date" id="end_date" name="endDate" readonly>

            <button type="submit">Gửi Yêu Cầu</button>

            <p id="error_message" class="error-message" style="display:none; margin-left: 10px;"></p>
        </form>
        <jsp:include page="./footer.jsp" />
    </body>
</html>
