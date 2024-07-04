<%-- 
    Document   : promotionDetail
    Created on : 8 thg 6, 2024, 11:26:57
    Author     : thuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết tin tức</title>
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
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="spinnerLoading.jsp"/>
        <div class="middle">
            <div class="bg-img"></div>
            <div class="middle-content">
                <div class="f-title">Chi Tiết Tin Tức</div>
            </div>
        </div>
        <div class="main">
            <div class="container pb-4">
                <div class="mt-3 mb-3">
                    <button type="button" class="btn btn-secondary btn-sm" data-mdb-ripple-init onclick="goBack()">Trở về</button>
                </div>
                <div class="row d-flex">
                    <div class="col-12 col-md-9">
                        <div class="badge badge-info fs-6 mb-2"> ${p.type}</div>
                        <div>
                            <h2>${p.title}</h2>
                        </div>
                        <div class="text-info fs-5">
                            ${p.description}
                        </div>
                        <div class="text-muted">
                            <i class="fa-regular fa-calendar-days"></i> <fmt:formatDate value="${p.createDate}" pattern="dd/MM/yyyy"/>
                        </div>
                        <hr style="margin: 32px 0;">
                        <div class="mb-3">
                            <img src="${p.image}" class="object-fit-cover" style="width: 100%; height: 500px;" alt="promtion image"/>
                        </div>
                        <div>
                            ${p.content}
                        </div>
                        <hr style="margin: 32px 0;">
                        <div class="d-flex align-items-center">
                            <div class="fs-5">Share:</div>
                            <ul class="d-flex m-0" style="list-style: none;">
                                <li class="list-item m-1">
                                    <a href="#" role="button" class="btn btn-primary btn-floating" data-mdb-ripple-init>
                                        <i class="fa-brands fa-facebook-f"></i>
                                    </a>
                                </li>
                                <li class="list-item m-1">
                                    <a href="#" role="button" class="btn btn-primary btn-floating" data-mdb-ripple-init>
                                        <i class="fa-brands fa-instagram"></i>
                                    </a>
                                </li>
                                <li class="list-item m-1">
                                    <a href="#" role="button" class="btn btn-primary btn-floating" data-mdb-ripple-init>
                                        <i class="fa-brands fa-linkedin-in"></i>
                                    </a>
                                </li>
                            </ul>

                        </div>
                    </div>
                    <c:if test="${not empty listTop3LatestNews}">
                        <c:set var="list3" value="${listTop3LatestNews}"/>
                        <div class="col-12 col-md-3">
                            <div class="latest-promotion">
                                <h5>Tin tức mới nhất</h5>
                                <hr>

                                <!--list-->
                                <div class="list-item">
                                    <div class="row row-cols-1 g-4">
                                        <c:forEach items="${list3}" var="a">
                                            <div class="col">
                                                <div class="card h-100 hover-shadow" style="background-color: #eee;">
                                                    <a href="newsDetail?id=${a.id}" target="_blank"><img class="object-fit-cover card-img-top" style="height: 200px; width: 100%;" src="${a.image}" alt="news image"/></a>
                                                    <div class="card-body" >
                                                        <div class="badge badge-info fs-6 mb-2"> ${a.type}</div>
                                                        <a href="newsDetail?id=${a.id}"target="_blank" class="text-4f4f4f"><h5 class="card-title">${a.title}</h5></a>
                                                        <p class="card-text">${a.description}</p>
                                                        <div class="text-muted">
                                                            <i class="fa-regular fa-calendar-days"></i> <fmt:formatDate value="${a.createDate}" pattern="dd/MM/yyyy"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <!--end list-->

                                <div class="text-center mt-3">
                                    <a role="button" href="promotion" target="_blank" class="btn btn-primary" data-mdb-ripple-init>Xem nhiều tin tức hơn</a>
                                </div>
                            </div>
                        </div>

                    </c:if>
                </div>

            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </body>
</html>
