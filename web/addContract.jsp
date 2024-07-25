<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin hợp đồng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
                display: flex;
            }
            .dashboard {
                width: 300px; /* Độ rộng của staff dashboard */
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .container {
                flex: 1;
                margin: auto;
                background-color: #ffffff;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                margin-top: 50px;
                max-width: 1200px;
            }
            h1 {
                color: #007bff;
                text-align: center;
                margin-bottom: 30px;
            }
            .info {
                margin-bottom: 30px;
            }
            .info p {
                font-size: 16px;
                line-height: 1.6;
            }
            .label {
                font-weight: bold;
                color: #495057;
            }
            .value {
                color: #007bff;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-group label {
                display: block;
                margin-bottom: 5px;
                color: #495057;
            }
            .form-group input,
            .form-group textarea,
            .form-group select {
                width: calc(100% - 20px);
                padding: 10px;
                border: 1px solid #ced4da;
                border-radius: 4px;
                font-size: 14px;
                margin-left: 10px;
            }
            .btn-submit {
                display: block;
                width: calc(100% - 20px);
                padding: 10px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                text-align: center;
                margin-left: 10px;
            }
            .btn-submit:hover {
                background-color: #0056b3;
            }
            .form-group.row {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }
            .form-group.row > div {
                flex: 1;
                min-width: 48%;
                box-sizing: border-box;
            }
            .form-group.row > div:nth-child(odd) {
                margin-right: 4%;
            }
        </style>
        <script>
            function updateEndDate() {
                const startDate = document.getElementById('startDate').value;
                const numYear = document.getElementById('numYear').value;

                if (startDate && numYear) {
                    const startDateObj = new Date(startDate);
                    const endDateObj = new Date(startDateObj);
                    endDateObj.setFullYear(startDateObj.getFullYear() + parseInt(numYear));
                    document.getElementById('endDate').value = endDateObj.toISOString().split('T')[0];
                } else {
                    document.getElementById('endDate').value = '';
                }
            }

            function setMinStartDate() {
                const today = new Date().toISOString().split('T')[0];
                document.getElementById('startDate').setAttribute('min', today);
            }

            window.onload = function () {
                setMinStartDate();
            }
        </script>
    </head>
    <body>
        <div class="dashboard">
            <jsp:include page="staffDashboard.jsp"/>
        </div>
        <div class="container">
            <h1>Thông tin hợp đồng</h1>
            <div class="info">
                <div class="form-group row">
                    <div>
                        <p><span class="label">Họ chủ xe:</span> <span class="value">${vehicleOwnerFirstName}</span></p>
                    </div>
                    <div>
                        <p><span class="label">Tên chủ xe:</span> <span class="value">${vehicleOwnerLastName}</span></p>
                    </div>
                </div>
                <div class="form-group row">
                    <div>
                        <p><span class="label">Địa chỉ chủ xe:</span> <span class="value">${vehicleOwnerAddress}</span></p>
                    </div>
                    <div>
                        <p><span class="label">Biển số xe:</span> <span class="value">${licensePlate}</span></p>
                    </div>
                </div>
                <div class="form-group row">
                    <div>
                        <p><span class="label">Số khung:</span> <span class="value">${chassisNumber}</span></p>
                    </div>
                    <div>
                        <p><span class="label">Số máy:</span> <span class="value">${engineNumber}</span></p>
                    </div>
                </div>
            </div>

            <form action="AddContractSuccess" method="post">
                <input type="hidden" name="vehicleType" value="${vehicleType}">
                <input type="hidden" name="vehicleOwnerFirstName" value="${vehicleOwnerFirstName}">
                <input type="hidden" name="vehicleOwnerLastName" value="${vehicleOwnerLastName}">
                <input type="hidden" name="vehicleOwnerAddress" value="${vehicleOwnerAddress}">
                <input type="hidden" name="licensePlate" value="${licensePlate}">
                <input type="hidden" name="chassisNumber" value="${chassisNumber}">
                <input type="hidden" name="engineNumber" value="${engineNumber}">
                <input type="hidden" name="customerId" value="${customerId}">
                <div class="form-group">
                    <label for="numYear" class="label">Số năm</label>
                    <select id="numYear" name="numYear" required onchange="updateEndDate()">
                        <option value="1">1 năm</option>
                        <option value="2">2 năm</option>
                        <option value="3">3 năm</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="startDate" class="label">Ngày bắt đầu</label>
                    <input type="date" id="startDate" name="startDate" required onchange="updateEndDate()">
                </div>
                <div class="form-group">
                    <label for="endDate" class="label">Ngày kết thúc</label>
                    <input type="date" id="endDate" name="endDate" readonly>
                </div>
                <div class="form-group">
                <label class="label">Bảo hiểm tai nạn</label>
                <input type="radio" id="accidentInsuranceYes" name="accidentInsurance" value="yes" required>
                <label for="accidentInsuranceYes">Có</label>
                <input type="radio" id="accidentInsuranceNo" name="accidentInsurance" value="no">
                <label for="accidentInsuranceNo">Không</label>
            </div>
                <div class="form-group">
                    <label for="description" class="label">Mô tả</label>
                    <textarea id="description" name="description" rows="4" required></textarea>
                </div>

                <div class="form-group">
                    <label for="status" class="label">Trạng thái</label>
                    <select id="status" name="status" required>
                        <option value="pending">Chờ duyệt</option>
                        <option value="Approved">Đang hiệu lực</option>
                    </select>
                </div>
                <button type="submit" class="btn-submit">Lưu hợp đồng</button>
            </form>
        </div>
    </body>
</html>
