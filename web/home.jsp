<%-- 
    Document   : HomePage
    Created on : May 18, 2024, 12:40:15 AM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F-Care Insurance | Home</title>
        <link rel="stylesheet" href="CSS/homee.css"/>
    </head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.min.css"rel="stylesheet"/><body>

        <style>
            body{
                font-family: Roboto !important;
            }
        </style>
    <body>

        <jsp:include page="header.jsp"></jsp:include>

        <!-- dang ky tu van -->
        <div class="middle">
            <div class="bg-img"></div>
            <div class="middle-content">
                <div class="f-title">BẢO HIỂM F-Care</div>
                <p class="f-quote">
                    “Đến với F-Care, chúng tôi cung cấp cho bạn dịch vụ bảo hiểm xe máy với chi phí và chính sách tốt nhất.<br />
                    Đồng hành cùng bạn mỗi bước đường. Bảo hiểm xe máy cho mọi hành trình!”
                </p>
            </div>


        </div>

        <!-- Tai sao chon fcare -->
        <div class="content">
            <div class="content-header">
                <h2>TẠI SAO CHỌN F-CARE?</h2>
                <p>luôn thấu hiểu, luôn lắng nghe, sự hài lòng là tuyệt đối!</p>
            </div>
            <div class="content-list">
                <div class="content-items">
                    <img src="images/icon-1.png" alt="alt"/>
                    <h3>Chính Sách Tốt Nhất</h3>
                    <p>Cung cấp chính sách tốt nhất với rủi ro cực kì thấp.</p>
                </div>
                <div class="content-items">
                    <img src="images/icon-2.png" alt="alt"/>
                    <h3>An Toàn</h3>
                    <p>Bảo mật thông tin của khách hàng.</p>
                </div><div class="content-items">
                    <img src="images/icon-3.png" alt="alt"/>
                    <h3>Đảm Bảo Uy Tín</h3>
                    <p>Cam kết làm đúng theo hợp đồng và chính sách đã đề ra.</p>
                </div>
            </div>
        </div>

        <!--trung tam dich vu-->
        <div class="service">
            <div class="service-header">
                <h2>DỊCH VỤ KHÁCH HÀNG</h2>
                <p>Sự ra đời Trung tâm Dịch vụ khách hàng là minh chứng cho những nỗ lực nhằm hoàn thiện phong cách phục 
                    vụ khách hàng chuyên nghiệp của Bảo hiểm F-Care.</p>
            </div>

            <div class="service-list">
                <div class="service-items">
                    <a class="simg" href="#" target="_blank"><img src="images/ho tro khach hang.png" width="100%" height="100%" alt="alt"/></a>
                    <a href="#" class="service-items-header" style="text-decoration: none;"><h2>TRUNG TÂM DỊCH VỤ KHÁCH HÀNG</h2></a>
                    <p>Sự ra đời Trung tâm Dịch vụ khách hàng là minh chứng 
                        cho những nỗ lực nhằm hoàn thiện phong cách phục vụ khách hàng chuyên nghiệp của Bảo hiểm F-Care.</p>
                </div>
                <div class="service-items">
                    <a class="simg" href="#" target="_blank" ><img src="images/tao hop dong.png" width="100%" height="100%" alt="alt"/></a>
                    <a href="#" class="service-items-header" style="text-decoration: none;"><h2>TẠO HỢP ĐỒNG BẢO HIỂM</h2></a>
                    <p>Bảo hiểm F-Care là doanh nghiệp đi đầu trong việc bảo đảm tài sản và đền bù thỏa đáng cho khách hàng.</p>
                </div>
                <div class="service-items">
                    <a class="simg" href="#" target="_blank"><img src="images/huong dan sua doi .png" width="100%" height="100%" alt="alt"/></a>
                    <a href="#" class="service-items-header"style="text-decoration: none;"><h2>HƯỚNG DẪN SỬA ĐỔI, BỔ SUNG/HỦY HỢP ĐỒNG BẢO HIỂM</h2></a>
                    <p>Những hướng dẫn chi tiết và lưu ý quan trọng khi quý khách có yêu cầu sửa đổi, bổ sung và hủy hợp đồng bảo hiểm.</p>
                </div>
                <div class="service-items">
                    <a  class="simg" href="#" target="_blank"><img src="images/huong dan dat mua.png" width="100%" height="100%" alt="alt"/></a>
                    <a href="#" class="service-items-header"style="text-decoration: none;"><h2>HƯỚNG DẪN ĐẶT MUA, THANH TOÁN, GIAO NHẬN</h2></a>
                    <p>Những hướng dẫn chi tiết và lưu ý quan trọng khi đặt mua, thanh toán và giao nhận giúp khách hàng mua thành công bảo hiểm trực tuyến.</p>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

