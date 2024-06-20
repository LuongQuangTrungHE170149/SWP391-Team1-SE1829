<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>List of Contracts</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                margin: 0;
                padding: 0;
            }
            .content {

                margin: 20px auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .title{
                text-align: center
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
        </style>
    </head>
    <body>
        <jsp:include page="./header.jsp" />
        <div class="content">
            <h2 class="title">Danh sách hợp đồng</h2>
            <table>
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên khách hàng</th>
                        <th>Loại xe</th>
                        <th>Biển số</th>
                        <th>Nhân viên phụ trách</th>
                        <th>Ngày hết hạn</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="contract" items="${cdtos}" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${contract.customerName}</td>
                            <td>${contract.motocycleType}</td>
                            <td>${contract.licensePlates}</td>
                            <td>${contract.staffName}</td>
                            <td><fmt:formatDate value="${contract.endDate}" pattern="dd-MM-yyyy" /></td>
                            <td><a href="ViewContractById?contractId=${contract.contractId}">View</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <jsp:include page="./footer.jsp" />
    </body>
</html>