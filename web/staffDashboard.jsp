<%-- 
    Document   : staffDashboard
    Created on : May 30, 2024, 9:06:27 PM
    Author     : kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"rel="stylesheet"/>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"rel="stylesheet"/>
<!-- MDB -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.min.css"rel="stylesheet"/><body>
    <style>
        .bg-custom{
            background: rgb(5,96,116);
            background: linear-gradient(0deg, rgba(5,96,116,1) 0%, rgba(65,159,163,1) 100%);
        }

        .bg-primary{
            background-color: #419FA3 !important;
        }
        .btn-primary{
            background-color: #419FA3 !important;
            border-color: #419FA3;
        }

        .content{
            width: 100%;
            display: flex;
            flex-direction: column;
        }
        .btn-custom{
            width: 100%;
            height: 45px;
            margin-bottom: 8px;
            padding:  10px;
            display: flex;
            justify-content: start;
            align-items: center;
            font-size: 12px;
        }

        .activeDash{
            border-left: 5px solid #ccc;
            background-color: #e9e9e9;
        }



    </style>

    <!--    Thanh nav của staff-->
    <c:if test="${sessionScope.user.getRole() == 'Staff' || sessionScope.user.getRole() == 'staff'}">
        <div class="dashboard d-flex flex-column sticky-top p-3 bg-custom" style="width: 250px !important; height: 100vh;">
            <a href="#" class="d-flex align-items-center ms-1 mb-3 me-md-auto  text-decoration-none text-white">
                <img src="images/icon motor.png" class="me-2 mb-1" width="30" height="30" alt="alt"/>
                <span class="fs-5 mt-1">Staff Manager</span>
            </a>
            <hr class="mt-0 bg-light" style="height: 2px;
                border: none;">
            
            <ul class="nav flex-column mb-auto">
                <li class="nav-item">
                    <a href="StaffManager" class="btn btn-light btn-sm btn-custom"data-mdb-ripple-init id="btnHome">
                        <i class="fa-solid fa-house me-2"></i>Home 
                    </a>
                </li>
                <li class="nav-item btn-group">
                    <a href="ConsultationManagement" class="btn btn-light  btn-custom "data-mdb-ripple-init id="btnConsultation">
                        <i class="fa-solid fa-message me-2"></i> 
                        Consultation
                        <span class="badge badge-notification bg-danger ms-3">${sessionScope.totalConsultation}</span>
                    </a>
                    <button type="button "
                            class="btn btn-light btn-custom dropdown-toggle dropdown-toggle-split"
                            data-mdb-ripple-init
                            data-mdb-dropdown-init
                            aria-expanded="false">
                        <span class="visually-hidden">Toggle Dropdown</span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-dark">
                        <li><a href="ConsultationManagement#listConsultation" class="dropdown-item">1. List consultation</a></li>
                        <li><a href="ConsultationManagement#chart" class="dropdown-item">2. Total staff answer</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="PromotionManagement" class="btn btn-light btn-sm btn-custom"data-mdb-ripple-init id="btnPromotion">
                        <i class="fa-solid fa-gift me-2"></i> Promotion <span class="badge badge-notification bg-danger ms-3">${sessionScope.totalPromotion}</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="btn btn-light btn-custom" data-mdb-ripple-init id="btnContract">
                        <i class="fa-solid fa-file-contract me-2"></i>Contract
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="btn btn-light btn-custom"data-mdb-ripple-init id="btnCustomer">
                        <i class="fa-solid fa-user me-2"></i>Customer
                    </a>
                </li>
            </ul>
            <hr class="mt-0 bg-light" style="height: 2px;
                border: none;">
            <div class="dropup">
                <a style="cursor: pointer" 
                   class="d-flex align-items-center  text-decoration-none dropdown-toggle text-white"
                   data-mdb-dropdown-init
                   aria-expanded="false">
                    <img src="images/profile-circle 1.png" class="me-2" width="32" height="32" alt="alt"/>
                    <strong>${sessionScope.user.username}</strong>
                </a>
                <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                    <li>
                        <a href="#" class="dropdown-item">Profile</a>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li>
                        <a href="logout" class="dropdown-item">Sign out <img src="images/sign-out 1.png" width="16" height="16"" alt="alt"/></a>
                    </li>
                </ul>
            </div>
        </div>
    </c:if>














    <!--    Thanh nav của Manager-->
    <c:if test="${sessionScope.user.getRole() == 'Manager'}">
        <div class="dashboard d-flex flex-column sticky-top p-3 bg-custom" style="width: 250px; height: 100vh;">
            <a href="homeManager" class="d-flex align-items-center ms-1 mb-3 me-md-auto  text-decoration-none text-white">
                <img src="images/icon motor.png" class="me-2 mb-1" width="30" height="30" alt="alt"/>
                <span class="fs-5 mt-1">Quản lý</span>
            </a>
            <hr class="mt-0 bg-light" style="height: 2px;
                border: none;">
            <ul class="nav flex-column mb-auto">
                <li class="nav-item">
                    <a href="homeManager" class="btn btn-light btn-sm btn-custom " id="btnHome">
                        <i class="fa-solid fa-house me-2"></i>Home 
                    </a>  
                </li>
                <li class="nav-item btn-group">
                    <a href="listAgency" class="btn btn-light  btn-custom " id="btnConsultation">
                        <i class="fa-solid fa-list me-2"></i>
                        Danh sách đại lý
                    </a>
                </li>
                <li class="nav-item">
                    <a href="customerList" class="btn btn-light btn-sm btn-custom" id="btnPromotion">
                      <i class="fa-regular fa-user me-2"></i>
                        Danh sách khách hàng 
                    </a>
                </li>
            </ul>
            <hr class="mt-0 bg-light" style="height: 2px;
                border: none;">
            <div class="dropup">
                <a style="cursor: pointer" class="d-flex align-items-center text-decoration-none dropdown-toggle text-white" data-mdb-dropdown-init="" aria-expanded="false" data-mdb-dropdown-initialized="true">
                    <img src="images/profile-circle 1.png" class="me-2" width="32" height="32" alt="alt">
                    <strong>${sessionScope.user.username}</strong>
                </a>
                <ul class="dropdown-menu dropdown-menu-dark text-small shadow" style="position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(0px, -33.6px, 0px);" data-popper-placement="top-start" data-mdb-popper="null">
                    <li>
                        <a href="#" class="dropdown-item">Hồ sơ </a>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li>
                        <a href="logout" class="dropdown-item">Đăng xuất<img src="images/sign-out 1.png" width="16" height="16" "="" alt="alt"></a>
                    </li>
                </ul>
            </div>

        </div>

    </c:if>






    <!--mdb bootstrap-->
    <!--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>-->
    <script>
        var currentLocation = window.location.href;
        if (currentLocation.includes("StaffManager")) {
            document.getElementById("btnHome").classList.add("activeDash");
        } else if (currentLocation.includes("ConsultationManagement")) {
            document.getElementById("btnConsultation").classList.add("activeDash");
        } else if (currentLocation.includes("PromotionManagement")) {
            document.getElementById("btnPromotion").classList.add("activeDash");
        } else if (currentLocation.includes("ContractManagement")) {
            document.getElementById("btnContract").classList.add("activeDash");
        }

    </script>