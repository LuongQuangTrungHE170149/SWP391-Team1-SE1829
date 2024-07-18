<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Contract</title>
    <style>
        .container {
            width: 80%;
            margin: auto;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 50px;
        }

        h1 {
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            color: #555;
        }

        input[type="date"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        .btn-container {
            margin-top: 20px;
            text-align: center;
        }

        .btn-submit {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            padding: 10px 20px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            margin-right: 10px;
        }

        .btn-cancel {
            background-color: #6c757d;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            padding: 10px 20px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
        }
    </style>
    <script>
        function calculateEndDate() {
            const startDate = document.getElementById('startDate').value;
            const numYears = parseInt(document.getElementById('contractYears').value);

            if (startDate && !isNaN(numYears)) {
                const startDateObj = new Date(startDate);
                const endDateObj = new Date(startDateObj.setFullYear(startDateObj.getFullYear() + numYears));
                const endDate = endDateObj.toISOString().split('T')[0];
                document.getElementById('endDate').value = endDate;
            } else {
                document.getElementById('endDate').value = '';
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Chỉnh sửa hợp đồng</h1>
        <form action="EditContract" method="post">
            <input type="hidden" name="contractId" value="${contract.contractId}">
            
            <div class="form-group">
                <label for="startDate">Ngày bắt đầu:</label>
                <input type="date" id="startDate" name="startDate" value="${contract.startDate}" required>
            </div>
            <div class="form-group">
                <label for="contractYears">Số năm hợp đồng:</label>
                <select id="contractYears" name="contractYears" onchange="calculateEndDate()" required>
                    <option value="1" ${contractYears == 1 ? 'selected' : ''}>1 năm</option>
                    <option value="2" ${contractYears == 2 ? 'selected' : ''}>2 năm</option>
                    <option value="3" ${contractYears == 3 ? 'selected' : ''}>3 năm</option>
                </select>
            </div>
            <div class="form-group">
                <label for="endDate">Ngày kết thúc:</label>
                <input type="date" id="endDate" name="endDate" value="${endDate}" required readonly>
            </div>
            <div class="form-group">
                <label for="description">Mô tả:</label>
                <textarea id="description" name="description" rows="4" required>${contract.description}</textarea>
            </div>
            <div class="form-group">
                <label for="status">Trạng thái:</label>
                <select id="status" name="status" required>
                    <option value="pending" ${contract.status eq 'pending' ? 'selected' : ''}>Chờ duyệt</option>
                    <option value="active" ${contract.status eq 'active' ? 'selected' : ''}>Đang hiệu lực</option>
                </select>
            </div>
            <div class="btn-container">
                <button type="submit" class="btn-submit">Lưu chỉnh sửa</button>
                <a href="viewContract.jsp?contractId=${contract.contractId}" class="btn-cancel">Hủy</a>
            </div>
        </form>
    </div>

</body>
</html>
