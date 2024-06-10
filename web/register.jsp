<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>F-Care | Register</title>
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
        <jsp:include page="header.jsp"/>
        <jsp:include page="consultation.jsp"/>
        <!--login form--> 
        <section class="h-100 gradient-form" style="background-color: #eee;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-6">
                        <div class="card rounded-3 text-black">
                            <div class="row g-0">
                                <div class="col-12">
                                    <div class="card-body p-md-5 mx-md-4">
                                        <div class="text-start d-flex align-items-center">
                                            <img src="images/icon motor color 419fa3.png" alt="f-care" width="50"height=50""/>
                                            <h2 class="mt-4 mb-3 ms-3 pb-1" style="color:#419FA3;">Register</h2>
                                        </div>
                                        <form action="register" method="post">
                                            <p class="text-muted" style="font-size: 16px;">Vui lòng điền thông tin tài khoản của bạn</p>
                                            <div class="row">
                                                <div class="col-6">
                                                    <div data-mdb-input-init class="form-outline mb-4">
                                                        <input type="text" name="firstName" value="${firstName}" id="input2" class="form-control" required/>
                                                        <label for="input2" class="form-label">First name</label>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div data-mdb-input-init class="form-outline mb-4">
                                                        <input type="text" name="lastName" value="${lastName}" id="input2" class="form-control" required="">
                                                        <label for="input2" class="form-label">Last name</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-6">
                                                    <div data-mdb-input-init class="form-outline mb-4">
                                                        <input type="date" name="dob" id="input2" value="${dob}" class="form-control" required="">
                                                        <label for="input2" class="form-label">Date of Birth</label>
                                                    </div>
                                                </div>

                                                <div class="col-6">
                                                    <select data-mdb-select-init name="gender" class="form-select" aria-label="selectEx">
                                                        <option value="1"${gender == 1?'selected':''}>Male</option>
                                                        <option value="0"${gender == 0?'selected':''}>Female</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <p class="m-0 text-danger">${invalidEmail}</p>
                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <input type="email" name="email" value="${email}" id="input2" class="form-control" required="">
                                                <label for="input2" class="form-label">Email</label>
                                            </div>
                                            <p class="m-0 text-danger">${invalidUsername}</p>
                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <input type="text" name="username" value="${username}" id="input1" class="form-control" required="">
                                                <label for="input1" class="form-label">Username</label>
                                            </div>
                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <input type="password" name="password" value="${password}" id="input2" class="form-control" required="">
                                                <label for="input2" class="form-label">Password</label>
                                            </div>
                                            <p class="m-0 text-danger">${invalidConfirmPassword}</p>
                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <input type="password" name="confirmPassword" id="input2" class="form-control" required="">
                                                <label for="input2" class="form-label">Confirm password</label>
                                            </div>
                                            <p class="m-0 text-danger">${invalidPhone}</p>
                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <input type="text" name="phone" value="${phone}" id="input2" class="form-control" required="">
                                                <label for="input2" class="form-label">Phone number</label>
                                            </div>
                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <input type="text" name="address" value="${address}" id="input2" class="form-control" required="">
                                                <label for="input2" class="form-label">Address</label>
                                            </div>
                                            <div class="text-center pt-1 mb-5 pb-1">
                                                <p class="m-0 text-success">${success}</p>
                                                <button type="submit"  class="btn btn-primary btn-block fa-lg gradient-custom-1 mb-3">Đăng ký</button>

                                            </div>
                                            <div class="d-flex align-items-center justify-content-center pb-4">
                                                <p class="mb-0 me-2">Bạn đã có tài khoản?</p>
                                                <button type="button" data-mdb-button-init data-mdb-ripple-init onclick="location.href = 'login'" class="btn btn-outline-primary">Đăng nhập</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <jsp:include page="consultation.jsp"/>
        <jsp:include page="footer.jsp"/>
    </body>

</html>
