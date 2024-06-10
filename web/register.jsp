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
                                                <h4 class="mt-4 mb-3 pb-1" style="color:#419FA3;">Register</h4>
                                            </div>

<<<<<<< HEAD
        <div class="form-container">
            <p class="form-heading">Register Form</p>
            <form id="formRegister" method="post" action="register">
                <div class="form-content">
                    <div class="form-item">
                        <label class="label">Username <span class="required">*</span></label>
                        <input type="text" name="username" required>
                    </div>
                    <div class="form-item">
                        <label class="label">Password <span class="required">*</span></label>
                        <input type="password" name="password" required>
                    </div>
                    <div class="form-item">
                        <label class="label">Confirm Password <span class="required">*</span></label>
                        <input type="password" name="confirmPassword" required>
                    </div>
                    <div class="form-item">
                        <label class="label">First Name <span class="required">*</span></label>
                        <input type="text" name="firstName" required>
                    </div>
                    <div class="form-item">
                        <label class="label">Last Name <span class="required">*</span></label>
                        <input type="text" name="lastName" required>
                    </div>
                    <div class="form-item">
                        <label class="label">Phone Number <span class="required">*</span></label>
                        <input type="tel" name="phone" required>
                    </div>
                    <div class="form-item">
                        <label class="label">Date of Birth <span class="required">*</span></label>
                        <input type="date" name="dob" required>
                    </div>
                    <div class="form-item">
                        <label class="label">Address <span class="required">*</span></label>
                        <input type="text" name="address" required>
                    </div>
                    <div class="form-item">
                        <label class="label">Gender <span class="required">*</span></label>
                        <select name="gender" required>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    <div class="form-item">
                        <label class="label">Email Address <span class="required">*</span></label>
                        <input type="email" name="email" required>
                    </div>
                </div>
                <div class="register-button">
                    <button id="registerButton" type="submit">Register</button>
                </div>
            </form>
        </div>
    </body>
=======
                                            <form action="register" method="post">
                                                <p class="text-muted" style="font-size: 16px;">Vui lòng điền thông tin tài khoản của bạn</p>
                                                <div data-mdb-input-init class="form-outline mb-4">
                                                    <input type="text" name="firstName" value="${firstName}" id="input2" class="form-control" required="">
                                                    <label for="input2" class="form-label">First name</label>
                                                </div>
                                                <div data-mdb-input-init class="form-outline mb-4">
                                                    <input type="text" name="lastName" value="${lastName}" id="input2" class="form-control" required="">
                                                    <label for="input2" class="form-label">Last name</label>
                                                </div>
                                                <div data-mdb-input-init class="form-outline mb-4">
                                                    <input type="date" name="dob" id="input2" value="${dob}" class="form-control" required="">
                                                    <label for="input2" class="form-label">Date of Birth</label>
                                                </div>
                                                <div data-mdb-input-init class="form-outline mb-4">
                                                    <span class="m-0 me-3 text-secondary">Gender:</span>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="1" checked=""/>
                                                        <label class="form-check-label" for="inlineRadio1">Male</label>
                                                    </div>

                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="0" ${gender == 0?'checked':''}/>
                                                        <label class="form-check-label" for="inlineRadio2">Female</label>
                                                    </div>
                                                </div>
                                                <div data-mdb-input-init class="form-outline mb-4">
                                                    <input type="text" name="email" id="input2" class="form-control" required="">
                                                    <label for="input2" class="form-label">Email</label>
                                                </div>
                                                <div data-mdb-input-init class="form-outline mb-4">
                                                    <input type="text" name="username" id="input1" class="form-control" required="">
                                                    <label for="input1" class="form-label">Username</label>
                                                </div>
                                                <div data-mdb-input-init class="form-outline mb-4">
                                                    <input type="password" name="password" id="input2" class="form-control" required="">
                                                    <label for="input2" class="form-label">Password</label>
                                                </div>
                                                <div data-mdb-input-init class="form-outline mb-4">
                                                    <input type="password" name="confirmPassword" id="input2" class="form-control" required="">
                                                    <label for="input2" class="form-label">Confirm password</label>
                                                </div>

                                                <div data-mdb-input-init class="form-outline mb-4">
                                                    <input type="text" name="phone" id="input2" class="form-control" required="">
                                                    <label for="input2" class="form-label">Phone number</label>
                                                </div>
                                                <div data-mdb-input-init class="form-outline mb-4">
                                                    <input type="text" name="address" id="input2" class="form-control" required="">
                                                    <label for="input2" class="form-label">Address</label>
                                                </div>
                                                <div class="d-flex align-items-center justify-content-center pb-4">
                                                    <p class="mb-0 me-2">Bạn đã có tài khoản?</p>
                                                    <button type="button" data-mdb-button-init data-mdb-ripple-init onclick="location.href = 'login'" class="btn btn-outline-primary">Đăng nhập</button>
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
>>>>>>> 282610bbabadf61d7d4ac0db91aa8d88cb0b800f
</html>
