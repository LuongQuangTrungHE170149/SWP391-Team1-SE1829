<%-- 
    Document   : cutomerEdit
    Created on : Jun 8, 2024, 4:40:55 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/agency.css">
        <link rel="stylesheet" href="CSS/cutomerManage.css">
        <title>Chỉnh sửa thông tin khách hàng</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <style>
            body{
                background-color: #f2f0fa !important;
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.updateSuccess != null}">
            <div id="toast-success" class="toast-container top-0 end-0 p-3">
                <div class="toast align-items-center text-bg-success border-0 fade show" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="d-flex">
                        <div class="toast-body">
                            ${sessionScope.updateSuccess}
                        </div>
                        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                </div>
            </div>
            <c:remove var="updateSuccess" scope="session" />
        </c:if>
        <c:if test="${sessionScope.updateFail != null}">
            <div class="toast-container top-0 end-0 p-3">
                <div class="toast align-items-center text-bg-success border-0 fade show" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="d-flex">
                        <div class="toast-body">
                            ${sessionScope.updateFail}
                        </div>
                        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                </div>
            </div>
            <c:remove var="updateFail" scope="session" />
        </c:if>

        <jsp:include page="staffDashboard.jsp"/>
        <div class="main-content" id="main-content">
            <div class="nav navbar bg-light sticky-top justify-content-between align-items-start px-2"> 
                <div class="fs-3 fw-bold text-info">Thông tin khách hàng</div>
            </div>
            <div class="container">
                <div style="margin-top: 50px;" class="edit-customer--wrapper">
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6 edit-form-wrapper">
                            <div class="add-form__header">
                                <div class="fs-3 fw-bold text-info">Sửa thông tin khách hàng</div>
                                <a href="customerList" class="btn btn-sm btn-primary btn-rounded"> 
                             <i class="fa-solid fa-chevron-left"></i>
                                    Quay lại
                                </a>
                            </div>
                            <div class="form-wrapper">
                                <c:set var="user" value="${user}" />
                                <form class="edit-form-customer" action="customerEdit" method="post">
                                    <div style="margin-bottom: 20px">
                                        <label class="input-label" for="customer-id">Mã khách hàng</label></br>
                                        <input type="number" readonly="" id="customer-id" class="input-full" name="customerId" value="${user.id}"/>
                                        <span class="error-messeage"></span>
                                    </div>
                                    <div style="margin-bottom: 20px">
                                        <label class="input-label" for="first-name">Họ</label></br>
                                        <input type="text" required="" id="first-name" class="input-full" name="firstName" value="${user.firstName}"/>
                                        <span class="error-messeage"></span>
                                    </div>
                                    <div style="margin-bottom: 20px">
                                        <label class="input-label" for="last-name">Tên</label></br>
                                        <input type="text" required="" id="last-name" class="input-full" name="lastName" value="${user.lastName}"/>
                                        <span class="error-messeage"></span>

                                    </div>
                                    <div style="margin-bottom: 20px">
                                        <label class="input-label" for="customer-Address">Địa chỉ</label></br>
                                        <input type="text" required="" id="customer-Address" class="input-full" name="address" value="${user.address}"/>
                                        <span class="error-messeage"></span>
                                    </div>
                                    <div style="margin-bottom: 20px">
                                        <fmt:parseDate value="${user.getDob()}" var="parsedDate" pattern="yyyy-MM-dd" />
                                        <fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy" var="formattedDate" />
                                        <label class="input-label" for="customer-dob">Năm sinh</label></br>
                                        <input type="text" required="" id="customer-dob" class="input-full" name="dob" value="${formattedDate}"/>
                                        <span class="error-messeage"></span>
                                    </div>
                                    <div style="margin-bottom: 20px">
                                        <label class="input-label" >Trạng thái</label></br>
                                        <select class="input-select" name="customerStatus">
                                            <option value="active" ${user.status eq 'active' ? 'selected' : ''} >Hoạt động</option>
                                            <option value="inactive ${user.status ne 'active' ? 'selected' : ''}">Dừng hoạt động</option>
                                        </select>
                                    </div>

                                    <div style="margin-bottom: 20px" class="input-wrapper">
                                        <div>
                                            <label class="input-label" for="customer-phone">Điện thoại</label></br>
                                            <input type="text" required="" id="customer-phone" class="input-half" name="phone" value="${user.phone}"/>
                                            <p class="text-danger m-0">${invalidPhone}</p>
                                            <span class="error-messeage"></span>
                                        </div>
                                        <div>
                                            <label class="input-label" for="customer-gender">Giới tính</label></br
                                            <select  name="gender">
                                                <select class="select-half" name="gender">
                                                    <option value="0" ${user.gender == 0  ? 'selected' : ''} >Nam</option>
                                                    <option value="1" ${user.gender == 1  ? 'selected' : ''}>Nữ</option>
                                                </select>

                                            </select>


                                        </div>
                                    </div>
                                    <div style="margin-bottom: 20px">
                                        <label class="input-label" for="customer-Email">Email</label></br>
                                        <input type="email" required="" id="customer-Email" class="input-full" name="email" value="${user.email}"/>
                                        <p class="text-danger m-0">${invalidEmail}</p>
                                    </div>                              


                                    <div style="display: flex; justify-content: space-between; width: 473px">
                                        <button type="submit" class="btn btn-primary btn-rounded ">Lưu</button>                      
                                    </div>
                                </form>
                            </div>


                        </div>
                        <div class="col-md-3"></div>
                    </div>
                </div>


            </div>  
        </div>



        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
        <script>

            const phone = document.getElementById("customer-phone");
            const form = document.querySelector(".edit-form-customer");

            const validationPhone = (value) => {
                const phoneRegex = /^(0[1-9])+([0-9]{8})$/;
                return phoneRegex.test(value) ? undefined : "Nhập số điện thoại hợp lệ";
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

            form.addEventListener('submit', function (event) {
                if (isValid === false) {
                    event.preventDefault(); // Ngăn chặn việc submit form
                }
            });

            window.addEventListener('load', () => {
                setTimeout(() => {
                    const successToast = document.getElementById('toast-success');
                    if (successToast) {
                        successToast.style.opacity = '0';
                        setTimeout(() => successToast.style.display = 'none', 1000);
                    }

                }, 3000);
            });
        </script>
    </body>
</html>
