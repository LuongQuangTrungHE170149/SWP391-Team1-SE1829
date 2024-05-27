<%-- 
    Document   : information
    Created on : May 25, 2024, 11:17:40 PM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F-Care | Information</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <style>

            body{
                font-family: Arial,sans-serif;
                margin: 0;
                padding: 0;
            }
            a{
                font-size: 20px;
            }

            .middle{
                position: relative;
                width: 100%;
                height: 500px;
                display: block;
                text-align: center;
                /*    margin-top: 50px;*/


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
    </head>
    <jsp:include page="header.jsp"></jsp:include>
        <body>
            <div class="middle" style="margin-top: 75px;">
                <div class="bg-img"></div>
                <div class="middle-content">
                    <div class="f-title">GIỚI THIỆU</div>
                    <p class="f-quote">
                        “Đến với F-Care, chúng tôi cung cấp cho bạn dịch vụ bảo hiểm xe máy với chi phí và chính sách tốt nhất.<br />
                        Đồng hành cùng bạn mỗi bước đường. Bảo hiểm xe máy cho mọi hành trình!”
                    </p>
                </div>
            </div>
            <section class="intro-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <img src="images/tao hop dong.png" class="img-fluid" alt="F-Care Insurance">
                        </div>
                        <div class="col-md-6 intro-text">
                            <h1>Giới Thiệu Về Bảo Hiểm F-Care</h1>
                            <p>Bảo Hiểm F-Care, được biết đến với tên gọi Bảo Hiểm Xe Máy F-Care, không chỉ đơn thuần là một sản phẩm bảo hiểm thông thường, mà còn là một giải pháp toàn diện mang lại sự an tâm 
                                và tiện ích tối đa cho các chủ nhân xe máy trên mọi nẻo đường.</p>
                            <p>Với cuộc sống hiện đại ngày nay, việc sở hữu một chiếc xe máy không chỉ là phương tiện di chuyển, mà còn là một phần không thể thiếu trong cuộc sống hàng ngày của mỗi người. 
                                Tuy nhiên, đi kèm với sự thuận tiện và linh hoạt của việc sử dụng xe máy là rủi ro về tai nạn giao thông, mất cắp, hoặc hỏng hóc không mong muốn. Đó là lý do tại sao việc bảo hiểm xe máy trở nên cực kỳ quan trọng, và Bảo Hiểm Xe Máy F-Care ra đời như một giải pháp toàn diện để đáp ứng nhu cầu bảo vệ của người sử dụng.</p>
                            <p>Điểm mạnh của Bảo Hiểm F-Care không chỉ là sự bảo vệ về mặt tài chính trong trường hợp tai nạn hoặc thất thoát, mà còn là sự tiện lợi và linh hoạt trong quy trình mua bảo hiểm và đền bù thiệt hại. Với quy trình đơn giản và nhanh chóng, khách hàng có thể dễ dàng mua bảo hiểm và nhận được sự hỗ trợ khi cần thiết một cách nhanh nhất.</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 intro-text">
                            <p>Hơn nữa, Bảo Hiểm F-Care không chỉ dừng lại ở việc cung cấp bảo vệ cơ bản. Nó còn đi kèm với các dịch vụ hỗ trợ khách hàng 24/7, giúp giải quyết mọi vấn đề và tình huống khẩn cấp một cách nhanh chóng và chuyên nghiệp nhất. 
                                Đội ngũ chuyên viên tận tâm và giàu kinh nghiệm sẵn sàng hỗ trợ khách hàng mọi lúc, mọi nơi, từ việc tư vấn chọn gói bảo hiểm phù hợp đến giải đáp mọi thắc mắc liên quan đến chính sách bảo hiểm.</p>
                            <p>Bảo Hiểm Xe Máy F-Care không chỉ là một sản phẩm bảo hiểm, mà còn là một đối tác đáng tin cậy và đồng hành trên mọi chặng đường của cuộc sống. Được xây dựng trên nền tảng cam kết về chất lượng và sự phục vụ tận tâm, F-Care mong muốn trở thành người bạn đồng hành tin cậy của mọi chủ nhân xe máy, 
                                mang lại sự an tâm và tiện ích tối đa trên hành trình của họ.</p>
                        </div>
                    </div>
                </div>
            </section>
        </body>
    <jsp:include page="footer.jsp"></jsp:include>
</html>
