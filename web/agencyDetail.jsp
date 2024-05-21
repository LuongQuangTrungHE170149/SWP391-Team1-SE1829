<%-- 
    Document   : agencyDetail
    Created on : May 21, 2024, 9:25:56 PM
    Author     : tranm
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
        <title>Agency detail</title>
    </head>
    <body>
        <div id="agencyDetail-page">
            <div>
                <jsp:include page="./header.jsp" />      
            </div>
            <div class="wrraper">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 agency-info">
                            <c:set var="agency" value="${requestScope.agency}"/>
                            <div class="agency-info--wrapper">
                                <div class="agency-info-detail">
                                    <span><strong>Tên đại lý: </strong></span>
                                    <p>${agency.agencyName}</p>
                                </div>
                                <div class="agency-info-detail">
                                    <span><strong>Địa chỉ: </strong></span>
                                    <p>${agency.agencyAddress}</p>
                                </div>
                                <div class="agency-info-detail">
                                    <span><strong>Hotline: </strong></span>
                                    <p>${agency.hotline}</p>
                                </div>
                                <div class="agency-info-detail">
                                    <span><strong>Giờ làm việc: </strong></span>
                                    <p>${agency.worktime}</p>
                                </div>
                                <div class="agency-info-detail">
                                    <span><strong>Trạng thái: </strong></span>
                                    <p>${agency.status eq "active" ? "Hoạt động" : "Dừng hoạt động"}</p>
                                </div>
                            </div>
                            <a href="" class="btn btn-edit">Sửa</a>

                        </div>
                        <div class="col-md-1">

                        </div>
                        <div class="col-md-7 agency-review">

                        </div>
                    </div>
                    <div class="row" style="margin-top: 30px;">
                        <div class="agency-staffs">
                            <h4 style="text-align: center; margin-top: 10px;"><span>Danh sách nhân viên</span></h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
