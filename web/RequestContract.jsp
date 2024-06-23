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
        <title>Tính phí bảo hiểm</title>
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
            function calculatePayment() {
                const vehicleType = document.getElementById('vehicle_type').value;
                const numYears = document.getElementById('num_years').value;
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
        </script>
        <style>

            .insurance-form label {
                font-size: 12px;
                color: #4f4f4f;
            }

            .insurance-form select,
            .insurance-form input[type="date"]
            {
                margin: 0 5px;
                padding: 5px 10px;
                border: none;
                font-size: 14px;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <form action="RequestContract" method="post" 
              class="insurance-form p-3 border shadow-3-strong rounded-3 mb-3" 
              style="min-width: 500px;"
              onsubmit="return validateForm()"
              id = "request-contract">
            <div class="row">
                <div class="col-12 col-lg-4 border-end mb-3">
                    <label for="vehicle_type" class="ms-1">Chọn loại xe</label><br>
                    <select id="vehicle_type" name="vehicle_type" class="m-0 p-0" required>
                        <option value="Xe moto 2 bánh dung tích nhỏ hơn 50cc">Xe moto 2 bánh dung tích nhỏ hơn 50cc</option>
                        <option value="Xe moto 2 bánh dung tích lớn hơn 50cc">Xe moto 2 bánh dung tích lớn hơn 50cc</option>
                        <option value="Xe điện">Xe điện</option>
                        <option value="Moto 3 bánh">Moto 3 bánh</option>
                        <option value="Các loại xe còn lại">Các loại xe còn lại</option>
                    </select>
                </div>
                <div class="col-12 col-lg-2 border-end mb-3 ">
                    <label for="num_years" class="ms-1">Số năm bảo hiểm</label> <br>
                    <select id="num_years" name="num_years" class="m-0 p-0" required onchange="calculateEndDate()">
                        <option value="1">1 năm</option>
                        <option value="2">2 năm</option>
                        <option value="3">3 năm</option>
                    </select>
                </div>
                <div class="col-6 col-lg-2 border-end mb-3">
                    <label for="start_date">Ngày bắt đầu</label> <br>
                    <input type="date" id="start_date" name="startDate" class="m-0 p-0" required onchange="calculateEndDate()">
                </div>
                <div class="col-6 col-lg-2 border-end mb-3">
                    <label for="end_date">Ngày kết thúc</label> <br>
                    <input type="date" id="end_date" name="endDate" class="m-0 p-0" readonly>
                </div>
                <div class="col-12 col-lg-2  text-center" style="align-content: center;">
                    <button type="submit" class="btn btn-primary rounded-pill">Gửi yêu cầu <i class="fa-solid fa-angle-right"></i></button>
                </div>
            </div>
            <p id="error_message" class="error-message text-danger fw-bold" style="display:none; margin-left: 10px;"></p>
        </form>
    </body>
</html>
