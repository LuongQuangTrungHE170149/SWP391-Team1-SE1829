<%-- 
    Document   : StaffManager
    Created on : Jun 1, 2024, 2:25:44 AM
    Author     : thuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F-Care | Staff Manager</title>
    </head>
    <style>
        .navbar-custom {
            background: rgb(0,167,209);
            background: linear-gradient(204deg, rgba(0,167,209,1) 0%, rgba(65,159,163,1) 100%);
        }
        body{
            background-color: #eee;z C
        }
    </style>
    <body>

        <!--dashboard-->
        <jsp:include page="staffDashboard.jsp"/>

        <!--content-->
        <div class="main-content" id="main-content">
            <div class="nav navbar sticky-top justify-content-start mb-3 px-2">
                <div class="fs-3 fw-bold text-info">Staff Home</div>
            </div>
            <div class="container" >
                <div class="fs-3 fw-bold text-info" >Tổng quan</div>    
                <div class="row">
                    <div class="col-2 shadow-3 p-3" style="border-radius: 15px;">
                        <div class="text-center">
                            <div>${listNews.size()}</div>
                            <div>Tin tức đã thêm</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
    <!--mdb bootstrap-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
</html>
