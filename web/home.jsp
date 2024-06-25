<%-- 
    Document   : HomePage
    Created on : May 18, 2024, 12:40:15 AM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html xml:lang>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F-Care Insurance | Home</title>
    </head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.min.css"rel="stylesheet"/>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');
        body{
            font-family: Roboto;
            background-color: #ffffff;
        }


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


        /*form dang ky tu van thong tin*/


        .content{
            display: block;
            width: 80%;
            height: auto;
            /*    background-color: #ccc;*/
            margin: auto;
            margin-top:100px;
        }
        .content-header{
            text-align: center;
        }
        .content-header h2{
            font-size: 40px;
            font-weight: bold;
            margin: 0;
        }
        .content-header p{
            font-size: 20px;
            font-style: italic;
            margin: 20px 0;
        }
        .content-list{
            margin-top: 50px;
            display: flex;
            justify-content: center;
        }
        .content-items{
            text-align: center;
            background-color: #F8F8F8;
            border-radius: 20px;
            padding: 20px;
            width: 400px;
            height: 300px;
            margin: 32px;
        }
        .content-items h3{
            font-size: 36px;
            font-weight: 500;
        }
        .content-items p{
            font-size: 20px;
            color: #8D8D8D;
        }

        .service-header{
            text-align: center;
        }
        .service-header h2{
            font-size: 40px;
            font-weight: bold;
            margin: 0;
        }
        .service-header p{
            font-size: 20px;
            font-style: italic;
            margin: 20px auto;
            width: 900px;
        }

        .service-items{
            height: 100%;
            box-sizing: border-box;
            border: 1px solid rgba(249, 217, 217, 0.8);
            border-top: 3px solid #bb8d09;

        }
        .simg img{
            width: 100%;
            height: 200px;
        }
        .service-items-header h2{
            text-align: center;
            color: #419FA3;
            font-size: 16px;
            margin: 25px 0;
            padding: 0 20px;

        }

        a .service-items-header {
            text-decoration: none;
        }
        .service-items-header h2:hover{
            color: #BB8D09;
        }

        .service-items p{
            padding: 0 10px 10px 10px;
            margin: 0;
            text-align: justify;
            color: #606060;
            font-size: 14px;
        }
        .btn-primary{
            background-color: #419FA3 !important;
        }
        .object-fit-cover{
            object-fit: cover;
        }
        .text-4f4f4f{
            color: #4f4f4f;
        }
        .card:hover{
            background-color: #fff !important;
        }
    </style>
    <body>
        <jsp:include page="header.jsp"/>
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
        <div class="container mt-5">
            <div class="content-header">
                <h2>TẠI SAO CHỌN F-CARE?</h2>
                <p>luôn thấu hiểu, luôn lắng nghe, sự hài lòng là tuyệt đối!</p>
            </div>
            <div class="row content-list mt-5">
                <div class="col-12 col-md-3 content-items shadow-3">
                    <img src="images/icon-1.png" height="80" width="65" alt="terms icon"/>
                    <h2 class="mt-3">Chính Sách Tốt Nhất</h2>
                    <p class="m-0">Cung cấp chính sách tốt nhất với rủi ro cực kì thấp.</p>
                </div>
                <div class="col-12 col-md-3 content-items shadow-3">
                    <img src="images/icon-2.png" height="80" width="65" alt="terms icon"/>
                    <h2 class="mt-3">An Toàn</h2>
                    <p class="m-0">Bảo mật thông tin của khách hàng.</p>
                </div><div class="col-12 col-md-3 content-items shadow-3">
                    <img src="images/icon-3.png" height="80" width="65" alt="terms icon"/>
                    <h2 class="mt-3">Đảm Bảo Uy Tín</h2>
                    <p class="m-0">Cam kết làm đúng theo hợp đồng và chính sách đã đề ra.</p>
                </div>
            </div>
        </div>

        <!--trung tam dich vu-->
        <div class="container mt-5" style="width: 90%;">
            <div class="service">
                <div class="service-header">
                    <h2>DỊCH VỤ KHÁCH HÀNG</h2>
                    <p>Sự ra đời Trung tâm Dịch vụ khách hàng là minh chứng cho những nỗ lực nhằm hoàn thiện phong cách phục 
                        vụ khách hàng chuyên nghiệp của Bảo hiểm F-Care.</p>
                </div>

                <div class="row service-list mt-5">
                    <div class="col-12 col-sm-6 col-md-3 mb-3">
                        <div class="service-items">
                            <a class="simg" href="view?id=3"><img src="images/ho tro khach hang.png"  alt="alt"/></a>
                            <a href="view?id=3" class="service-items-header" style="text-decoration: none;"><h2>TRUNG TÂM DỊCH VỤ KHÁCH HÀNG</h2></a>
                            <p>Sự ra đời Trung tâm Dịch vụ khách hàng là minh chứng 
                                cho những nỗ lực nhằm hoàn thiện phong cách phục vụ khách hàng chuyên nghiệp của Bảo hiểm F-Care.</p>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-3 mb-3">
                        <div class="service-items">
                            <a class="simg" href="#" ><img src="images/tao hop dong.png"  alt="alt"/></a>
                            <a href="#" class="service-items-header" style="text-decoration: none;"><h2>TẠO HỢP ĐỒNG BẢO HIỂM</h2></a>
                            <p>Bảo hiểm F-Care là doanh nghiệp đi đầu trong việc bảo đảm tài sản và đền bù thỏa đáng cho khách hàng.</p>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-3 mb-3">
                        <div class="service-items">
                            <a class="simg" href="view?id=4"><img src="images/huong dan sua doi .png"  alt="alt"/></a>
                            <a href="view?id=4" class="service-items-header"style="text-decoration: none;"><h2>HƯỚNG DẪN SỬA ĐỔI, BỔ SUNG/HỦY HỢP ĐỒNG BẢO HIỂM</h2></a>
                            <p>Những hướng dẫn chi tiết và lưu ý quan trọng khi quý khách có yêu cầu sửa đổi, bổ sung và hủy hợp đồng bảo hiểm.</p>
                        </div>

                    </div>
                    <div class="col-12 col-sm-6 col-md-3 mb-3">
                        <div class="service-items">
                            <a  class="simg" href="view?id=5"><img src="images/huong dan dat mua.png" alt="alt"/></a>
                            <a href="view?id=5" class="service-items-header"style="text-decoration: none;"><h2>HƯỚNG DẪN ĐẶT MUA, THANH TOÁN, GIAO NHẬN</h2></a>
                            <p>Những hướng dẫn chi tiết và lưu ý quan trọng khi đặt mua, thanh toán và giao nhận giúp khách hàng mua thành công bảo hiểm trực tuyến.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Khuyen mai-->
        <c:if test="${not empty listTop3LatestNews}">
            <c:set var="listNews3" value="${listTop3LatestNews}"/>
            <div class="container mt-5">
                <div class="latest-promotion">
                    <hr>
                    <h2 class="mb-3">Tin tức mới nhất</h2>
                    <!--list-->
                    <div class="list-item">
                        <div class="row row-cols-1 row-cols-md-3 g-4">
                            <c:forEach items="${listNews3}" var="a">
                                <div class="col">
                                    <div class="card h-100 hover-shadow" style="background-color: #eee;">
                                        <a href="newsDetail?id=${a.id}"><img class="object-fit-cover card-img-top" style="height: 400px; width: 100%;" src="${a.image}" alt="promotion image"/></a>
                                        <div class="card-body" >
                                            <div class="badge badge-info fs-6 mb-2"> ${a.type}</div>
                                            <a href="newsDetail?id=${a.id}" class="text-4f4f4f"><h5 class="card-title">${a.title}</h5></a>
                                            <p class="card-text">${a.description}</p>
                                            <div class="text-muted">
                                                <i class="fa-regular fa-calendar-days"></i> <fmt:formatDate value="${a.createDate}" pattern="dd/MM/yyyy"/>
                                            </div>  
                                        </div>
                                        <div style="padding: 0 24px 12px;">
                                            <a href="newsDetail?id=${a.id}" class="badge badge-info">Xem chi tiết</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="text-center mt-5 mb-5">
                        <a role="button" href="news" class="btn btn-primary" data-mdb-ripple-init>Xem nhiều tin tức</a>
                    </div>
                    <!--end list-->
                </div>
            </div>
        </c:if>

        <!--Khuyen mai-->
        <c:if test="${not empty listTop3LatestPromotions}">
            <c:set var="list3" value="${listTop3LatestPromotions}"/>
            <div class="container mt-5">
                <div class="latest-promotion">
                    <hr>
                    <h2 class="mb-3">Khuyến mại mới nhất</h2>
                    <!--list-->
                    <div class="list-item">
                        <div class="row row-cols-1 row-cols-md-3 g-4">
                            <c:forEach items="${list3}" var="a">
                                <div class="col">
                                    <div class="card h-100 hover-shadow" style="background-color: #eee;">
                                        <a href="promotionDetail?id=${a.id}"><img class="object-fit-cover card-img-top" style="height: 400px; width: 100%;" src="${a.image}" alt="promotion image"/></a>
                                        <div class="card-body" >
                                            <a href="promotionDetail?id=${a.id}" class="text-4f4f4f"><h5 class="card-title">${a.title}</h5></a>
                                            <p class="card-text">${a.description}</p>
                                        </div>
                                        <div style="padding: 0 24px 12px;">
                                            <a href="promotionDetail?id=${a.id} class="badge badge-info>Xem chi tiết</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="text-center mt-5 mb-5">
                        <a role="button" href="promotion" class="btn btn-primary" data-mdb-ripple-init>Xem nhiều khuyến mại hơn</a>
                    </div>
                    <!--end list-->
                </div>
            </div>
        </c:if>
        <jsp:include page="consultation.jsp"/>
        <jsp:include page="footer.jsp"/>
    </body>
</html>

