<%-- 
    Document   : terms
    Created on : May 26, 2024, 12:39:18 AM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hướng dẫn đặt mua, thanh toán & giao nhận</title>
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
            .bg-419FA3{
                background-color: #419FA3;
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
                        <a href="view?id=4" class="list-group-item align-items-center d-flex justify-content-between ">
                            <span>Hướng dẫn sủa đổi, bổ sung/ hủy hợp đồng bảo hiểm</span> <span class="me-2"><i class="fa-solid fa-chevron-right"></i></i></span>
                        </a>
                        <a href="view?id=5" class="list-group-item align-items-center d-flex justify-content-between active">
                            <span>Hướng dẫn đặt mua, thanh toán & giao nhận</span> <span class="me-2"><i class="fa-solid fa-chevron-right"></i></span>
                        </a>
                    </div>
                </div>
                <div class="col-md-8">
                    <h3 class="fw-bold text-419FA3">HƯỚNG DẪN ĐẶT MUA, THANH TOÁN & GIAO NHẬN</h3>
                    <div>
                        <p class="text-419FA3 fw-bold">Để đăng ký mua bảo hiểm trực tuyến trên website của F-Care, Quý khách thực hiện các bước sau:</p>
                        <div class="row d-flex justify-content-between align-items-center"> 
                            <div class="col col-lg-2 p-0">
                                <div class="rounded rounded-circle bg-419FA3 text-center text-light p-2" style="width: 150px; height: 150px; align-content: center;">
                                    <i class="fa-solid fa-book-open-reader" style="font-size: 60px;"></i>
                                    <h5 class="m-0 mt-3">BƯỚC 1</h5>
                                </div>
                            </div>
                            <div class="col col-lg-1">
                                <i class="fa-solid fa-right-long text-419FA3" style="font-size: 40px;"></i>
                            </div>
                            <div class="col col-lg-2 p-0">
                                <div class="rounded rounded-circle bg-419FA3 text-center text-light p-2" style="width: 150px; height: 150px; align-content: center;">
                                    <i class="fa-solid fa-user-check" style="font-size: 60px;"></i>
                                    <h5 class="m-0 mt-3">BƯỚC 2</h5>
                                </div>
                            </div>
                            <div class="col col-lg-1">
                                <i class="fa-solid fa-right-long text-419FA3" style="font-size: 40px;"></i>
                            </div>
                            <div class="col col-lg-2 p-0">
                                <div class="rounded rounded-circle bg-419FA3 text-center text-light p-2" style="width: 150px; height: 150px; align-content: center;">
                                    <i class="fa-solid fa-file-signature" style="font-size: 60px;"></i>
                                    <h5 class="m-0 mt-3">BƯỚC 3</h5>
                                </div>
                            </div>
                            <div class="col col-lg-1">
                                <i class="fa-solid fa-right-long text-419FA3" style="font-size: 40px;"></i>
                            </div>
                            <div class="col col-lg-2 p-0">
                                <div class="rounded rounded-circle bg-419FA3 text-center text-light p-2" style="width: 150px; height: 150px; align-content: center;">
                                    <i class="fa-solid fa-money-check-dollar" style="font-size: 60px;"></i>
                                    <h5 class="m-0 mt-3">BƯỚC 4</h5>
                                </div>
                            </div>
                        </div>
                        <div class="mt-5">
                            <p class="text-419FA3 fw-bold">Bước 1: Tìm hiểu thông tin về sản phẩm trả phí</p>
                            <p>Quý khách chọn 01 sản phẩm trên trang chủ của website hoặc trên menu chính</p>
                            <p>Quý khách nhập các thông tin website yêu cầu để xem báo phí bảo hiểm</p>
                            <p class="text-419FA3 fw-bold">Bước 2: Đăng nhập/ Đăng ký tài khoản</p>
                            <p>Đăng nhập vào tài khoản của Quý khách trên website bảo hiểm trực tuyến của F-Care hoặc tiến hành đăng ký
                                tài khoản nếu quý khách chưa có tài khoản</p>
                            <p class="text-419FA3 fw-bold">Bước 3: Đăng ký thông tin bảo hiểm</p>
                            <p>Nếu đồng ý tham gia bảo hiểm, Quý khách tiến hành khai báo thông tin về đối tượng bảo hiểm</p>
                            <p>Sau khi Quý khách khai báo đầy đủ thông tin về đơn bảo hiểm theo hướng dẫn, website sẽ hiển thị lại toàn bộ thông tin 
                                yêu cầu bảo hiểm để Quý khách xác nhận lại một lần nữa nội dung trước bước thanh toán phí bảo hiểm</p>
                            <p class="text-419FA3 fw-bold">Bước 4: Thanh toán phí bảo hiểm và giao nhận GIấy chứng nhận bảo hiểm</p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
