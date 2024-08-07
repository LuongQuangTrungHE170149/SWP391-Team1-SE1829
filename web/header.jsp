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
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.min.css"rel="stylesheet"/>

<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<body>
    <style>
        body {
            font-family: Roboto !important;
        }
        .navbar-custom {
            background: rgb(0,167,209);
            background: linear-gradient(204deg, rgba(0,167,209,1) 0%, rgba(65,159,163,1) 100%);
        }
        .notification-bell {
            position: relative;
            cursor: pointer;
            margin-left: 20px;
        }
        .notification-count {
            position: absolute;
            top: -5px;
            right: -5px;
            background: red;
            color: white;
            border-radius: 50%;
            padding: 2px 6px;
            font-size: 12px;
        }
        .notification-list {
            display: none;
            position: absolute;
            top: 40px;
            right: 0;
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
            width: 300px;
            max-height: 300px;
            overflow-y: auto;
            z-index: 1000;
        }
        .notification-item {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }
        .notification-item:hover {
            background-color: #f9f9f9;
        }
        .notification-item:last-child {
            border-bottom: none;
        }

        .notify-list {
            display: flex;
            flex-direction: column;
            overflow-y: auto;
            max-height: 100%; /* This makes sure the list doesn't overflow outside the container */
            scrollbar-width: thin; /* Firefox */
        }

        .notification-item {
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }

        .notification-list::-webkit-scrollbar {
            width: 8px;
        }

        .notification-list::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        .notification-list::-webkit-scrollbar-thumb {
            background: #888;
        }

        .notification-list::-webkit-scrollbar-thumb:hover {
            background: #555;
        }
    </style>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light navbar-custom sticky-top bg-body-tertiary">
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
                <c:choose>
                    <c:when test="${sessionScope.user==null || sessionScope.user.getRole() ne 'Manager' && sessionScope.user.getRole() ne 'manager'}">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" style="color:white;" href="home">Trang chủ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" style="color:white;" href="introduce">Giới thiệu</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" 
                                   id="dlink" role="button" 
                                   aria-expanded="false" 
                                   data-mdb-dropdown-init
                                   style="color:white;" 
                                   href="#">Dịch vụ</a>
                                <ul class="dropdown-menu" aria-labelledby="dlink">
                                    <li><a class="dropdown-item" href="motorbikeInsurance">Bảo hiểm xe máy</a></li>
                                </ul>
                            </li>
                            <c:if test="${sessionScope.user.getRole() eq 'Staff' || sessionScope.user.getRole() eq 'staff'}">
                                <li class="nav-item">
                                    <a class="nav-link" style="color:white;" href="staffHome">Quản lý</a>
                                </li>
                            </c:if>
                            <li class="nav-item">
                                <a class="nav-link" style="color:white;" href="promotion">Khuyến mại</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" style="color:white;" href="news">Tin tức</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" style="color:white;" href="searchContract">Tra cứu hợp đồng</a>
                            </li>
                        </ul>
                    </div>
                    <div class="d-flex justify-content-center">
                        <c:if test="${sessionScope.user!= null}">
                            <div class="d-flex justify-content-center align-items-center">
                                <span class="fs-5 text-white me-2">
                                    <c:if test="${sessionScope.user ne null}">
                                        Chào, ${sessionScope.user.getFullName()}
                                    </c:if>
                                </span>
<!--                                 Notification Bell 
-->                                <div class="notification-bell" onclick="toggleNotifications(event)">
                                    <i class="fa-solid fa-bell" style="color:#fff"></i>
                                    <span class="notification-count badge badge-" id="notificationCount">0</span>
                                    <div class="notification-list" id="notificationList">

                                    </div>
                                </div>
                                <!-- User Dropdown -->
                                <div class="dropdown ms-3">
                                    <button type="button" 
                                            class="btn btn-info btn-floating"
                                            id="dropdown-user"
                                            data-mdb-ripple-init
                                            data-mdb-dropdown-init
                                            aria-expanded="false">
                                        <i class="fa-solid fa-user" style="color:#fff"></i>
                                    </button>

                                    <ul class="dropdown-menu" aria-labelledby="dropdown-user">
                                        <li><a href="userProfile" class="dropdown-item">Hồ sơ</a></li>
                                            <c:if test="${sessionScope.user.role eq 'customer' || sessionScope.user.role eq 'Customer'}">
                                            <li><a href="compensationHistory?id=${sessionScope.user.id}" class="dropdown-item">Đền bù</a></li>
                                            <li><a href="manageContractCustomer?customerId=${sessionScope.user.id}" class="dropdown-item">Quản lý hợp đồng</a></li>
                                            <li><a href="accidentHistory?id=${sessionScope.user.id}" class="dropdown-item">Lịch sử tai nạn</a></li>
                                            </c:if>
                                        <li class="dropdown-divider"></li>
                                        <li><a href="logout" class="dropdown-item">Đăng xuất</a></li>
                                    </ul>

                                    <c:if test="${sessionScope.user.role eq 'staff' || sessionScope.user.role eq 'Staff'}">
                                        <ul class="dropdown-menu" aria-labelledby="dropdown-user">
                                            <li><a href="
                                                   <c:if test="${sessionScope.user.role eq 'staff' or sessionScope.user.role eq 'Staff'}">
                                                       staffProfile?staffId=${sessionScope.user.id}
                                                   </c:if>
                                                   " class="dropdown-item">Hồ sơ</a></li>                               
                                            <li class="dropdown-divider"></li>
                                            <li><a href="logout" class="dropdown-item">Đăng xuất</a></li>
                                        </ul>
                                    </c:if>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.user==null}">
                            <a class="btn btn-info me-2" href="login">Đăng Nhập</a>
                            <a class="btn btn-light" href="register">Đăng Ký</a>
                        </c:if>
                    </div>
                </c:when>
                <c:otherwise>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" style="color:white;" href="homeManager">Trang chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="color:white;" href="listAgency">Danh sách đại lý</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="color:white;" href="customerList">Danh sách khách hàng</a>
                        </li>
                    </ul>
                </div>
                <div class="d-flex justify-content-center">
                    <c:if test="${sessionScope.user!=null}">
                        <div class="d-flex justify-content-center align-items-center">
                            <span class="fs-5 text-white me-2">
                                <c:if test="${sessionScope.user ne null}">
                                    Chào, ${sessionScope.user.getFullName()}
                                </c:if>
                            </span>
                            <!-- Notification Bell -->
                            <div class="notification-bell" onclick="toggleNotifications(event)">
                                <i class="fa-solid fa-bell" style="color:#fff"></i>
                                <span class="notification-count" id="notificationCount">#</span>
                                <div class="notification-list" id="notificationList">

                                </div>
                            </div>
                            <!-- User Dropdown -->
                            <div class="dropdown ms-3">
                                <button
                                    class="btn btn-info btn-floating"
                                    id="dropdown-user"
                                    data-toggle="dropdown"
                                    aria-haspopup="true"
                                    aria-expanded="false">
                                    <i class="fa-solid fa-user" style="color:#fff"></i>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdown-user">
                                    <li class="dropdown-item"><a href="userProfile" class="dropdown-item">Hồ sơ</a></li>
                                    <li class="dropdown-divider"></li>
                                    <li class="dropdown-item"><a href="logout" class="dropdown-item">Đăng xuất</a></li>
                                </ul>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.user==null}">
                        <a class="btn btn-info me-2" href="login">Đăng Nhập</a>
                        <a class="btn btn-light" href="register">Đăng Ký</a>
                    </c:if>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</nav>
</body>
<script>
    var isToggle = false;
    function toggleNotifications(event) {
        const notificationList = document.getElementById('notificationList');
        notificationList.style.display = notificationList.style.display === 'none' || notificationList.style.display === '' ? 'block' : 'none';
        var displayCount = document.getElementById('notificationCount');
        displayCount.innerHTML = 0;
        isToggle = !isToggle;
        if (isToggle) {
            $.get("clickNotification", function (data, status) {
                console.log("ok");
            });
        }
    }

    window.onclick = function (event) {
        if (!event.target.matches('.notification-bell') && !event.target.matches('.notification-bell *')) {
            const notificationList = document.getElementById('notificationList');
            if (notificationList.style.display === 'block') {
                notificationList.style.display = 'none';
            }
        }
    };
    let countNotify = 0;
    var userId = '<%= session.getAttribute("userId")%>';
    var wsUri = "ws://" + window.location.host + "/SWP391-Team1-SE1829/notifications" + "/" + userId;
    var websocket = new WebSocket(wsUri);

    websocket.onopen = function (evt) {
        console.log("Connected to WebSocket");
    };

    websocket.onmessage = function (evt) {
        var notification = JSON.parse(evt.data);
        console.log(notification);
        var listNotify = document.getElementById('notificationList');
        let contentNotify = "";

        if (notification.link && notification.link.length > 0) {
            contentNotify = `<div class="notification-item"><a ` + ((notification.isClick == false) ? `class=\"fw-bold\"` : ``) + ` href=\"` + notification.link + `\">` + notification.title + `</a></div>`;
        } else {
            contentNotify = `<div class="notification-item"><p ` + ((notification.isClick == false) ? `class=\"fw-bold\"` : ``) + `>` + notification.title + `</p></div>`;
            console.log(contentNotify);
        }
        listNotify.innerHTML = contentNotify + listNotify.innerHTML;
        if(notification.isClick == false){
            countNotify++;
        };
        var displayCount = document.getElementById('notificationCount');
        displayCount.innerHTML = countNotify;
    };

    websocket.onerror = function (evt) {
        console.error("WebSocket error observed:", evt);
    };

    websocket.onclose = function (evt) {
        console.log("Disconnected from WebSocket");
    };
</script>
