<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="images/icon_motor_color_419fa3.png" type="image/x-icon">
    <meta charset="UTF-8">
    <title>List of Contracts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .content {
            margin-left:  300px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 1200px;
        }
        .title {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .text-danger {
            color: #dc3545 !important;
        }
        .fw-bold {
            font-weight: bold;
        }
        .badge {
            padding: 5px 10px;
            border-radius: 4px;
            text-align: center;
            color: #fff;
            font-size: 14px;
        }
        .badge-warning {
            background-color: #ffc107;
        }
        .badge-danger {
            background-color: #dc3545;
        }
        .badge-success {
            background-color: #28a745;
        }
        .btn-detailContract {
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
        }
        .btn-detailContract:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <jsp:include page="staffDashboard.jsp"/>
    <div class="content">
        <h2 class="title">Danh sách hợp đồng</h2>
        <div class="container mt-5">
            <div class="text-center fs-3 fw-bold text-danger mb-3">Quản lý hợp đồng</div>
            <input type="hidden" id="now" value="${now}"/>
            <a href="checkEmailPhone.jsp" class="create-contract-btn">Tạo hợp đồng</a>
            <table>
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Mã hợp đồng</th>
                        <th>Người yêu cầu</th>
                        <th>Ngày tạo</th>
                        <th>Thời hạn</th>
                        <th>Thanh toán</th>
                        <th>Ghi chú</th>
                        <th>Chi tiết</th>
                        <th>Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listAll}" var="c" varStatus="s">
                        <tr>
                            <td>${s.index+1}</td>
                            <td>${c.code}</td>
                            <td>${c.customer.getFullName()}</td>
                            <td><fmt:formatDate value="${c.createDate}" pattern="dd/MM/yyyy"/></td>
                            <td>
                                <fmt:formatDate value="${c.startDate}" pattern="dd/MM/yyyy"/> -
                                <fmt:formatDate value="${c.endDate}" pattern="dd/MM/yyyy"/> 
                                ${c.endDate < now ? '<div class="text-danger fw-bold">Đã hết hạn</div>' : ''}
                            </td>
                            <td><fmt:formatNumber value="${c.payment}" type="currency" currencyCode="VND"/></td>
                            <td>${c.description}</td>
                            <td>
                                <a href="ViewContract?contractId=${c.contractId}" class="btn-detailContract">
                                    <i class="fa-regular fa-folder-open"></i> Xem chi tiết
                                </a>
                            </td>
                            <td>
                                <div class="badge ${c.status == 'Pending' ? 'badge-warning' : (c.status == 'Rejected' ? 'badge-danger' : 'badge-success')}">
                                    ${c.status == 'Pending' ? 'Chờ duyệt' : (c.status == 'Rejected' ? 'Từ chối' : 'Đã duyệt')}
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
