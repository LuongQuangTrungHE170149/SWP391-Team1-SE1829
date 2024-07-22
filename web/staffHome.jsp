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
        <title>Staff Home</title>
    </head>
    <style>
        .navbar-custom {
            background: rgb(0,167,209);
            background: linear-gradient(204deg, rgba(0,167,209,1) 0%, rgba(65,159,163,1) 100%);
        }
        body{
            background-color: #f2f0fa !important;
        }
        .tag{
            border-radius: 8px;
            background-color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    </style>
    <body>

        <!--dashboard-->
        <jsp:include page="staffDashboard.jsp"/>

        <!--content-->
        <div class="main-content" id="main-content" >
            <div class="nav navbar sticky-top justify-content-start mb-3 px-2 bg-light">
                <div class="fs-3 fw-bold text-info">Home</div>
            </div>
            <div class="content px-5" >
                <div class="fs-3 fw-bold text-info mb-3">Tổng quan</div>    
                <div class="row">
                    <div class="col-2">
                        <div class="shadow-3 p-3 ps-4 tag">
                            <div>
                                <i class="fa-solid fa-message me-2 fs-2"></i>
                            </div>
                            <div class="text-end">
                                <div class="fw-bold">Trả lời tư vấn</div>
                                <div class="fs-5 fw-bold">${listConByStaff.size()}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="shadow-3 p-3 ps-4 tag">
                            <div>
                                <i class="fa-regular fa-newspaper me-2 fs-2"></i>
                            </div>
                            <div class="text-end">
                                <div class="fw-bold">Tin tức đã thêm</div>
                                <div class="fs-5 fw-bold">${listNewsByStaff.size()}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="shadow-3 p-3 ps-4 tag">
                            <div>
                                <i class="fa-solid fa-gift me-2 fs-2"></i>
                            </div>
                            <div class="text-end">
                                <div class="fw-bold">Khuyến mãi đã thêm</div>
                                <div class="fs-5 fw-bold">${listPromotionByStaff.size()}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="shadow-3 p-3 ps-4 tag">
                            <div>
                                <i class="fa-solid fa-file-contract me-2 fs-2"></i>
                            </div>
                            <div class="text-end">
                                <div class="fw-bold">Hợp đồng đã thêm</div>
                                <div class="fs-5 fw-bold">${listContractByStaff.size()}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="shadow-3 p-3 ps-4 tag">
                            <div>
                                 <i class="fa-solid fa-id-badge me-2 fs-2"></i>
                            </div>
                            <div class="text-end">
                                <div class="fw-bold">Duyệt đền bù</div>
                                <div class="fs-5 fw-bold">${listCompensationByStaff.size()}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
    <!--mdb bootstrap-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
</html>
