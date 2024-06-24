<%-- 
    Document   : promotion
    Created on : 7 thg 6, 2024, 13:15:45
    Author     : thuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tin tức</title>
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
        <div class="middle">
            <div class="bg-img"></div>
            <div class="middle-content">
                <div class="f-title">Tin Tức</div>
            </div>
        </div>

        <div class="main">
            <div class="container" style="padding:40px 0 20px; ">

                <!--featured-->
                <c:if test="${not empty newsHeader}">
                    <c:set var="p" value="${newsHeader}"/>
                    <div class="featured-news" style="margin-bottom: 40px;">
                        <div class="col-12 featured-news-heading">
                            <h2>Tin tức nổi bật</h2>
                        </div>
                        <div class="featured-news-item d-flex shadow-4-strong ps-0" style="height: 420px;">
                            <div class="featured-news-img ps-0" style="height: 100%; width: auto;">
                                <a href="newsDetail?id=${p.id}" ><img class="h-100" src="${p.image}" alt="alt"/></a>
                            </div>
                            <div class="flex-grow-1" style="height: 100%; padding: 45px 36px;">
                                <div class="badge badge-info fs-6 mb-2"> ${p.type}</div>
                                <div class="featured-news-title ">
                                    <a class="fs-5 fw-bold text-4f4f4f" href="newsDetail?id=${p.id}" >${p.title}</a> 
                                </div>
                                <div class="mb-4">
                                    ${p.description}
                                </div>
                                <div class="text-muted">
                                    <i class="fa-regular fa-calendar-days"></i> <fmt:formatDate value="${p.createDate}" pattern="dd/MM/yyyy"/>
                                </div>          



                                <div>
                                    <a href="newsDetail?id=${p.id}"  class="text-4f4f4f badge badge-info rounded-pill">Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <!--end featured-->

                <!--heading-->
                <div class="heading">
                    <h2>Danh sách tin tức</h2>
                </div>
                <!--end heading-->

                <c:if test="${not empty listAll}">
                    <div class="list-item">
                        <div class="row row-cols-1 row-cols-md-3 g-4">
                            <c:forEach items="${listAll}" var="a">
                                <div class="col promotion-item" style="display:none;">
                                    <div class="card h-100 hover-shadow" style="background-color: #eee;">
                                        <a href="newsDetail?id=${a.id}" ><img class="object-fit-cover card-img-top" style="height: 300px; width: 100%;" src="${a.image}" alt="news image"/></a>
                                        <div class="card-body" >
                                            <div class="badge badge-info fs-6 mb-2"> ${a.type}</div>
                                            <a href="newsDetail?id=${a.id}" class="text-4f4f4f"><h5 class="card-title">${a.title}</h5></a>
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
                </c:if>
            </div>
        </div>
        <div class="d-flex justify-content-center mt-4 mb-4">
            <button id="loadMoreBtn" class="btn btn-primary" data-mdb-ripple-init>Xem thêm</button>
            <button id="backToTopBtn" class="btn btn-secondary"data-mdb-ripple-init style="display: none;" onclick="scrollToTop()"><i class="fa-solid fa-arrow-up"></i></button>
        </div>
        <jsp:include page="footer.jsp"/>

        <script>
            const itemsPerPage = 6;
            let currentPage = 0;

            document.addEventListener('DOMContentLoaded', function () {
                showMoreItems();
                document.getElementById('loadMoreBtn').addEventListener('click', showMoreItems);
            });

            function showMoreItems() {
                const items = document.querySelectorAll('.promotion-item');
                const totalItems = items.length;
                const nextPage = currentPage + 1;
                const start = currentPage * itemsPerPage;
                const end = Math.min(nextPage * itemsPerPage, totalItems);

                for (let i = start; i < end; i++) {
                    items[i].style.display = 'block';
                }

                currentPage = nextPage;

                if (end >= totalItems) {
                    document.getElementById('loadMoreBtn').style.display = 'none';
                    document.getElementById('backToTopBtn').style.display = 'block';
                }
            }

            function scrollToTop() {
                window.scrollTo({top: 0, behavior: 'smooth'});
            }
        </script>
    </body>
</html>
