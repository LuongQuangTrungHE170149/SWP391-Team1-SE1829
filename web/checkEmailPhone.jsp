<%-- 
    Document   : checkEmailPhone
    Created on : 11 thg 7, 2024, 14:01:02
    Author     : QUANG TRUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kiểm tra số điện thoại hoặc email</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <style>
            #result {
                margin-top: 20px;
                font-size: 16px;
                color: #333;
            }
        </style>
    </head>
    <body>
        <jsp:include page="staffDashboard.jsp"/>

        <div class="main-content" id="main-content">
            <div class="nav navbar bg-light sticky-top justify-content-between align-items-start mb-3 px-2"> 
                <div class="fs-3 fw-bold text-info">Tạo hợp đồng</div>
            </div>
            <div class="text-center fs-3 fw-bold text-info mb-3">Kiểm tra gì gì đó?</div>

            <div style="width: 600px;" class="p-3 m-auto shadow rounded-3">
                <form action="CheckUser" method="post"> 
                    <div class="d-flex">
                        <div class="form-outline" data-mdb-input-init>
                            <input class="form-control" type="text" id="phoneOrEmail" name="phoneOrEmail">
                            <label class="form-label" for="phoneOrEmail">Nhập số điện thoại hoặc email</label>
                        </div>
                        <button class="btn btn-primary ms-3" type="submit" data-mdb-ripple-init>Check</button>
                    </div>
                    <div id="result"></div>
                </form>

            </div>

        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!--mdb bootstrap-->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
    </body>
</html>
