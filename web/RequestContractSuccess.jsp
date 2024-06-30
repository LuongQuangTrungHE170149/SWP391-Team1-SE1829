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
        <title>Yêu cầu thành công</title>
        <style>
            .text-primary{
                color: #419FA3 !important;
            }
            .btn-primary{
                background-color: #419FA3 !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container" style="height: 70vh;">
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
