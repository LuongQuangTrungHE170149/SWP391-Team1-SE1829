<%-- 
    Document   : error
    Created on : May 31, 2024, 6:52:31 PM
    Author     : thuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"rel="stylesheet"/>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"rel="stylesheet"/>
        <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.min.css"rel="stylesheet"/><body>

    </head>
<body style="font-family: Roboto">
    <jsp:include page="header.jsp"></jsp:include>

        
        <!-- Navbar -->
        <div class="main">
            <div class="container  m-auto mt-2 mb-2 pt-4 text-center shadow-lg" style="width: 40%; height: 300px">
                <div class="fs-1 fw-bold" style="color: #419FA3;">Bảo Hiểm F-Care</div>
                <div class="content d-flex flex-column align-items-center justify-content-center">
                <c:if test="${loginFirst!= null}">
                    <h2 class="text-danger">${loginFirst}</h2>
                    <div class="text-muted">Đăng nhập tại đây</div>
                    <button type="button" 
                            onclick="location.href = 'login'" 
                            class="btn btn-info">Đăng nhập</button>
                </c:if>
                <c:if test="${error!= null}">
                    <h2 class="text-danger">${error}</h2>
                    <div class="text-muted">quay lại trang chủ</div>
                    <button type="button" 
                            onclick="location.href = 'home'" 
                            class="btn btn-info">Trang chủ</button>
                </c:if>
            </div>

        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
