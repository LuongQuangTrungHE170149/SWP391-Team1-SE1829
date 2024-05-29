<%-- 
    Document   : HomePage
    Created on : May 18, 2024, 12:40:15 AM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>F-Care Insurance | Home</title>
        <link rel="stylesheet" href="CSS/home.css"/>

        <style>


        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <!-- dang ky tu van -->
        <jsp:include page="consultation.jsp"></jsp:include>
            <div class="middle" style="margin-top: 75px;">
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



        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <!-- Bootstrap JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
        <!-- Summernote JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.js"></script>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </body>
</html>

