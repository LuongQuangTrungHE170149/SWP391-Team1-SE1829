<%-- 
    Document   : login
    Created on : May 23, 2024, 1:55:29 PM
    Author     : trand
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
          <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <meta charset="utf-8">
        <title>Forgot Password</title>
        <link rel="stylesheet" href="CSS/home.css"/>
        <link rel="stylesheet" href="CSS/header.css"/>
        <link rel="stylesheet" href="CSS/footer.css"/>
    </head>
    <body class="bg-light">
        <jsp:include page="header.jsp"/>
        <div class="row d-flex justify-content-center m-5">
            <div class="col-5">
                <div class="card shadow">
                    <div class="text-center">
                        <h3 class="mb-0 mt-4">Quên mật khẩu</h3>
                    </div>
                    <div class="text-center">
                        <p class="m-0 text-danger">Nhập tên người dùng hoặc email để đổi mật khẩu</p>
                    </div>
                    <form action="forgetPassword" method="POST">
                        <div class="card-body">
                            <div class="row d-flex justify-content-center">
                                <div class="col-12 col-lg-5 pe-0">
                                    <div class="form-outline" data-mdb-input-init>
                                        <label for="usernameEmail" class="form-label"><span class="required"></span></label>
                                        <input type="text" id="usernameEmail" name="usernameEmail" class="form-control" required=""/>
                                    </div>
                                    <p class="m-0 ps-2 text-danger">${message}</p>
                                </div>
                                <div class="col-12 col-lg-3">
                                    <button type="submit" class="btn btn-danger" data-mdb-ripple-init>Tìm</button>
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-center pb-4 mt-3">
                                <p class="mb-0 me-2">Bạn vẫn nhớ mật khẩu ?</p>
                                <button type="button" data-mdb-button-init data-mdb-ripple-init onclick="location.href = 'login'" class="btn btn-outline-primary">Đăng nhập</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>