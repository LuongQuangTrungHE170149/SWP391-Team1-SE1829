<%-- 
    Document   : addNews
    Created on : May 21, 2024, 9:48:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/agency.css">
        <link rel="stylesheet" href="CSS/header.css"/>


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Add News</title>
    </head>
    <body>
        <div id="addAgency-page">

            <div>
                <jsp:include page="./header.jsp" />      
            </div>

            <div class="wrraper">
                <div class="container" >
                    <div class="row">
                        <div class="col-md-5">
                            <div class="add-form" style=" width: 1200px; height: 810px; border-radius: 11px ;border: 1px solid #000;" >
                                <div class="add-form__header" style="justify-content: center">
                                    <h4 class="add-form__title">Thông tin news</h4>
                                </div>

                                <div class="form-wrapper" style="margin-left: 100px;">
                                    <form class="add-form-agency" action="addNews" method="post">
                                        <div style="margin-bottom: 10px">
                                            <label class="input-label" for="news-title">Tiêu đề</label></br>
                                            <input type="text" required="" id="news-title" class="input-full" name="newsTitle" style="width:1000px;background: #C3D9B1"/>
                                            <span class="error-messeage"></span>

                                        </div>
                                        <div style="margin-bottom: 10px">
                                            <label class="input-label" for="news-author">Tác giả</label></br>
                                            <input type="text" required="" id="news-author" class="input-full" name="newsAuthor" style="width:1000px;background: #C3D9B1"/>
                                            <span class="error-messeage"></span>

                                        </div>
                                        <div style="margin-bottom: 10px">
                                            <label class="input-label" for="news-type">Thể loại</label></br>
                                            <input type="text" required="" id="news-type" class="input-full" name="newsType" style="width:1000px;background: #C3D9B1"/>
                                            <span class="error-messeage"></span>

                                        </div>
                                        <div style="margin-bottom: 10px">
                                            <label class="input-label" for="news-date">Ngày đăng</label></br>
                                            <input type="date" required="" id="news-date" class="input-full" name="newsDate" style="width:1000px;background: #C3D9B1"/>
                                            <span class="error-messeage"></span>

                                        </div>
                                        <div style="margin-bottom: 10px">
                                            <label class="input-label" for="news-content">Nội dung</label></br>
                                            <textarea id="news-content" name="newsContent" rows="10" cols="133" style="background: #C3D9B1; border-radius: 11px ;border: 1px solid #000"></textarea>
                                            <span class="error-messeage"></span>

                                        </div>
                                        <div style="display: flex; justify-content: end; width: 1000px">
                                            <button type="submit" class="btn btn-save">Đăng bài</button>        
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>     
                <!--Hiện thị thông báo add thành công-->
                <c:if test="${sessionScope.addSuccess != null}">
                    <div class="toast-container top-0 end-0 p-3">
                        <div class="toast align-items-center text-bg-success border-0 fade show" role="alert" aria-live="assertive" aria-atomic="true">
                            <div class="d-flex">
                                <div class="toast-body">
                                    ${sessionScope.addSuccess}
                                </div>
                                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                            </div>
                        </div>
                    </div>
                    <c:remove var="addSuccess" scope="session" />
                </c:if>
                <c:if test="${sessionScope.addFail != null}">
                    <div class="toast-container top-0 end-0 p-3">
                        <div class="toast align-items-center text-bg-success border-0 fade show" role="alert" aria-live="assertive" aria-atomic="true">
                            <div class="d-flex">
                                <div class="toast-body">
                                    ${sessionScope.addFail}
                                </div>
                                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                            </div>
                        </div>
                    </div>
                    <c:remove var="addFail" scope="session" />
                </c:if>
            </div>
        </div>
    </body>
</html>
