<%-- 
    Document   : StaffManager
    Created on : Jun 1, 2024, 2:25:44 AM
    Author     : thuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Home</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
                    <div class="col-6 col-lg-3">
                        <div class="shadow-3 p-3 ps-4 tag mb-4">
                            <div class="text-primary">
                                <i class="fa-solid fa-file-contract fs-2"></i>
                            </div>
                            <div class="text-end">
                                <div class="fw-bold">Hợp đồng đã thêm</div>
                                <div class="fs-5 fw-bold">${listContractByStaff.size()}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3">
                        <div class="shadow-3 p-3 ps-4 tag mb-4">
                            <div class="text-primary">
                                <i class="fa-solid fa-user fs-2"></i>
                            </div>
                            <div class="text-end">
                                <div class="fw-bold">Khách hàng</div>
                                <div class="fs-5 fw-bold">${totalCustomerByStaff}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3">
                        <div class="shadow-3 p-3 ps-4 tag mb-4">
                            <div class="text-primary">
                                <i class="fa-solid fa-id-badge fs-2"></i>
                            </div>
                            <div class="text-end">
                                <div class="fw-bold">Duyệt bồi thường</div>
                                <div class="fs-5 fw-bold">${listCompensationByStaff.size()}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3">
                        <div class="shadow-3 p-3 ps-4 tag mb-4">
                            <div class="text-primary">
                                <i class="fa-solid fa-message fs-2"></i>
                            </div>
                            <div class="text-end">
                                <div class="fw-bold">Trả lời tư vấn</div>
                                <div class="fs-5 fw-bold">${listConByStaff.size()}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3">
                        <div class="shadow-3 p-3 ps-4 tag mb-4">
                            <div class="text-primary">
                                <i class="fa-regular fa-newspaper fs-2"></i>
                            </div>
                            <div class="text-end">
                                <div class="fw-bold">Tin tức đã thêm</div>
                                <div class="fs-5 fw-bold">${listNewsByStaff.size()}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3">
                        <div class="shadow-3 p-3 ps-4 tag mb-4">
                            <div class="text-primary">
                                <i class="fa-solid fa-gift fs-2"></i>
                            </div>
                            <div class="text-end">
                                <div class="fw-bold">Khuyến mãi đã thêm</div>
                                <div class="fs-5 fw-bold">${listPromotionByStaff.size()}</div>
                            </div>
                        </div>
                    </div>

                    <div class="col-6 col-lg-3">
                        <div class="shadow-3 p-3 ps-4 tag mb-4">
                            <div class="text-primary">
                                <i class="fa-solid fa-dollar-sign fs-2"></i>
                            </div>
                            <div class="text-end">
                                <div class="fw-bold">Doanh thu</div>
                                <div class="fs-5 fw-bold"><fmt:formatNumber value="${totalMoney}" type="currency" currencyCode="VND"/></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="px-5 py-4 mb-4" style="background-color: #fff; border-radius: 8px;">
                    <div class="fs-3 fw-bold text-info">Thống kê doanh thu</div>
                    <canvas id="revenueChart" width="400" height="200"></canvas>
                </div>
            </div>
        </div>

    </body>
    <!--mdb bootstrap-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Nhận dữ liệu JSON từ Servlet
        var monthlyMoneyByStaff = JSON.parse('${monthlyMoneyByStaff}');

        // Chuyển đổi dữ liệu thành định dạng phù hợp cho Chart.js
        var labels = [];
        var data = [];

        for (var key in monthlyMoneyByStaff) {
            if (monthlyMoneyByStaff.hasOwnProperty(key)) {
                labels.push(key);
                data.push(monthlyMoneyByStaff[key]);
            }
        }

        // Cấu hình biểu đồ
        var ctx = document.getElementById('revenueChart').getContext('2d');
        var revenueChart = new Chart(ctx, {
            type: 'bar', // Có thể thay đổi thành 'line' hoặc loại biểu đồ khác nếu muốn
            data: {
                labels: labels,
                datasets: [{
                        label: 'Doanh thu theo tháng',
                        data: data,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</html>
