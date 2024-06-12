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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/agency.css">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/cutomerManage.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Add customer page</title>
    </head>
    <body>
        <div id="addCustomer-page">
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
            <jsp:include page="./header.jsp" />      


            <div class="container add-customer--wrapper">
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6 edit-form-wrapper">
                        <div class="add-form__header">
                            <h4 class="add-form__title">Thêm khách hàng</h4>
                            <a href="customerList" class="back-btn"> 
                                <span class="back-icon"><i class="fa-solid fa-chevron-left"></i></span>
                                Quay lại
                            </a>
                        </div>
                        <div class="form-wrapper">

                            <form class="add-form-customer" action="customerAdd" method="post">
                                <div style="margin-bottom: 20px" class="input-wrapper">
                                    <div >
                                        <label class="input-label" for="first-name">Họ</label></br>
                                        <input type="text" required="" id="first-name" class="input-half" name="firstName" value="${firstName}"/>
                                        <span class="error-messeage"></span>
                                    </div>
                                    <div>
                                        <label class="input-label" for="last-name">Tên</label></br>
                                        <input type="text" required="" id="last-name" class="input-half" name="lastName" value="${lastName}"/>
                                        <span class="error-messeage"></span>

                                    </div>
                                </div>
                                <div style="margin-bottom: 20px">
                                    <label class="input-label" for="customer-Address">Địa chỉ</label></br>
                                    <input type="text" required="" id="customer-Address" class="input-full" name="address" value="${address}"/>
                                    <span class="error-messeage"></span>
                                </div>
                                <div style="margin-bottom: 20px">

                                    <label class="input-label" for="customer-dob">Năm sinh</label></br>
                                    <input type="text" required="" id="customer-dob" class="input-full" name="dob" value="${dob}"/>
                                    <span class="error-messeage"></span>
                                </div>

                                <div style="margin-bottom: 20px" class="input-wrapper">
                                    <div>
                                        <label class="input-label" for="customer-phone">Điện thoại</label></br>
                                        <input type="text" required="" id="customer-phone" class="input-half" name="phone" value="${phone}"/>
                                        <span class="error-messeage"></span>
                                        <p class="m-0 text-danger">${invalidPhone}</p>

                                    </div>
                                    <div>
                                        <label class="input-label" for="customer-gender">Giới tính</label></br
                                        <select  name="gender">
                                            <select class="select-half" name="gender">
                                                <option value="0" >Nam</option>
                                                <option value="1">Nữ</option>
                                                <option value="2">Khác</option>

                                            </select>

                                        </select>
                                    </div>
                                </div>
                                <div style="margin-bottom: 20px">
                                    <label class="input-label" for="customer-Email">Email</label></br>
                                    <input type="email" required="" id="customer-Email" class="input-full" name="email" value="${email}"/>
                                    <p class="m-0 text-danger">${invalidEmail}</p>

                                </div>     
                                <div style="margin-bottom: 20px">
                                    <label class="input-label" for="username">Tài khoản</label></br>
                                    <input type="text" required="" id="username" class="input-full" name="username" value="${username}"/>
                                    <p class="m-0 text-danger">${invalidUsername}</p>

                                </div>   
                                <div style="margin-bottom: 20px">
                                    <label class="input-label" for="customer-password">Mật khẩu</label></br>
                                    <input type="password" required="" id="customer-password" class="input-full" name="password"/>

                                </div>   
                                <div style="margin-bottom: 20px">
                                    <label class="input-label" for="customer-confirmpassword">Xác nhận</label></br>
                                    <input type="password" required="" id="customer-confirmpassword" class="input-full" name="confirmPassword"/>
                                    <p class="m-0 text-danger">${invalidConfirmPassword}</p>

                                </div>   
                                <div style="display: flex; justify-content: space-between; width: 473px">
                                    <button type="submit" class="btn-wrapper btn-save">Thêm</button>        
                                    <button type="reset" class="btn-wrapper">Hủy</button>                      

                                </div>
                            </form>
                        </div>


                    </div>
                    <div class="col-md-3"></div>
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
