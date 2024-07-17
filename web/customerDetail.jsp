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
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/cutomerManage.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Customer Detail</title>
    </head>
    <body>

        <div id="customerDetail-page">
            <jsp:include page="staffDashboard.jsp"/>

            <c:set var="customer" value="${requestScope.user}" />
            <div class="main-content" id="main-content">
                <div style="padding-top: 100px" class=" container customerDetail-wrapper">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="customerDetail-avatar">
                                <div class="info">
                                    <img width="200px" height="200px" src=${customer.gender == 0 ? './images/male.jpg' : './images/female.jpg'} alt="" />
                                    <span style="font-size: 26px; margin-top: 10px;"><strong>${customer.getFullName()}</strong></span>
                                </div>
                            </div>
                            <div class="customer-contract--wrapper">
                                <div class="customer-contract--info">
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
                        <div class="col-md-2"></div>   


                        <div class="col-md-7">
                            <div class="customer-info--wrapper">   
                                <a href="customerList" class="back-btn-customer"> 
                                    <span class="back-icon"><i class="fa-solid fa-chevron-left"></i></span>
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
                                    <button class="update-btn">Sửa</button>
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
