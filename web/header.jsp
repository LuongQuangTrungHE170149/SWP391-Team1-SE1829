<%-- 
    Document   : header
    Created on : May 20, 2024, 3:01:43 AM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"rel="stylesheet"/>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"rel="stylesheet"/>
<!-- MDB -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.min.css"rel="stylesheet"/><body>
    <style>
        body{
            font-family: Roboto !important;
        }
        .navbar-custom {
            background: rgb(0,167,209);
            background: linear-gradient(204deg, rgba(0,167,209,1) 0%, rgba(65,159,163,1) 100%);
        }
    </style>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light navbar-custom sticky-top bg-body-tertiary ">
        <div class="container-fluid">
            <a class="navbar-brand" href="home">
                <img src="images/icon motor.png" alt="Logo" width="35" height="35" class="me-2 mb-2">
                <span style="font-size: 28px; color: white;">F-Care Insurance</span>
            </a>
            <button 
                data-mdb-collapse-init
                class="navbar-toggler"
                type="button" 
                data-mdb-target="#navbarNav"
                aria-controls="navbarNav"
                aria-expanded="false"
                aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" style="color:white;" href="home">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"style="color:white;" href="introduce">Giới thiệu</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" 
                           id="dlink" role="button" 
                           aria-expanded="false" 
                           data-mdb-dropdown-init
                           style="color:white;" 
                           href="#">Dịch vụ</a>
                        <ul class="dropdown-menu" aria-labelledby="dlink">
                            <li><a class="dropdown-item" href="#">Bảo hiểm xe máy</a></li>
                            <li><a class="dropdown-item" href="#">Bảo hiểm xe máy</a></li>
                            <li><a class="dropdown-item" href="#">Bảo hiểm xe máy</a></li>
                        </ul>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link"style="color:white;" href="promotion">Khuyến mại</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"style="color:white;" href="#">Tin tức</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" style="color:white;" href="#">liên Hệ</a>
                    </li>
                </ul>
            </div>
            <div class="d-flex justify-content-center">
                <c:if test="${sessionScope.user!=null}">
                    <div class="d-flex justify-content-center align-items-center">
                        <span class="fs-5 text-white me-2">Chào, ${sessionScope.user.getFullName()}</span>
                        <div class="dropdown">
                            <button type="button" 
                                    class="btn btn-info btn-floating"
                                    id="dropdown-user"
                                    data-mdb-ripple-init
                                    data-mdb-dropdown-init
                                    aria-expanded="false">
                                <i class="fa-solid fa-user" style="color:#fff"></i>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdown-user">
                                <li><a href="#" class="dropdown-item">Hồ sơ</a></li>
                                <li class="dropdown-divider"></li>
                                <li><a href="logout" class="dropdown-item">Đăng xuất</a></li>
                            </ul>
                        </div>
                    </div>
                </c:if>
                <c:if test="${sessionScope.user==null}">
                    <a class="btn btn-info me-2" href="login">Đăng Nhập</a>
                    <a class="btn btn-light  " href="register">Đăng Ký</a>
                </c:if>
            </div>
        </div>
    </nav>
    <!--mdb bootstrap-->
</body>
