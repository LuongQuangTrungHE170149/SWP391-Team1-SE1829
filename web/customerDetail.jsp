<%-- 
    Document   : customerDetail
    Created on : Jun 5, 2024, 6:45:02 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/cutomerManage.css">

        <title>Thông tin khách hàng</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <style>
            body{
                background-color: #f2f0fa !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="staffDashboard.jsp"/>
        <c:set var="customer" value="${requestScope.user}" />
        <div class="main-content" id="main-content">
            <div class="nav navbar bg-light sticky-top justify-content-between align-items-start px-2"> 
                <div class="fs-3 fw-bold text-info">Thông tin khách hàng</div>
            </div>
            <div class="container mt-5">
                <div class="row">
                    <div class="col-md-3">
                        <div class="card mb-5">
                            <div class="card-body text-center">
                                <img width="200px" height="200px" src=${customer.gender == 0 ? './images/male.jpg' : './images/female.jpg'} alt="" />
                                <div style="font-size: 26px; margin-top: 10px;"><strong>${customer.getFullName()}</strong></div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <div style="display: flex; justify-content: space-between">
                                    <div>
                                        <span style="margin-right: 8px;"><i class="fa-solid fa-address-book"></i></i></span>
                                        <span>Bảo hiểm: </span>
                                    </div>
                                    <span>${requestScope.totalContract}</span>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">   
                                <a href="customerList" class="btn btn-rounded btn-sm btn-primary"> 
                                    <i class="fa-solid fa-chevron-left"></i>
                                    Quay lại
                                </a>
                                <div class="info-group">
                                    <span class="customer-label"><strong>Họ tên: </strong></span>
                                    <span class="customer-info">${customer.getFullName()}</span>
                                </div>
                                <div class="info-group">
                                    <span class="customer-label"><strong>Giới tính: </strong></span>
                                    <span class="customer-info">${customer.gender == 0 ? 'Nam' : 'Nữ'}</span>
                                </div>
                                <div class="info-group">
                                    <span class="customer-label"><strong>Ngày sinh: </strong></span>
                                    <fmt:parseDate value="${customer.getDob()}" var="parsedDate" pattern="yyyy-MM-dd" />
                                    <fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy" var="formattedDate" />
                                    <span class="customer-info">${formattedDate}</span>
                                </div>
                                <div class="info-group">
                                    <span class="customer-label"><strong>Địa chỉ: </strong></span>
                                    <span class="customer-info">${customer.address}</span>
                                </div>
                                <div class="info-group">
                                    <span class="customer-label"><strong>Email: </strong></span>
                                    <span class="customer-info">${customer.email}</span>
                                </div>
                                <div class="info-group">
                                    <span class="customer-label"><strong>Số điện thoại: </strong></span>
                                    <span class="customer-info">${customer.phone}</span>
                                </div>
                                <div class="info-group">
                                    <span class="customer-label"><strong>Địa chỉ: </strong></span>
                                    <span class="customer-info">${customer.address}</span>
                                </div>

                                <a href="customerEdit?customerId=${customer.id}">
                                    <button class="btn btn-rounded btn-primary">Sửa</button>
                                </a>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>




        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>

    </body>
</html>
