<%-- 
    Document   : header
    Created on : May 20, 2024, 3:01:43 AM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<style>
    body{

    }
    .navbar-custom {
        background: linear-gradient(to bottom, #11DDE5, #275F61);
        position: fixed;
        width: 100%;
        transition: top 0.3s;
        top:0;
        z-index: 999;
    }
    .navbar-custom .navbar-brand, .navbar-custom .nav-link {
        font-size: 20px;
        font-weight: 600;
        margin: 0 12px;
        color: white;

    }
    .navbar-custom .nav-link:hover {
        color: #e0f7fa;
    }
    .navbar-custom .btn-outline-primary {
        color: white;
        border-color: white;
    }
    .navbar-custom .btn-outline-primary:hover {
        color: #275F61;
        background-color: white;
        border-color: white;
    }
    .navbar-custom .btn-primary {
        background-color: white;
        border-color: white;
        color: #275F61;
    }
    .navbar-custom .btn-primary:hover {
        background-color: #e0f7fa;
        border-color: #e0f7fa;
        color: #275F61;
    }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light navbar-custom fixed-top ">
        <div class="container-fluid">
            <a class="navbar-brand" href="home">
                <img src="images/logo.png" alt="Logo" width="50" height="50" class="d-inline-block align-top">
                <span style="font-size: 28px; color: white;">F-Care Insurance</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" style="color:white;" href="home">Trang Chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"style="color:white;" href="introduce">Giới Thiệu</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="dlink" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color:white;" href="#">Dịch Vụ</a>
                        <ul class="dropdown-menu" aria-labelledby="dlink">
                            <li><a class="dropdown-item" href="#">Bảo Hiểm Xe Máy</a></li>
                        </ul>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link"style="color:white;" href="#">Tin Tức</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" style="color:white;" href="#">Liên Hệ</a>
                    </li>
                </ul>
            </div>
            <div class="d-flex justify-content-center">
                <a class="btn btn-outline-primary me-2" href="#">Đăng Nhập</a>
                <a class="btn btn-primary  " href="#">Đăng Ký</a>
                
            </div>
        </div>
    </nav>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
