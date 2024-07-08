<%-- 
    Document   : terms
    Created on : May 26, 2024, 12:39:18 AM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trung tâm dịch vụ</title>
        <style>
            .middle{
                position: relative;
                width: 100%;
                height: 500px;
                display: block;
                text-align: center;
            }
            .f-title{
                font-size:40px;
                font-weight: bold;
            }
            .f-quote{
                font-size:20px;
                line-height: 30px;
                font-style: italic;
            }
            .bg-img{
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: url('images/side-view-man-with-motorbike.jpg'); /* Thay thế link_to_your_image.jpg bằng URL của ảnh bạn muốn sử dụng */
                background-size: cover;
                background-position: center;

            }
            .bg-img::after {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(16, 12, 12, 0.54); /* Màu của lớp phủ */
            }
            .middle-content{
                position: relative;
                color: white;
                align-content: center;
                height: 100%;
            }

            .intro-section {
                background-color: #f8f9fa;
                padding: 80px 0;
            }
            .intro-text {
                text-align: justify;
            }
            .intro-text h1 {
                font-size: 36px;
                color: #333;
            }
            .intro-text p {
                font-size: 18px;
                color: #666;
            }
        </style>
        <style>
            .active {
                background-color: #419fa3 !important;
                border-color: #419fa3 !important;
            }
            .list-group-item:hover {
                background-color: #f0f0f0;
            }

            .text-419FA3{
                color: #419FA3;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="middle">
            <div class="bg-img"></div>
            <div class="middle-content">
                <div class="f-title">Hỗ Trợ Khách Hàng</div>
            </div>
        </div>
        <div class="container py-4">
            <div class="row">
                <div class="col-md-4 mb-3">
                    <div class="list-group">
                        <a href="view?id=3" class="list-group-item align-items-center d-flex justify-content-between">
                            <span>Trung tâm dịch vụ</span><span class="me-2"><i class="fa-solid fa-chevron-right "></i></span>
                        </a>
                        <a href="view?id=4" class="list-group-item align-items-center d-flex justify-content-between active">
                            <span>Hướng dẫn sủa đổi, bổ sung/ hủy hợp đồng bảo hiểm</span> <span class="me-2"><i class="fa-solid fa-chevron-right"></i></i></span>
                        </a>
                        <a href="view?id=5" class="list-group-item align-items-center d-flex justify-content-between">
                            <span>Hướng dẫn đặt mua, thanh toán & giao nhận</span> <span class="me-2"><i class="fa-solid fa-chevron-right"></i></span>
                        </a>
                    </div>
                </div>
                <div class="col-md-8">
                    <h3 class="fw-bold text-419FA3">HƯỚNG DẪN SỬA ĐỔI, BỔ SUNG/ HỦY HỢP ĐỒNG BẢO HIỂM</h3>
                    <div>
                        <h4 class="text-419FA3">I. SỬA ĐỔI, BỔ SUNG HỢP ĐỒNG BẢO HIỂM</h4>
                        <p class="fw-bold text-419FA3">Các trường hợp được chấp nhận sửa đổi bổ sung bảo hiểm</p>
                        <p>- Thay đổi tên, địa chỉ, số điện thoại</p>
                        <p class="fw-bold text-419FA3">Quy trình sửa đổi bổ sung hợp đồng</p>
                        <div class="row">
                            <div class="col col-lg-4">
                                <div class="border border-1 p-3">
                                    <h3 class="text-419FA3">BƯỚC 1</h3>
                                    <p class="m-0">Yêu cầu sửa đổi, bổ sung</p>
                                </div>
                            </div>
                            <div class="col col-lg-4">
                                <div class="border border-1 p-3">
                                    <h3 class="text-419FA3">BƯỚC 2</h3>
                                    <p class="m-0">Gọi tới số 0327983593</p>
                                </div>
                            </div>
                            <div class="col col-lg-4">
                                <div class="border border-1 p-3">
                                    <h3 class="text-419FA3">BƯỚC 3</h3>
                                    <p class="m-0">F-Care xử lý yêu cầu</p>
                                </div>
                            </div>
                        </div>
                        <h4 class="text-419FA3 pt-3">II. HỦY BỎ HƠP ĐỒNG BẢO HIỂM</h4>
                        <p class="fw-bold text-419FA3">Quy trình hủy bỏ hợp đồng</p>
                        <div class="row">
                            <div class="col col-lg-4">
                                <div class="border border-1 p-3">
                                    <h3 class="text-419FA3">BƯỚC 1</h3>
                                    <p class="m-0">Yêu cầu hủy bỏ hợp đồng</p>
                                </div>
                            </div>
                            <div class="col col-lg-4">
                                <div class="border border-1 p-3">
                                    <h3 class="text-419FA3">BƯỚC 2</h3>
                                    <p class="m-0">Gọi tới số 0327983593</p>
                                </div>
                            </div>
                            <div class="col col-lg-4">
                                <div class="border border-1 p-3">
                                    <h3 class="text-419FA3">BƯỚC 3</h3>
                                    <p class="m-0">F-Care xử lý yêu cầu</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
