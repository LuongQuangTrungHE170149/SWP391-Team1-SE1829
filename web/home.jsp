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
                    <a href="#" class="service-items-header"><h2>TRUNG TÂM DỊCH VỤ KHÁCH HÀNG</h2></a>
                    <p>Sự ra đời Trung tâm Dịch vụ khách hàng là minh chứng 
                        cho những nỗ lực nhằm hoàn thiện phong cách phục vụ khách hàng chuyên nghiệp của Bảo hiểm F-Care.</p>
                </div>
                <div class="service-items">
                    <a class="simg" href="#" target="_blank"><img src="images/tao hop dong.png" width="100%" height="100%" alt="alt"/></a>
                    <a href="#" class="service-items-header"><h2>TẠO HỢP ĐỒNG BẢO HIỂM</h2></a>
                    <p>Bảo hiểm F-Care là doanh nghiệp đi đầu trong việc bảo đảm tài sản và đền bù thỏa đáng cho khách hàng.</p>
                </div>
                <div class="service-items">
                    <a class="simg" href="#" target="_blank"><img src="images/huong dan sua doi .png" width="100%" height="100%" alt="alt"/></a>
                    <a href="#" class="service-items-header"><h2>HƯỚNG DẪN SỬA ĐỔI, BỔ SUNG/HỦY HỢP ĐỒNG BẢO HIỂM</h2></a>
                    <p>Những hướng dẫn chi tiết và lưu ý quan trọng khi quý khách có yêu cầu sửa đổi, bổ sung và hủy hợp đồng bảo hiểm.</p>
                </div>
                <div class="service-items">
                    <a  class="simg" href="#" target="_blank"><img src="images/huong dan dat mua.png" width="100%" height="100%" alt="alt"/></a>
                    <a href="#" class="service-items-header"><h2>HƯỚNG DẪN ĐẶT MUA, THANH TOÁN, GIAO NHẬN</h2></a>
                    <p>Những hướng dẫn chi tiết và lưu ý quan trọng khi đặt mua, thanh toán và giao nhận giúp khách hàng mua thành công bảo hiểm trực tuyến.</p>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>


        <script src="JS/script.js"></script>
        <script>
                document.addEvenListenner('DOMContentLoaded', () => {
                    const toggleButton = document.getElementById('toggleButton');
                    const registrationPanel = document.getElementById('registrationPanel');
                    const registrationForm = document.getElementById('registrationForm');
                    const consultationForm = document.getElementById('consultationForm');
                    const successMessage = document.getElementById('successMessage');

                    toggleButton.addEventListener('click', () => {
                        registrationPanel.classList.toggle('show');
                        registrationForm.classList.toggle('show');
                    });

                    consultationForm.addEventListener('submit', (e) => {
                        e.preventDefault();

                        //xu ly du lieu dang ky

                        //Hien thi thanh cong
                        successMessage.classList.add('show');

                        //an form dang ky
                        registrationPanel.classList.remove('show');
                        registrationForm.classList.remove('show');

                        //an thong bao sau 3s
                        setTimeout(() => {
                            successMessage.classList.remove('show');
                        }, 3000);
                    });
                });

        </script>
    </body>
</html>

