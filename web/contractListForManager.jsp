<%-- 
    Document   : contractListForManager
    Created on : Jul 18, 2024, 6:19:35 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List contract</title>
        <style>
            .table-custom td, .table-custom th{
                padding: 14px 16px !important;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <jsp:include page="staffDashboard.jsp"/>

        <div class="main-content" id="main-content">
            <div class="container">
                <div style="margin: 50px 0">
                    <h1 style="margin-bottom: 20px">Danh sách hợp đồng</h1>
                    <table class="table table-bordered table-hover table-custom">
                        <thead>
                            <tr>   
                                <th>Mã hợp đồng</th>
                                <th>Khách hàng</th>
                                <th>Ngày tạo</th>
                                <th>Thời hạn</th>
                                <th>Thanh toán</th>
                                <th>Ghi chú</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="contract" items="${requestScope.listContract}">
                                <tr>
                                    <td>${contract.code}</td>
                                    <td>${contract.customer.getFullName()}</td>
                                    <td><fmt:formatDate value="${contract.createDate}" pattern="dd/MM/yyyy"/></td>
                                    <td>
                                        <fmt:formatDate value="${contract.startDate}" pattern="dd/MM/yyyy"/> - 
                                        <fmt:formatDate value="${contract.endDate}" pattern="dd/MM/yyyy"/> ${c.endDate < now?'<div class="text-danger fw-bold">Đã hết hạn</div>':''}
                                    </td>
                                    <td><fmt:formatNumber value="${contract.payment}" type="currency" currencyCode="VND"/></td>
                                    <td>${contract.description}</td>
                                    <td>
                                        <div class="badge ${contract.status == 'Pending'?'badge-warning':''}${contract.status == 'Rejected'?'badge-danger':''}
                                             ${contract.status == 'Approved'?'badge-success':''}">${contract.status == 'Pending'?'Chờ duyệt':''}${contract.status == 'Rejected'?'Từ chối':''}
                                            ${contract.status == 'Approved'?'Đã duyệt':''}</div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>

    </body>
</html>
