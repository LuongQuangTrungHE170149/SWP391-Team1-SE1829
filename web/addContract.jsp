<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Add Contract</title>
        <link rel="stylesheet" href="CSS/contract.css"/>
        <link rel="stylesheet" href="CSS/header.css"/>
        <link rel="stylesheet" href="CSS/footer.css"/>
        <script>
            function calculateEndDate() {
                const startDate = document.getElementById('startDate').value;
                const numYears = parseInt(document.getElementById('numYear').value);

                if (startDate && !isNaN(numYears)) {
                    const startDateObj = new Date(startDate);
                    const endDateObj = new Date(startDateObj.setFullYear(startDateObj.getFullYear() + numYears));
                    const endDate = endDateObj.toISOString().split('T')[0];
                    document.getElementById('enddate').value = endDate;
                } else {
                    document.getElementById('enddate').value = '';
                }
            }

            function validateForm() {
                const startDate = document.getElementById('startDate').value;
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

            function calculatePayment() {
                const vehicleType = document.getElementById('vehicleType').value;
                const numYears = document.getElementById('numYear').value;
                let paymentAmount = 0;

                switch (vehicleType) {
                    case 'Xe moto 2 bánh dung tích nhỏ hơn 50cc':
                    case 'Xe điện':
                        if (numYears === "1")
                            paymentAmount = 55000;
                        else if (numYears === "2")
                            paymentAmount = 100000;
                        else if (numYears === "3")
                            paymentAmount = 145000;
                        break;
                    case 'Xe moto 2 bánh dung tích lớn hơn 50cc':
                        if (numYears === "1")
                            paymentAmount = 60000;
                        else if (numYears === "2")
                            paymentAmount = 115000;
                        else if (numYears === "3")
                            paymentAmount = 160000;
                        break;
                    case 'Moto 3 bánh':
                    case 'Các loại xe còn lại':
                        if (numYears === "1")
                            paymentAmount = 290000;
                        else if (numYears === "2")
                            paymentAmount = 570000;
                        else if (numYears === "3")
                            paymentAmount = 850000;
                        break;
                    default:
                        paymentAmount = 0;
                }

                document.getElementById('payment').value = paymentAmount;
            }

            document.addEventListener('DOMContentLoaded', function () {
                document.getElementById('numYear').addEventListener('change', calculatePayment);
                document.getElementById('startDate').addEventListener('change', calculateEndDate);
                calculatePayment();
            });
        </script>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
                background-color: #f4f4f4;
            }
            h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }
            .container {
                max-width: 600px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            label {
                display: block;
                margin-top: 10px;
                margin-bottom: 5px;
                font-weight: bold;
                color: #555;
            }
            input[type="text"],
            input[type="date"],
            input[type="number"],
            select,
            textarea {
                width: calc(100% - 20px);
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }
            textarea {
                height: 100px;
                resize: vertical;
            }
            .btn-container {
                text-align: center;
                margin-top: 20px;
            }
            .btn {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                background-color: #4CAF50;
                color: white;
                font-size: 16px;
            }
            .btn:hover {
                background-color: #45a049;
            }
            .inline-label {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }
            .inline-label label {
                flex: 0 0 120px;
                margin-right: 10px;
            }
            .inline-label span {
                flex: 1;
            }
            .flex-row {
                display: flex;
                justify-content: space-between;
            }
            .flex-row .inline-label {
                flex: 0 0 48%;
            }
            .flex-row-dates {
                display: flex;
                justify-content: space-between;
            }
            .flex-row-dates .inline-label {
                flex: 0 0 48%;
            }
            #numYear {
                width: 150px; /* Độ rộng của select */
                margin-bottom: 10px; /* Khoảng cách với các trường dữ liệu phía dưới */
            }

            /* CSS for the row containing start date and end date */

            /* Optional: if you want to adjust the width of labels and inputs */
            .inline-label label {
                flex: 0 0 120px; /* Độ rộng cố định của label */
                margin-right: 10px;
            }

            .inline-label input[type="date"] {
                width: calc(50% - 5px); /* Độ rộng của input date, chiếm 50% và trừ đi khoảng cách */
                margin-right: 10px; /* Khoảng cách giữa các input */
            }

            /* CSS for the row containing start date and end date */
            .flex-row-dates {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px; /* Khoảng cách với các trường dữ liệu phía dưới */
            }
        </style>
    </head>
    <body>
        <div>
            <jsp:include page="./header.jsp" />      
            <div class="container">
                <h2>Add New Contract</h2>
                <form action="AddContractServlet" method="post" onsubmit="return validateForm()">
                    <div class="inline-label">
                        <label for="customerName">Khách hàng:</label>
                        <input type="hidden" name="customerId" id="customerId" value="${param.customerId}">
                        <span>${customerName}</span>
                    </div>

                    <div class="flex-row">
                        <div class="inline-label">
                            <label for="vehicleModel">Loại xe:</label>
                            <span>${model}</span>
                            <input type="hidden" id="vehicleType" value="${model}">
                        </div>
                        <div class="inline-label">
                            <label for="vehicleLicensePlates">Biển số:</label>
                            <span>${licensePlates}</span>
                        </div>
                    </div>

                    <div class="flex-row">
                        <div class="inline-label">
                            <label for="chassis">Số khung:</label>
                            <span>${chassis}</span>
                        </div>
                        <div class="inline-label">
                            <label for="engine">Số máy:</label>
                            <span>${engine}</span>
                        </div>
                    </div>

                    <input type="hidden" name="vehicleId" id="vehicleId" value="${param.vehicleId}">

                    <label for="numYear">Thời hạn:</label>
                    <select name="numYear" id="numYear">
                        <option value="1">1 năm</option>
                        <option value="2">2 năm</option>
                        <option value="3">3 năm</option>
                    </select><br>

                    <div class="flex-row-dates">
                        <div class="inline-label">
                            <label for="startDate">Ngày bắt đầu:</label>
                            <input type="date" name="startDate" id="startDate" onchange="calculateEndDate()" required>
                        </div>
                        <div class="inline-label">
                            <label for="enddate">Ngày kết thúc:</label>
                            <input type="date" id="enddate" name="endDate" readonly>
                        </div>
                    </div>

                    <label for="payment">Số tiền thanh toán:</label>
                    <input type="number" name="payment" id="payment" required readonly><br>

                    <label for="status">Trạng thái:</label>
                    <select name="status" id="status">
                        <option value="Wait Payment">Chưa Thanh Toán</option>
                        <option value="Pending">Chờ duyệt</option>
                        <option value="In Process">Đang hiệu lực</option>
                    </select><br>

                    <label for="description">Mô tả:</label>
                    <textarea name="description" id="description"></textarea><br>
                    <p id="error_message" class="error-message text-danger fw-bold" style="display:none; margin-left: 10px;"></p>
                    <div class="btn-container">
                        <input type="submit" value="Add Contract" class="btn">
                    </div>
                </form>
            </div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>