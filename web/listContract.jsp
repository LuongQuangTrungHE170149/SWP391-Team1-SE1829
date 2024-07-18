<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
          <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
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
            <h2 class="title">Danh sách hợp đồng ${listall}</h2>
            <div class="container mt-5" style="min-height: 70vh;"> 
            <div class="text-center fs-3 fw-bold text-danger mb-3">Quản lý hợp đồng${c.customer}</div>
            <input type="hidden" id="now" value="${now}"/>
            <table class="table table-bordered table-hover table-custom">
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
                            <td>${c.customer.getFullName()} </td>
                            <td><fmt:formatDate value="${c.createDate}" pattern="dd/MM/yyyy"/></td>
                            <td>
                                <fmt:formatDate value="${c.startDate}" pattern="dd/MM/yyyy"/> - 
                                <fmt:formatDate value="${c.endDate}" pattern="dd/MM/yyyy"/> ${c.endDate < now?'<div class="text-danger fw-bold">Đã hết hạn</div>':''}
                            </td>
                            <td><fmt:formatNumber value="${c.payment}" type="currency" currencyCode="VND"/></td>
                            <td>${c.description}</td>
                            <td><a href="#" 
                                   class="text-info btn-detailContract"
                                   data-mdb-modal-init
                                   data-id="${c.contractId}"
                                   data-mdb-target="#detailContractModal"
                                   ><i class="fa-regular fa-folder-open"></i></a>
                            </td>
                            <td>
                                <div class="badge ${c.status == 'Pending'?'badge-warning':''}${c.status == 'Rejected'?'badge-danger':''}${c.status == 'Approved'?'badge-success':''}">${c.status == 'Pending'?'Chờ duyệt':''}${c.status == 'Rejected'?'Từ chối':''}${c.status == 'Approved'?'Đã duyệt':''}</div>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
        <jsp:include page="./footer.jsp" />
    </body>
</html>