<%-- 
    Document   : customerAdd
    Created on : Jun 11, 2024, 4:00:36 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/agency.css">
        <title>Thêm khách hàng</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
    </head>
    <body>
        <jsp:include page="staffDashboard.jsp"/>

        <div class="main-content" id="main-content">
            <div class="nav navbar bg-light sticky-top justify-content-between align-items-start px-2"> 
                <div class="fs-3 fw-bold text-info">Danh sách khách hàng</div>
            </div>
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
            <div class="container">
                <div class="card mt-5 m-auto" style="width: 500px;">
                    <div class="card-header">
                        <div class="d-flex justify-content-between">
                            <div class="fs-3 fw-bold text-info">Thêm khách hàng</div>
                            <div>
                                <a href="customerList" class="btn btn-sm btn-rounded btn-primary"> 
                                    <i class="fa-solid fa-chevron-left"></i>
                                    Quay lại
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form action="customerAdd" method="post">
                            <div class="row mb-3">
                                <div class="col-6">
                                    <div class="form-outline" data-mdb-input-init>
                                        <input type="text" required="" id="first-name" class="form-control" name="firstName" value="${firstName}"/>
                                        <label class="form-label" for="first-name">Họ</label>
                                    </div>
                                    <span class="error-messeage"></span>
                                </div>
                                <div class="col-6">
                                    <div class="form-outline" data-mdb-input-init>
                                        <input type="text" required="" id="last-name" class="form-control" name="lastName" value="${lastName}"/>
                                        <label class="form-label" for="last-name">Tên</label>
                                    </div>
                                    <span class="error-messeage"></span>
                                </div>
                            </div>
                            <div class="form-outline mb-3" data-mdb-input-init>
                                <input type="text" required="" id="customer-Address" class="form-control" name="address" value="${address}"/>
                                <label class="form-label" for="customer-Address">Địa chỉ</label>
                            </div>
                            <span class="error-messeage"></span>

                            <div class="row mb-3">
                                <div class="col-6">
                                    <div class="form-outline mb-3" data-mdb-input-init>
                                        <input type="text" required="" id="customer-dob" class="form-control" name="dob" value="${dob}"/>
                                        <label class="form-label" for="customer-dob">Năm sinh</label>
                                    </div>
                                    <span class="error-messeage"></span>
                                </div>
                                <div class="col-6">
                                    <div>
                                        <select class="form-select" name="gender">
                                            <option value="0" >Nam</option>
                                            <option value="1">Nữ</option>
                                            <option value="2">Khác</option>
                                        </select>
                                    </div>
                                </div>
                            </div>


                            <div class="row mb-3">
                                <div class="col-6">
                                    <div class="form-outline mb-3" data-mdb-input-init>
                                        <input type="text" required="" id="customer-phone" class="form-control" name="phone" value="${phone}"/>
                                        <label class="form-label" for="customer-phone">Điện thoại</label>
                                    </div>
                                    <span class="error-messeage"></span>
                                    <p class="m-0 text-danger">${invalidPhone}</p>
                                </div>
                                <div class="col-6">
                                    <div class="form-outline mb-3" data-mdb-input-init>
                                        <input type="email" required="" id="customer-Email" class="form-control" name="email" value="${email}"/>
                                        <label class="form-label" for="customer-Email">Email</label>
                                    </div>     
                                    <p class="m-0 text-danger">${invalidEmail}</p>
                                </div>
                            </div>


                            <div class="form-outline mb-3" data-mdb-input-init>
                                <input type="text" required="" id="username" class="form-control" name="username" value="${username}"/>
                                <label class="form-label" for="username">Tên đăng nhập</label>
                            </div>   
                            <p class="m-0 text-danger">${invalidUsername}</p>

                            <div class="form-outline mb-3" data-mdb-input-init>
                                <input type="password" required="" id="customer-password" class="form-control" name="password"/>
                                <label class="form-label" for="customer-password">Mật khẩu</label>
                            </div>   
                            <div class="form-outline mb-3" data-mdb-input-init>
                                <input type="password" required="" id="customer-confirmpassword" class="form-control" name="confirmPassword"/>
                                <label class="form-label" for="customer-confirmpassword">Xác nhận mật khẩu</label>
                            </div>   
                            <p class="m-0 text-danger">${invalidConfirmPassword}</p>

                            <div class="d-flex justify-content-between">
                                <button type="reset" class="btn btn-rounded btn-danger" data-mdb-ripple-init>Hủy</button>                      
                                <button type="submit" class="btn btn-primary btn-rounded" data-mdb-ripple-init>Thêm</button>        

                            </div>
                        </form>
                    </div>
                </div>
            </div> 
        </div>





        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
        <script>
            const phone = document.getElementById("customer-phone");
            const dob = document.getElementById("customer-dob");
            const form = document.querySelector(".add-form-customer");
            const validationPhone = (value) => {
                const phoneRegex = /^(0[1-9])+([0-9]{8})$/;
                return phoneRegex.test(value) ? undefined : "Nhập số điện thoại hợp lệ";
            }

            const validationDob = (value) => {
                const dobRegex = /(^0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-(\d{4}$)/;
                return dobRegex.test(value) ? undefined : "Nhập số ngày sinh hợp lệ (dd-mm-yyyy)";
            }

            var isValid = true;
            phone.onblur = () => {
                var errorElement = phone.parentElement.querySelector(".error-messeage");
                var errorMessage = validationPhone(phone.value);
                if (errorMessage) {
                    errorElement.innerText = errorMessage;
                    phone.parentElement.classList.add('invalid');
                    isValid = false;
                } else {
                    errorElement.innerText = '';
                    phone.parentElement.classList.remove('invalid');
                    isValid = true;
                }
            }

            dob.onblur = () => {
                var errorElement = dob.parentElement.querySelector(".error-messeage");
                var errorMessage = validationDob(dob.value);
                if (errorMessage) {
                    errorElement.innerText = errorMessage;
                    dob.parentElement.classList.add('invalid');
                    isValid = false;
                } else {
                    errorElement.innerText = '';
                    dob.parentElement.classList.remove('invalid');
                    isValid = true;
                }
            }


            form.addEventListener('submit', function (event) {
                if (isValid === false) {
                    event.preventDefault(); // Ngăn chặn việc submit form
                }
            });
        </script>
    </body>
</html>
