<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>View Contract</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #e9ecef;
                margin: 0;
                padding: 0;
                color: #333;
            }

            .container {
                width: 80%;
                margin: auto;
                background-color: #ffffff;
                padding: 30px;
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                margin-top: 60px;
                transition: transform 0.3s ease;
            }

            .container:hover {
                transform: translateY(-5px);
            }

            h1 {
                color: #343a40;
                text-align: center;
                margin-bottom: 40px;
                font-size: 2.5em;
                border-bottom: 3px solid #007bff;
                padding-bottom: 10px;
                display: inline-block;
            }

            .info {
                margin-bottom: 40px;
            }

            .info p {
                font-size: 18px;
                line-height: 1.8;
                margin-bottom: 15px;
                padding: 5px;
                background-color: #f8f9fa;
                border-radius: 5px;
            }

            .info p strong {
                font-weight: bold;
                color: #007bff;
            }

            .badge {
                padding: 7px 12px;
                border-radius: 5px;
                font-size: 15px;
                font-weight: bold;
                text-transform: uppercase;
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

            .badge-expired {
                background-color: #6c757d;
                color: #fff;
            }

            .btn-container {
                margin-top: 30px;
                text-align: center;
            }

            .btn-edit, .btn-back {
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 14px;
                padding: 8px 15px;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
                transition: background-color 0.3s ease, transform 0.3s ease;
                margin-left: 10px;
            }

            .btn-edit:hover, .btn-back:hover {
                background-color: #0056b3;
                transform: translateY(-3px);
            }

            select {
                padding: 8px;
                border-radius: 5px;
                border: 1px solid #ced4da;
                font-size: 14px;
            }

            .half-width {
                display: inline-block;
                width: 48%;
            }

            .inline {
                display: inline-block;
            }

            .align-center {
                display: flex;
                align-items: center;
            }

            .align-center span {
                margin-right: 10px;
            }

            @media (max-width: 768px) {
                .container {
                    width: 95%;
                    margin-top: 30px;
                }

                h1 {
                    font-size: 2em;
                }

                .info p {
                    font-size: 16px;
                }

                .btn-edit, .btn-back {
                    font-size: 16px;
                    padding: 10px 20px;
                }

                .half-width {
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
                    <button type="button" onclick="checkLicensePlate()">Kiểm tra biển số xe</button>
                </div>
                <div class="info-item">
                    <p class="half-width"><strong>Số khung:</strong> ${contract.vehicle.chassis}</p>
                    <p class="half-width"><strong>Số máy:</strong> ${contract.vehicle.engine}</p>
                </div>
                <div class="info-item">
                    <p class="half-width"><strong>Ngày bắt đầu:</strong><fmt:formatDate value="${contract.startDate}" pattern="dd/MM/yyyy"/> </p>
                    <p class="half-width"><strong>Ngày kết thúc:</strong> <fmt:formatDate value="${contract.endDate}" pattern="dd/MM/yyyy"/></p>
                </div>
                <div class="info-item align-center">
                    <p><strong>Trạng thái:</strong> <span class="badge ${contract.status == 'Pending'?'badge-warning':''}${contract.status == 'Rejected'?'badge-danger':''}${contract.status == 'Approved'?'badge-success':''}${contract.status == 'Expired'?'badge-expired':''}">${contract.status == 'Pending'?'Chờ duyệt':''}${contract.status == 'Rejected'?'Từ chối':''}${contract.status == 'Approved'?'Đã duyệt':''}${contract.status == 'Expired'?'Hết hạn':''}</span></p>
                        <c:if test="${contract.status != 'Expired'}">
                        <form action="ChangeContractStatusServlet" method="post" style="display: inline;" onsubmit="return confirmChange();">
                            <input type="hidden" name="contractId" value="${contract.contractId}" />
                            <select name="newStatus" id="statusSelect">
                                <option value="Pending">Chờ duyệt</option>
                                <option value="Rejected">Từ chối</option>
                                <c:if test="${!activeContractExists}">
                                    <option value="Approved">Đã duyệt</option>
                                </c:if>
                            </select>
                            <button type="submit" class="btn-edit">Sửa trạng thái</button>
                        </form>
                    </c:if>
                </div>
            </div>
            <div class="btn-container">
                <a href="ListContract" class="btn-back">Trở lại danh sách hợp đồng</a>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        <script>
            function confirmChange() {
                return confirm("Bạn có chắc chắn muốn thay đổi trạng thái hợp đồng không?");
            }

            function checkLicensePlate() {
                const licensePlate = "${contract.vehicle.licensePlates}";
                // Assume fetchActiveContractByLicensePlate is a function that checks for active contracts
                fetch(`CheckLicensePlateServlet?licensePlate=${contract.vehicle.licensePlates}`)
                    .then(response => response.json())
                    .then(data => {
                        if (data.activeContractExists) {
                            alert("Biển số xe này đã có hợp đồng có hiệu lực.");
                            document.getElementById('statusSelect').querySelector('option[value="Approved"]').style.display = 'none';
                        } else {
                            alert("Biển số xe này không có hợp đồng nào có hiệu lực.");
                        }
                    })
                    .catch(error => console.error('Error:', error));
            }
        </script>
    </body>
</html>
