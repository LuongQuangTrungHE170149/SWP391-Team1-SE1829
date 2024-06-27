<%-- 
    Document   : login
    Created on : May 23, 2024, 1:55:29 PM
    Author     : kha21
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F-Care | Login</title>
        <style>

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
            <section class="h-100 gradient-form" style="background-color: #eee;">
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
                                                <label for="input1" class="form-label">Tài khoản</label>
                                            </div>

                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <input type="password" name="password" id="input2" class="form-control" required="">
                                                <label for="input2" class="form-label">Mật khẩu</label>
                                            </div>

                                            <div class="text-center pt-1 mb-5 pb-1">
                                                <button type="submit"  class="btn btn-primary btn-block fa-lg gradient-custom-1 mb-3">Đăng nhập</button>
                                                <a href="forgetPassword" class="text-muted">Quên mật khẩu?</a>
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
        <jsp:include page="consultation.jsp"></jsp:include>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

