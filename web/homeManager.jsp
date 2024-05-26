<%-- 
    Document   : homeManager
    Created on : May 25, 2024, 4:37:55 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/manager.css">
        <link rel="stylesheet" href="CSS/header.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Manager home</title>
    </head>
    <body>

        <jsp:include page="./header.jsp" />      

        <div id="homeManager-page">


            <div class="container home-manager--wrapper">

                <div class="row">
                    <div class="col-md-2">
                        <nav>
                            <div class="sidebar">
                                <ul class="nav-lists">
                                    <li class="list">
                                        <a href="#" class="nav-link">
                                            <span class="link">Dashboard</span>
                                        </a>
                                    </li>
                                    <li class="list">
                                        <a href="#" class="nav-link">
                                            <span class="link">Danh sách khách hàng</span>
                                        </a>
                                    </li>
                                    <li class="list">
                                        <a href="listAgency" class="nav-link">
                                            <span class="link">Danh sách đại lý</span>
                                        </a>
                                    </li>
                                    <li class="list">
                                        <a href="#" class="nav-link">
                                            <span class="link">Danh sách nhân viên</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                    <div class="col-md-10">
                        <div class="home-manager--content">
                            <div style="padding: 20px;">
                                <span class="title"><strong>Tổng quan</strong></span>
                                <div class="row" style="display: flex; justify-content: center;">

                                    <div class="col-md-3 ">
                                        <div class="wrapper">
                                            <span class="sub-title"><strong>Số khách hàng</strong></span>
                                        </div>


                                    </div>
                                    <div class="col-md-3 ">
                                        <div class="wrapper">
                                            <span class="sub-title"><strong>Số khách hàng</strong></span>
                                        </div>
                                    </div>
                                    <div class="col-md-3 ">
                                        <div class="wrapper">
                                            <span class="sub-title"><strong>Số khách hàng</strong></span>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


        </div>
    </body>
</html>
