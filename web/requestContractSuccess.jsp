<%-- 
    Document   : RequestContractSuccess
    Created on : 20 thg 6, 2024, 13:57:12
    Author     : QUANG TRUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hoàn tất</title>
        <style>
            .text-primary{
                color: #419FA3 !important;
            }
            .btn-primary{
                background-color: #419FA3 !important;
            }
            .current-step{
                border:1px solid #419FA3 !important;
            }
            .done-step{
                background-color: #acdadd;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="spinnerLoading.jsp"/>
        <div class="container mt-4" style="width: 70%; height: 80vh;">
            <div class="mb-2">
                <a href="home" style="color: #4f4f4f; font-size: 14px;">Trang chủ</a> <i class="fa-solid fa-chevron-right mx-2 text-muted" style="font-size: 12px;"></i>
                <a href="motorbikeInsurance" style="color: #4f4f4f; font-size: 14px;">Bảo hiểm xe máy</a> <i class="fa-solid fa-chevron-right mx-2 text-muted" style="font-size: 12px;"></i>
                <span style="font-size: 14px;">Hoàn tất</span>
            </div>

            <div class="stepper d-flex justify-content-between rounded-3 mb-3" style="background-color: #FAFAFA; padding:16px 200px ; width: 100%;">
                <div class="step-item text-center">
                    <div class="rounded-circle border fw-bold m-auto mb-3 done-step position-relative" style="width: 30px; height: 30px; align-content: center;"> 
                        1 <i class="fa-solid fa-check text-success position-absolute bottom-0"></i></div>
                    <div>Tính phí</div>
                </div>
                <div class="step-item text-center">
                    <div class="rounded-circle border fw-bold m-auto mb-3 done-step position-relative" style="width: 30px; height: 30px; align-content: center;"> 
                        2 <i class="fa-solid fa-check text-success position-absolute bottom-0"></i>
                    </div>
                    <div>Khai báo</div>
                </div><div class="step-item text-center">
                    <div class="rounded-circle border fw-bold m-auto mb-3 done-step position-relative" style="width: 30px; height: 30px; align-content: center;">
                        3 <i class="fa-solid fa-check text-success position-absolute bottom-0"></i>
                    </div>
                    <div>Xem lại</div>
                </div><div class="step-item text-center">
                    <div class="rounded-circle border fw-bold m-auto mb-3  done-step position-relative" style="width: 30px; height: 30px; align-content: center;">
                        4 <i class="fa-solid fa-check text-success position-absolute bottom-0"></i> 
                    </div>
                    <div>Thanh toán</div>
                </div>
                <div class="step-item text-center">
                    <div class="rounded-circle border fw-bold m-auto mb-3 done-step position-relative" style="width: 30px; height: 30px; align-content: center;">
                        5 <i class="fa-solid fa-check text-success position-absolute bottom-0"></i></div>
                    <div>Hoàn tất</div>
                </div>
            </div>
            <h3 class="text-center text-primary fw-bold mt-5" style="color: #419FA3 !important;">ĐĂNG KÝ YÊU CẦU BẢO HIỂM XE MÁY THÀNH CÔNG!</h3>
            <div class="text-center">Chúng tôi đã gửi <span class="text-primary">mã hợp đồng</span> và <span class="text-primary">thông tin hợp đồng</span> tới tài khoản email <span class="text-primary">${email}</span>. Hãy nhớ kiểm tra hòm thư của bạn nhé!</div>
            <div class="text-center mt-5">
                <a href="home" class="btn btn-info me-2" data-mdb-ripple-init>Trang chủ</a>
                <a href="searchContract" class="btn btn-danger me-2" data-mdb-ripple-init>Tra cứu hợp đồng</a>
                <c:if test="${empty user}">
                    <a href="login" class="btn btn-info" data-mdb-ripple-init>Đăng nhập</a>
                </c:if>
            </div>

        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
