<%-- 
    Document   : staffDashboard
    Created on : May 30, 2024, 9:06:27 PM
    Author     : thuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<link rel="stylesheet" href="CSS/staffDashboardDhung.css"/>
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"rel="stylesheet"/>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"rel="stylesheet"/>
<!-- MDB -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.min.css"rel="stylesheet"/><body>
    <style>
        /*
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/CascadeStyleSheet.css to edit this template
        */
        /* 
            Created on : May 30, 2024, 9:08:40 PM
            Author     : thuhu
        */


        body{
            font-family: Roboto;
        }
        .bg-custom{
            background: rgb(5,96,116);
            background: linear-gradient(0deg, rgba(5,96,116,1) 0%, rgba(65,159,163,1) 100%);
        }
        .container{
            width: 100%;
        }

        .bg-primary{
            background-color: #419FA3 !important;
        }
        .btn-primary{
            background-color: #419FA3 !important;
            border-color: #419FA3;
        }
        .active{

        }

        .dashboard{
            display: flex;
            height: 100vh;
            position: fixed;
            z-index: 1000;
        }
        .content{
            margin-left:400px;
            width: 70%;
            display: flex;
            flex-direction: column;
            /*justify-content: center;*/
            /*align-content: center;*/
            /*align-items: center;*/
        }
        .btn-custom{
            width: 100%;
            height: 60px;
            margin-bottom: 8px;
            display: flex;
            justify-content: start;
            align-items: center;
            font-size: 14px;
        }
    </style>
    <div class="dashboard flex-column flex-shrink-1 sticky-left p-3  bg-custom" style="width: 280px;">
        <a href="#" class="d-flex align-items-center ms-1 mb-3  me-md-auto  text-decoration-none text-white">
            <img src="images/icon motor.png" class="me-2 mb-1" width="40" height="40" alt="alt"/>
            <span class="fs-4 mt-1">Staff Manager</span>
        </a>
        <hr class="mt-0 bg-light" style="height: 2px; border: none;">
        <ul class="nav flex-column mb-auto">
            <li class="nav-item">
                <a href="staffManager" class="btn btn-light btn-custom   ">
                    <i class="fa-solid fa-house me-2"></i>Home 
                </a>
            </li>
            <li class="nav-item">
                <a href="ConsultationManagement" class="btn btn-light btn-custom active">
                    <i class="fa-solid fa-message me-2"></i> Consultation
                </a>
            </li>
            <li class="nav-item">
                <a href="PromotionManagement" class="btn btn-light btn-custom    ">
                    <i class="fa-solid fa-gift me-2"></i> Promotion 
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="btn btn-light btn-custom    ">
                    <i class="fa-solid fa-file-contract me-2"></i>Contract
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="btn btn-light btn-custom   ">
                    <i class="fa-solid fa-user me-2"></i>Customer
                </a>
            </li>
        </ul>
        <hr class="mt-0 bg-light" style="height: 2px; border: none;">
        <div class="dropup">
            <a style="cursor: pointer" 
               class="d-flex align-items-center  text-decoration-none dropdown-toggle text-white"
               data-mdb-dropdown-init
               aria-expanded="false">
                <img src="images/profile-circle 1.png" class="me-2" width="32" height="32" alt="alt"/>
                <strong>Staff</strong>
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

    <!--mdb bootstrap-->
    <!--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>-->