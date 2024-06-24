<%-- 
    Document   : confirmOTP
    Created on : June 10, 2024, 9:53:29 AM
    Author     : kha21
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Confirm OTP</title>
    </head>
    <body class="bg-light">
        <jsp:include page="header.jsp"/>
        <div class="row d-flex justify-content-center m-5">
            <c:choose>
                <c:when test="${not empty sessionScope.userForgetPassword or not empty sessionScope.userRegister}">
                    <div class="col-5">
                        <div class="card shadow">
                            <div class="text-center">
                                <h3 class="mb-0 mt-4">Xác nhận OTP</h3>
                            </div>
                            <div class="text-center">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.userForgetPassword}">
                                        <p class="m-0 text-danger">Mã OTP đã được gửi đến email <u>${sessionScope.userForgetPassword.email}</u></p>
                                    </c:when>
                                    <c:when test="${not empty sessionScope.userRegister}">
                                        <p class="m-0 text-danger">Mã OTP đã được gửi đến email <u>${sessionScope.userRegister.email}</u></p>
                                    </c:when>
                                </c:choose>
                            </div>
                            <form action="confirmOTP" method="POST">
                                <div class="card-body">
                                    <div class="row d-flex justify-content-center">
                                        <div class="col-12 col-lg-5 pe-0">
                                            <div class="form-outline" data-mdb-input-init>
                                                <input type="text" id="OTPCode" name="ConfirmOTPCode" class="form-control" required=""/>
                                                <label for="OTPCode" class="form-label">Nhập code</label>
                                            </div>
                                            <p class="m-0 ps-2 text-danger">${error}</p>
                                        </div>
                                        <div class="col-12 col-lg-3">
                                            <button type="submit" class="btn btn-danger" data-mdb-ripple-init>Xác nhận</button>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-center pb-4 mt-3">
                                        <p class="mb-0 me-2">Bạn đã có tài khoản?</p>
                                        <button type="button" data-mdb-button-init data-mdb-ripple-init onclick="location.href = 'login'" class="btn btn-outline-primary">Đăng nhập</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="col-5">
                        <div class="card shadow">
                            <div class="text-center">
                                <h3 class="mb-0 mt-4 text-danger">Yêu cầu OTP không hợp lệ!</h3>
                            </div>
                            <div class="card-body">
                                <div class="d-flex align-items-center justify-content-center pb-4">
                                    <button type="button" data-mdb-button-init data-mdb-ripple-init onclick="location.href = 'login'" class="btn btn-primary">Đăng nhập</button>
                                </div>
                                <div class="d-flex align-items-center justify-content-center pb-4">
                                    <p class="mb-0 me-2">Quên mật khẩu?</p>
                                    <button type="button" data-mdb-button-init data-mdb-ripple-init onclick="location.href = 'forgotPassword'" class="btn btn-outline-danger">Lấy lại mật khẩu</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
