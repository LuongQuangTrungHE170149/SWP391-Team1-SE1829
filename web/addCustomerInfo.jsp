<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin người yêu cầu bảo hiểm</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <style>
            .text-419FA3 {
                color: #419FA3;
            }
            .error-message {
                font-size: 0.875rem;
                color: #dc3545;
            }
            .info {
                color: blue;
            }
        </style>
    </head>

    <body>
        <jsp:include page="staffDashboard.jsp"/>
        <div class="main-content" id="main-content">
            <div class="nav navbar bg-light sticky-top justify-content-between align-items-start mb-3 px-2"> 
                <div class="fs-3 fw-bold text-info">Tạo hợp đồng</div>
            </div>
            <div class="container" style="width: 700px;">
                <div class="card">
                    <div class="card-body">
                        <form action="AddCustomerServlet" method="post" onsubmit="return validateForm()">
                            <div class="fs-5 fw-bold text-419FA3">Thông tin người yêu cầu bảo hiểm</div>
                            <hr class="text-419FA3">
                            <input type="hiden" name="exist" value="${exist}"/>
                            <div class="input-form mt-4">
                                <div class="row mb-3">
                                    <div class="col-12 col-lg-6">
                                        <div class="form-outline" data-mdb-input-init>
                                            <input type="text" name="firstName" id="firstName" value="${firstName}" class="form-control" required=""/>
                                            <label for="firstName" class="form-label">Họ<span class="text-danger"> *</span></label>
                                        </div>
                                        <span class="error-message text-danger" id="firstNameError"></span>
                                    </div>
                                    <div class="col-12 col-lg-6">
                                        <div class="form-outline" data-mdb-input-init>
                                            <input type="text" name="lastName" id="lastName" value="${lastName}" class="form-control" required=""/>
                                            <label for="lastName" class="form-label">Tên<span class="text-danger"> *</span></label>
                                        </div>
                                        <span class="error-message text-danger" id="lastNameError"></span>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12 col-lg-6">
                                        <select name="gender" id="gender" class="form-select" required="" style="height: 37px;">
                                            <option value="">-- Giới tính --</option>
                                            <option value="1" ${gender == 1 ? 'selected' : ''}>Nam</option>
                                            <option value="0" ${gender == 0 ? 'selected' : ''}>Nữ</option>
                                        </select>
                                        <span class="error-message text-danger" id="genderError"></span>
                                    </div>
                                    <div class="col-12 col-lg-6">
                                        <div class="form-outline" data-mdb-input-init>
                                            <input type="date" name="dob" id="dob" value="${dob}" class="form-control" required=""/>
                                            <label for="dob" class="form-label">Ngày sinh<span class="text-danger"> *</span></label>
                                        </div>
                                        <span class="error-message text-danger" id="dobError"></span>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12 col-lg-6">
                                        <div class="form-outline" data-mdb-input-init>
                                            <input type="text" name="phoneNumber" id="phoneNumber" value="${phoneNumber}" class="form-control" required=""/>
                                            <label for="phoneNumber" class="form-label">Số điện thoại<span class="text-danger"> *</span></label>
                                        </div>
                                        <span class="error-message text-danger" id="phoneNumberError"></span>
                                    </div>
                                    <div class="col-12 col-lg-6">
                                        <div class="form-outline" data-mdb-input-init>
                                            <input type="email" name="email" id="email" value="${email}" class="form-control" required=""/>
                                            <label for="email" class="form-label">Email<span class="text-danger"> *</span></label>
                                        </div>
                                        <span class="error-message text-danger" id="emailError"></span>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12 col-lg-12">
                                        <div class="form-outline" data-mdb-input-init>
                                            <input type="text" name="address" id="address" value="${address}" class="form-control"/>
                                            <label for="address" class="form-label">Địa chỉ<span class="text-danger"> *</span></label>
                                        </div>
                                        <span class="error-message text-danger" id="addressError"></span>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12 col-lg-12">
                                        <div>(<span class="text-danger"> *</span>) Thông tin cần thiết</div>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12 col-lg-3">
                                        <button type="submit" class="btn btn-primary btn-block" data-mdb-ripple-init>Tiếp tục</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!--mdb bootstrap-->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>

        <script>
                            $(document).ready(function () {
                                const phoneOrEmail = "<%= request.getAttribute("phoneOrEmail") %>";

                                if (isEmail(phoneOrEmail)) {
                                    $("#email").val(phoneOrEmail).prop('readonly', true);
                                } else if (isPhoneNumber(phoneOrEmail)) {
                                    $("#phoneNumber").val(phoneOrEmail).prop('readonly', true);
                                }
                            });

                            function isEmail(input) {
                                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                                return emailRegex.test(input);
                            }

                            function isPhoneNumber(input) {
                                const phoneRegex = /^[0-9]{10,11}$/;
                                return phoneRegex.test(input);
                            }

                            async function validatePhoneNumber() {
                                const phoneNumberValue = $("#phoneNumber").val().trim();
                                if (!phoneNumberValue) {
                                    $("#phoneNumberError").html("Vui lòng nhập số điện thoại");
                                    return false;
                                } else {
                                    const exists = await checkExistence("phoneNumber", phoneNumberValue);
                                    if (exists) {
                                        $("#phoneNumberError").html("Số điện thoại đã tồn tại");
                                        return false;
                                    } else {
                                        $("#phoneNumberError").html("");
                                        return true;
                                    }
                                }
                            }

                            async function validateEmail() {
                                const emailValue = $("#email").val().trim();
                                if (!emailValue) {
                                    $("#emailError").html("Vui lòng nhập email");
                                    return false;
                                } else {
                                    const exists = await checkExistence("email", emailValue);
                                    if (exists) {
                                        $("#emailError").html("Email đã tồn tại");
                                        return false;
                                    } else {
                                        $("#emailError").html("");
                                        return true;
                                    }
                                }
                            }

                            function validateDateOfBirth() {
                                const dobValue = $("#dob").val().trim();
                                const today = new Date();
                                const dob = new Date(dobValue);
                                const age = today.getFullYear() - dob.getFullYear();

                                if (!dobValue) {
                                    $("#dobError").html("Vui lòng nhập ngày sinh");
                                    return false;
                                } else if (age < 18) {
                                    $("#dobError").html("Bạn phải đủ 18 tuổi");
                                    return false;
                                } else {
                                    $("#dobError").html("");
                                    return true;
                                }
                            }

                            async function validateForm() {
                                const isPhoneNumberValid = await validatePhoneNumber();
                                const isEmailValid = await validateEmail();
                                const isDobValid = validateDateOfBirth();

                                return isPhoneNumberValid && isEmailValid && isDobValid;
                            }

                            function checkExistence(field, value) {
                                return new Promise((resolve, reject) => {
                                    $.ajax({
                                        url: 'CheckExistenceServlet',
                                        type: 'POST',
                                        data: {field: field, value: value},
                                        success: function (response) {
                                            resolve(response.exists);
                                        },
                                        error: function () {
                                            console.error('Lỗi kiểm tra tồn tại');
                                            resolve(false);
                                        }
                                    });
                                });
                            }
        </script>

    </body>
</html>
