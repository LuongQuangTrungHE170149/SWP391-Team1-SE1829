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
                border-color:  #419fa3 !important;
            }
            .list-group-item:hover {
                background-color: #f0f0f0;
            }
        </style>
    </head>
    <body>
        <jsp:include page="spinnerLoading.jsp"/>
        <jsp:include page="header.jsp"/>
        <div class="middle">
            <div class="bg-img"></div>
            <div class="middle-content">
                <div class="f-title">Trung Tâm Dịch Vụ</div>
            </div>
        </div>
        <div class="container py-4">
            <div class="row">
                <div class="col-md-4 mb-3">
                    <div class="list-group">
                        <a href="view?id=3" class="list-group-item align-items-center d-flex justify-content-between active">
                            <span>Trung tâm dịch vụ</span><span class="me-2"><i class="fa-solid fa-chevron-right"></i></span>
                        </a>
                        <a href="view?id=4" class="list-group-item align-items-center d-flex justify-content-between">
                            <span>Hướng dẫn sửa đổi, bổ sung/ hủy hợp đồng bảo hiểm</span> <span class="me-2"><i class="fa-solid fa-chevron-right"></i></span>
                        </a>
                        <a href="view?id=5" class="list-group-item align-items-center d-flex justify-content-between">
                            <span>Hướng dẫn đặt mua, thanh toán & giao nhận</span> <span class="me-2"><i class="fa-solid fa-chevron-right"></i></span>
                        </a>
                    </div>
                </div>
                <div class="col-md-8">
                    <h3 style="color: #419FA3;">TRUNG TÂM DỊCH VỤ</h3>
                    <div>
                        <p>Bảo hiểm F-Care là doanh nghiệp tiên phong cung cấp dịch vụ chăm sóc khách hàng trong 
                            lĩnh vực bảo hiểm. Sự ra đời của trung tâm Dịch cụ khách hàng là minh chứng cho những nỗ lực nhằm hoàn thiện phong cách phục vụ khách hàng chuyên nghiệp của Bảo hiểm F-Care.</p>
                        <p class="fw-bold" style="color:#419FA3;">Với chức năng hai trong một, vừa là "Kênh tư vấn thông tin" vừa là "Kênh giao dịch", 
                            các hoạt động chính của Trung tâm Dịch vụ Khách hàng bao gồm:</p>
                        <p>- Tư vấn sản phẩm, dịch vụ bảo hiểm.</p>
                        <p>- Tiếp nhận khai báo tai nạn và yêu cầu bồi thường và thanh toán tiền bảo hiểm</p>
                        <p>- Hướng dẫn thủ tục lập hồ sơ bồi thường và toàn tiền bảo hiểm</p>
                        <p>- Tiếp nhận đóng góp ý kiến về các sản phẩm, dịch vụ bảo hiểm</p>
                        <p>- Thông tin tổng hợp về doanh nghiệp</p>
                        <p class="fw-bold" style="color:#419FA3;">Đội ngũ nhân viên của Bảo hiểm F-Care rất hân hạnh được phục vụ Quý khách hàng</p>
                        <p>- Đường dây nóng 24/7: 03279983593</p>
                        <p>- Email: fcareinsurance@gmail.com</p>
                        <p class="fw-bold" style="color:#419FA3;">Hãy cùng tận hưởng những dịch vụ hoàn hảo nhất của F-Care cùng Trung tâm dịch vụ khách hàng!</p>
                    </div>

                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
