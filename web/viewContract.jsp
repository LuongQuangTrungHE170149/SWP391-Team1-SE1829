<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Insurance Contract</title>
    <link rel="stylesheet" href="CSS/contract.css"/>
    <link rel="stylesheet" href="CSS/header.css"/>
    <link rel="stylesheet" href="CSS/footer.css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        label {
            display: block;
            margin-top: 10px;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        .inline-label {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .inline-label label {
            flex: 0 0 150px;
            margin-right: 10px;
        }
        .inline-label span {
            flex: 1;
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
            text-decoration: none; /* Không gạch chân link */
            display: inline-block; /* Hiển thị như dạng khối */
            margin-right: 10px; /* Khoảng cách phía bên phải */
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div>
        <jsp:include page="./header.jsp" />
        
        <div class="container">
            <h2>Thông tin hợp đồng bảo hiểm xe máy</h2>
            <div class="inline-label">
                <label>Khách hàng:</label>
                <span>${customerName}</span>
            </div>
            
            <div class="inline-label">
                <label>Loại xe:</label>
                <span>${vehicle.motocycleType}</span>
                <label>Biển số:</label>
                <span>${vehicle.getLicensePlates()}</span>
            </div>
            
            <div class="inline-label">
                <label>Số khung:</label>
                <span>${vehicle.chassis}</span>
                <label>Số máy:</label>
                <span>${vehicle.engine}</span>
            </div>
            
            <div class="inline-label">
                <label>Ngày bắt đầu:</label>
                <span>${contract.startDate}</span>
                <label>Ngày kết thúc:</label>
                <span>${contract.endDate}</span>
            </div>
            
            <div class="inline-label">
                <label>Số tiền thanh toán:</label>
                <span>${contract.payment}</span>
            </div>
            
            <div class="inline-label">
                <label>Trạng thái:</label>
                <span>${contract.status}</span>
            </div>
            
            <div class="inline-label">
                <label>Mô tả:</label>
                <span>${contract.description}</span>
            </div>
            
            <div class="btn-container">
                <a href="extend_contract.jsp" class="btn">Gia hạn hợp đồng</a>
                <a href="claim_history.jsp" class="btn">Lịch sử đền bù</a>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>