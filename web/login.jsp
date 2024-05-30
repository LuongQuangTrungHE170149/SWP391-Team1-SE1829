<%-- 
    Document   : login
    Created on : May 23, 2024, 1:55:29 PM
    Author     : trand
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vn">
    <head>
        <meta charset="utf-8">
        <title>F-Care | Login</title>

        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">-->
        <!--ROBOTO fonts-->
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');
        </style>
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.min.css"rel="stylesheet"/>
        <style>
            body{
                font-family: roboto;
            }
            .gradient-custom-2{
                /*custom*/
                background: rgb(2,0,36);
                background: linear-gradient(62deg, rgba(2,0,36,1) 0%, rgba(65,159,163,1) 40%, rgba(30,187,212,1) 74%, rgba(0,212,255,1) 100%);
            }

            .gradient-custom-1{
                background: rgb(2,0,36);
                background: linear-gradient(270deg, rgba(2,0,36,1) 0%, rgba(65,159,163,1) 40%, rgba(30,187,212,1) 74%, rgba(0,212,255,1) 100%);
            }
            @media (min-width: 768px) {
                .gradient-form {
                    height: 100vh !important;
                }
            }
            @media (min-width: 769px) {
                .gradient-custom-2 {
                    border-top-right-radius: .3rem;
                    border-bottom-right-radius: .3rem;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <!--login form--> 
            <section class="h-100 gradient-form" style="background-color: #eee">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-xl-10">
                            <div class="card rounded-3 text-black">
                                <div class="row g-0">
                                    <div class="col-lg-6">
                                        <div class="card-body p-md-5 mx-md-4">

                                            <div class="text-center">
                                                <img src="images/icon motor color 419fa3.png" alt="f-care" style="width: 80px;"/>
                                                <h4 class="mt-4 mb-3 pb-1" style="color:#419FA3;">Chúng tôi là Bảo Hiểm F-Care</h4>
                                            </div>

                                            <form action="login" method="post">
                                                <p class="text-muted" style="font-size: 16px;">Vui lòng đăng nhập tài khoản của bạn</p>
                                                <p style="color: red">${message}</p>
                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <input type="text" name="usernameEmail" id="input1" class="form-control" required="">
                                                <label for="input1" class="form-label">Username</label>
                                            </div>

                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <input type="password" name="password" id="input2" class="form-control" required="">
                                                <label for="input2" class="form-label">Password</label>
                                            </div>

                                            <div class="text-center pt-1 mb-5 pb-1">
                                                <button type="submit"  class="btn btn-primary btn-block fa-lg gradient-custom-1 mb-3">Đăng nhập</button>
                                                <a href="#" class="text-muted">Quên mật khẩu?</a>
                                            </div>

                                            <div class="d-flex align-items-center justify-content-center pb-4">
                                                <p class="mb-0 me-2">Bạn không có tài khoản?</p>
                                                <button type="button" data-mdb-button-init data-mdb-ripple-init onclick="location.href = 'register'" class="btn btn-outline-danger">Tạo tài khoản</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                                    <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                                        <h4 class="mb-4">Chúng tôi không chỉ là một công ty Bảo Hiểm</h4>
                                        <p class="small mb-0">“Đến với F-Care, chúng tôi cung cấp cho bạn dịch vụ bảo hiểm xe máy với chi phí và chính sách tốt nhất.
                                            Đồng hành cùng bạn mỗi bước đường. Bảo hiểm xe máy cho mọi hành trình!”</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="footer.jsp"></jsp:include>
        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"
        ></script>
        <!-- jQuery can thiet cho bootstrap!! -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


    </body>
</html>

