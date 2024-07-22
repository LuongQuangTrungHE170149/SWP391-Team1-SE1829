<%-- 
    Document   : userProfile
    Created on : Jul 8, 2024, 1:11:17 AM
    Author     : trand
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        <style>
            .navbar-custom {
                background: rgb(0,167,209);
                background: linear-gradient(204deg, rgba(0,167,209,1) 0%, rgba(65,159,163,1) 100%);
            }
            .text-419FA3{
                color:#419FA3;
            }
            .image:hover{
                transform: scale(1.1);
                box-shadow: 0 10px 50px #23232333;
            }
        </style>
    </head>
    <body>
        <jsp:include page="./header.jsp"></jsp:include>
            <div class="container" style="width: 80%; height: 100%;">
                <button type="button" class="btn btn-secondary btn-sm mt-4" data-mdb-ripple-init onclick="goBack()">Trở lại</button>
                <div class="row mt-4" style="align-content: center;">
                    <div class="col-lg-3 mb-3">
                        <div class="card shadow-4">
                            <div class="card-body text-center">
                            <c:if test="${user.gender == 1}">
                                <img class="image rounded-circle img-fluid"  src="images/male-avatar.png" width="200" height="200" alt="male image"/>
                            </c:if>
                            <c:if test="${user.gender == 0}">
                                <img class="image rounded-circle img-fluid"  src="images/female-avatar.png" width="200" height="200" alt="female image"/>
                            </c:if>
                            <h3 class="fw-bold">${user.username} </h3>
                            <p class="text-muted">${user.role} <i class="fa-regular fa-circle-check text-419FA3" style="width: 10px;"></i></p>
                            <p class="text-muted">${user.address}</p>

                        </div>
                    </div>
                </div>

                <div class="col-lg-9">
                    <div class="card">
                        <div class="card-body">
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <p class="mb-0">Tên người dùng</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"> ${user.username}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <p class="mb-0">Ngày sinh</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"><fmt:formatDate value="${user.dob}" pattern="dd/MM/yyyy"/></p>
                                </div>
                            </div>
                            <hr>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <p class="mb-0">Họ và tên</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"> ${user.getFullName()}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <p class="mb-0">Giới tính</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"> ${user.gender == 1?'Nam':'Nữ'}</p>
                                </div>
                            </div>
                            <hr></hr>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <p class="mb-0">Email</p>   
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">${user.email}</p> 
                                </div>
                            </div>
                            <hr>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <p class="mb-0">Số điện thoại</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">${user.phone}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <p class="mb-0">Địa chỉ</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">${user.address}</p>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="d-flex justify-content-end"> 
                                <button class="btn btn-info" onclick="location.href = 'updateProfile.jsp'">Cập nhật thông tin</button>
                            </div>
                        </div>

                    </div>

                </div>
            </div>

        </div>
        <script>
            function goBack() {
                window.location.href = 'home.jsp';
            }
        </script>
        <jsp:include page="./footer.jsp"></jsp:include>
    </body>
</html>
