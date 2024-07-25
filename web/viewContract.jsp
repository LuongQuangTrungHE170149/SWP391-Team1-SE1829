<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>View Contract</title>

        <style>
            .container {
                width: 80%;
                margin: auto;
                background-color: #f8f9fa;
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

            .info {
                margin-bottom: 30px;
            }

            .info p {
                font-size: 16px;
                line-height: 1.6;
                margin-bottom: 10px;
            }

            .info p strong {
                font-weight: bold;
            }

            .info .half-width {
                display: inline-block;
                width: 48%;
                vertical-align: top;
            }

            .badge {
                padding: 5px 10px;
                border-radius: 4px;
                font-size: 14px;
                font-weight: bold;
            }

            .badge-warning {
                background-color: #ffc107;
                color: #000;
            }

            .badge-danger {
                background-color: #dc3545;
                color: #fff;
            }

            .badge-success {
                background-color: #28a745;
                color: #fff;
            }

            .btn-container {
                margin-top: 20px;
                text-align: center;
            }

            .btn-edit {
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                padding: 10px 20px;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
            }

            .btn-edit:hover {
                background-color: #0056b3;
            }

            @media (max-width: 768px) {
                .info .half-width {
                    width: 100%;
                }
            }

        </style>
    </head>
    <body>
        <div class="container">
            <h1>Thông tin hợp đồng</h1>
            <div class="info">
                <div class="info-item">
                    <p><strong>Họ tên chủ xe:</strong> ${contract.vehicle.ownerFirstName} ${contract.vehicle.ownerLastName}</p>
                </div>
                <div class="info-item">
                    <p><strong>Địa chỉ:</strong> ${contract.vehicle.ownerAddress}</p>
                </div>
                <div class="info-item">
                    <p><strong>Biển số xe:</strong> ${contract.vehicle.licensePlates}</p>
                </div>
                <div class="info-item">
                    <p><strong>Số khung:</strong> ${contract.vehicle.chassis}</p>
                </div>
                <div class="info-item">
                    <p><strong>Số máy:</strong> ${contract.vehicle.engine}</p>
                </div>
                <div class="info-item">
                    <p><strong>Ngày bắt đầu:</strong> ${contract.startDate}</p>
                </div>
                <div class="info-item">
                    <p><strong>Ngày kết thúc:</strong> ${contract.endDate}</p>
                </div>
                <div class="info-item">
                    <p><strong>Mô tả:</strong> ${contract.description}</p>
                </div>
                <div class="info-item">
                    <p><strong>Trạng thái:</strong> <span class="badge ${contract.status == 'Pending'?'badge-warning':''}${contract.status == 'Rejected'?'badge-danger':''}${contract.status == 'Approved'?'badge-success':''}">${contract.status == 'Pending'?'Chờ duyệt':''}${contract.status == 'Rejected'?'Từ chối':''}${contract.status == 'Approved'?'Đã duyệt':''}</span></p>
                </div>
                <div class="btn-container">
                    
                    <form action="ChangeContractStatusServlet" method="post" style="display: inline;" onsubmit="return confirmChange();">
                        <input type="hidden" name="contractId" value="${contract.contractId}" />
                        <select name="newStatus">
                            <option value="Pending">Chờ duyệt</option>
                            <option value="Rejected">Từ chối</option>
                            <option value="Approved">Đã duyệt</option>
                        </select>
                        <button type="submit" class="btn-edit">Sửa trạng thái</button>
                    </form>
                </div>
            </div>

        </div>
        <script>
            function confirmChange() {
                return confirm("Bạn có chắc chắn muốn thay đổi trạng thái hợp đồng không?");
            }
        </script>
    </body>
</html>
