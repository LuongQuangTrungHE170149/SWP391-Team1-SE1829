<%-- 
    Document   : motorbikeInsurance
    Created on : Jun 17, 2024, 1:38:43 PM
    Author     : thuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Khai báo chi tiết</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        <style>
            .text-419FA3{
                color: #419FA3 !important;
            }
            .text-4F4F4F{
                color:#4f4f4f;
            }
            .btn-outline-primary{
                border-color: #419FA3 !important;
                color: #4f4f4f !important;
            }
            .btn-primary{
                background: rgb(65,159,163);
                background: linear-gradient(285deg, rgba(65,159,163,1) 29%, rgba(84,222,252,1) 100%);
            }
            .card-hover:hover{
                border: 1px solid #419FA3;
                box-shadow: 0 0px 20px #91DDCF;
                font-weight: bold;
            }
            .border-custom{
                border: 1px solid #419FA3;
            }
            .btn-custom{
                background: rgb(12,127,145);
                background: linear-gradient(285deg, rgba(12,127,145,1) 20%, rgba(47,173,197,1) 63%, rgba(84,222,252,1) 100%);
                color: #fff !important;
            }
            .card-header{
                background: rgb(65,159,163);
                background: linear-gradient(40deg, rgba(65,159,163,1) 0%, rgba(65,173,195,1) 100%);
            }
            .card{
                border: 1px solid #419FA3 !important;
            }
            .step-item{

            }
            .text-disable{
                color:#D7D7D7;
            }
            .current-step{
                border:1px solid #419FA3 !important;
            }
            .done-step{
                background-color: #acdadd;
            }
            .error-message{
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="spinnerLoading.jsp"/>
        <div class="container mt-4" style="width: 70%;">
            <div class="mb-2">
                <a href="home" style="color: #4f4f4f; font-size: 14px;">Trang chủ</a> <i class="fa-solid fa-chevron-right mx-2 text-muted" style="font-size: 12px;"></i>
                <a href="motorbikeInsurance" style="color: #4f4f4f; font-size: 14px;">Bảo hiểm xe máy</a> <i class="fa-solid fa-chevron-right mx-2 text-muted" style="font-size: 12px;"></i>
                <span style="font-size: 14px;">Khai báo</span>
            </div>

            <div class="stepper d-flex justify-content-between rounded-3 mb-3" style="background-color: #FAFAFA; padding:16px 200px ; width: 100%;">
                <div class="step-item text-center">
                    <div class="rounded-circle border fw-bold m-auto mb-3 done-step position-relative" style="width: 30px; height: 30px; align-content: center;">
                        1 <i class="fa-solid fa-check text-success position-absolute bottom-0"></i>
                    </div>
                    <div>Tính phí</div>
                </div>
                <div class="step-item text-center">
                    <div class="rounded-circle fw-bold m-auto mb-3 current-step" style="width: 30px; height: 30px; align-content: center;"> 2 </div>
                    <div>Khai báo</div>
                </div><div class="step-item text-center">
                    <div class="rounded-circle border fw-bold m-auto mb-3 text-disable" style="width: 30px; height: 30px; align-content: center;"> 3 </div>
                    <div>Xem lại</div>
                </div><div class="step-item text-center">
                    <div class="rounded-circle border fw-bold m-auto mb-3 text-disable" style="width: 30px; height: 30px; align-content: center;"> 4 </div>
                    <div>Thanh toán</div>
                </div>
                <div class="step-item text-center">
                    <div class="rounded-circle border fw-bold m-auto mb-3 text-disable" style="width: 30px; height: 30px; align-content: center;"> 5 </div>
                    <div>Hoàn tất</div>
                </div>
            </div>

            <div class="Customer-information m-auto mt-5 mb-5 p-5 shadow " style="width: 100%;">
                <!--Customer info-->
                <form id="customerInfoForm">
                    <div class="fs-5 fw-bold text-419FA3">Thông tin người yêu cầu bảo hiểm</div>
                    <hr class="text-419FA3">
                    <div class="input-form mt-4">
                        <c:if test="${not empty user}">
                            <div class="row mb-3">
                                <div class="col-12 col-lg-6">
                                    <div class="form-outline" data-mdb-input-init>
                                        <input type="text" name="firstName" id="firstName" value="${user.firstName}" class="form-control" readonly=""/>
                                        <label for="firstName" class="form-label">Họ<span class="text-danger"> *</span></label>
                                    </div>
                                    <span class="error-message text-danger" id="firstNameError"></span>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-outline" data-mdb-input-init>
                                        <input type="text" name="lastName" id="lastName" value="${user.lastName}" class="form-control" readonly=""/>
                                        <label for="lastName" class="form-label">Tên<span class="text-danger"> *</span></label>
                                    </div>
                                    <span class="error-message text-danger" id="lastNameError"></span>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-12 col-lg-6">
                                    <select name="gender" id="gender" class="form-select" disabled="" style="height: 37px;">
                                        <option value="">-- Giới tính --</option>
                                        <option value="true" ${user.gender == 1?'selected':''}>Nam</option>
                                        <option value="false" ${user.gender == 0?'selected':''}>Nữ</option>
                                    </select>
                                    <span class="error-message text-danger" id="genderError"></span>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-outline" data-mdb-input-init>
                                        <input type="hidden" name="dob" id="dob" value="${user.dob}"/>
                                        <input type="text" value="<fmt:formatDate value="${user.dob}" pattern="dd/MM/yyyy"/>" class="form-control" readonly=""/>
                                        <label for="dob" class="form-label">Ngày sinh<span class="text-danger"> *</span></label>
                                    </div>
                                    <span class="error-message text-danger" id="dobError"></span>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-12 col-lg-6">
                                    <div class="form-outline" data-mdb-input-init>
                                        <input type="text" name="phoneNumber" id="phoneNumber" value="${user.phone}" class="form-control" readonly=""/>
                                        <label for="phoneNumber" class="form-label">Số điện thoại<span class="text-danger"> *</span></label>
                                    </div>
                                    <span class="error-message text-danger" id="phoneNumberError"></span>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <div class="form-outline" data-mdb-input-init>
                                        <input type="email" name="email" id="email" value="${user.email}" class="form-control" readonly=""/>
                                        <label for="email" class="form-label">Email<span class="text-danger"> *</span></label>
                                    </div>
                                    <span class="error-message text-danger" id="emailError"></span>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-12 col-lg-12">
                                    <div class="form-outline" data-mdb-input-init>
                                        <input type="text" name="address" id="address" value="${user.address}" class="form-control" readonly=""/>
                                        <label for="address" class="form-label">Địa chỉ<span class="text-danger"> *</span></label>
                                    </div>
                                    <span class="error-message text-danger" id="addressError"></span>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${empty user}">
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
                                        <option value="true" ${gender == true?'selected':''}>Nam</option>
                                        <option value="false" ${gender == false?'selected':''}>Nữ</option>
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
                        </c:if>
                        <div class="row mb-3">
                            <div class="col-12 col-lg-12">
                                <div>(<span class="text-danger"> *</span>) Thông tin cần thiết</div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-12 col-lg-3">
                                <button type="button" class="btn btn-primary btn-block" data-mdb-ripple-init onclick="saveCustomerInfo()">Lưu thông tin</button>
                            </div>
                        </div>
                    </div>
                </form>
                <!--hien thi thong tin nguoi yeu cau-->
                <div id="doneCustomerInfoForm" class="mb-5" style="display: none;">
                    <div class="d-flex justify-content-between">
                        <div class="fs-5 fw-bold text-419FA3">Thông tin người yêu cầu bảo hiểm</div>
                        <div></div>
                        <a href="#" id="editCustomerInfo" onclick="editCustomerInfo()" class="text-info">chỉnh sửa <i class="fa-regular fa-pen-to-square fs-5"></i></a>
                    </div>

                    <hr class="text-419FA3">
                    <div class="row mb-3">
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Họ</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneFirstName"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Giới tính</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneGender"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Tên</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneLastName"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Ngày sinh</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneDob"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted text-nowrap">Số điện thoại</div>
                                </div>
                                <div class="col-4">
                                    <div id="donePhoneNumber"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Email</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneEmail"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Địa chỉ</div>
                                </div>
                                <div class="col-8">
                                    <div id="doneAddress" class="text-nowrap"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="doneInfo" style="display: none;"></div>
                </div>
                <!--vehicle info-->
                <form id="vehicleInfoForm" style="display:none;">
                    <div class="fs-5 fw-bold text-419FA3">Thông tin phương tiện</div>
                    <hr class="text-419FA3">
                    <div class="input-form">
                        <div class="row mb-3">
                            <div class="col-12 col-lg-6">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="sameAsCustomer" ${vehicleOwnerFirstName == firstName?'checked':''} onchange="fillCustomerInfo()"/>
                                    <label for="sameAsCustomer" class="form-check-label">Người yêu cầu là chủ phương tiện</label>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-12 col-lg-6">
                                <div class="form-outline" data-mdb-input-init>
                                    <input type="text" name="vehicleOwnerFirstName" id="vehicleOwnerFirstName" value="${vehicleOwnerFirstName}" class="form-control" required=""/>
                                    <label for="vehicleOwnerFirstName" class="form-label">Họ chủ xe<span class="text-danger"> *</span></label>
                                </div>
                                <span class="error-message text-danger" id="vehicleOwnerFirstNameError"></span>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="form-outline" data-mdb-input-init>
                                    <input type="text" name="vehicleOwnerLastName" id="vehicleOwnerLastName" value="${vehicleOwnerLastName}" class="form-control" required=""/>
                                    <label for="vehicleOwnerLastName" class="form-label">Tên chủ xe<span class="text-danger"> *</span></label>
                                </div>
                                <span class="error-message text-danger" id="vehicleOwnerLastNameError"></span>
                            </div>
                        </div>
                        <div class="row justify-content-center mb-3">
                            <div class="col-12 col-lg-6">
                                <div class="form-outline" data-mdb-input-init>
                                    <input type="text" name="vehicleOwnerAddress" id="vehicleOwnerAddress" value="${vehicleOwnerAddress}" class="form-control" required=""/>
                                    <label for="vehicleOwnerAddress" class="form-label">Địa chỉ chủ xe<span class="text-danger"> *</span></label>
                                </div>
                                <span class="error-message text-danger" id="vehicleOwnerAddressError"></span>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="form-outline" data-mdb-input-init>
                                    <input type="text" name="licensePlate" id="licensePlate" value="${licensePlate}" class="form-control" required=""/>
                                    <label for="licensePlate" class="form-label">Biển số xe<span class="text-danger"> *</span></label>
                                </div>
                                <span class="error-message text-danger" id="licensePlateError"></span>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-12 col-lg-6">
                                <div class="form-outline" data-mdb-input-init>
                                    <input type="text" name="chassisNumber" id="chassisNumber" value="${chassisNumber}" class="form-control" required=""/>
                                    <label for="chassisNumber" class="form-label">Số khung<span class="text-danger"> *</span></label>
                                </div>
                                <span class="error-message text-danger" id="chassisNumberError"></span>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="form-outline" data-mdb-input-init>
                                    <input type="text" name="engineNumber" id="engineNumber" value="${engineNumber}" class="form-control" required=""/>
                                    <label for="engineNumber" class="form-label">Số máy<span class="text-danger"> *</span></label>
                                </div>
                                <span class="error-message text-danger" id="engineNumberError"></span>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-12 col-lg-12">
                                <div>(<span class="text-danger"> *</span>) Thông tin cần thiết</div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-12 col-lg-3">
                                <button type="button" class="btn btn-primary btn-block" data-mdb-ripple-init onclick="saveVehicleInfo()">Lưu thông tin</button>
                            </div>
                        </div>
                    </div>
                </form>
                <!--hien thi thong tin phuong tien-->
                <div id="doneVehicleInfoForm" style="display: none;">
                    <div class="d-flex justify-content-between">
                        <div class="fs-5 fw-bold text-419FA3">Thông tin phương tiện</div>
                        <div></div>
                        <a href="#" id="editVehicleInfo" onclick="editVehicleInfo()" class="text-info">chỉnh sửa <i class="fa-regular fa-pen-to-square fs-5"></i></a>
                    </div>

                    <hr class="text-419FA3">
                    <div class="row mb-3">
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Họ chủ xe</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneVehicleOwnerFirstName"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Biển số xe</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneLicensePlate"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Tên chủ xe</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneVehicleOwnerLastName"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Số khung</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneChassisNumber"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted text-nowrap">Địa chỉ</div>
                                </div>
                                <div class="col-8">
                                    <div id="doneVehicleOwnerAddress"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Số máy</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneEngineNumber"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="confirm" class="m-auto ps-5" style=" display: none; ">
                <div>
                    <div class="error-message text-danger" id="confirm-error"></div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="checkConfirm"/>
                        <label for="checkConfirm" class="form-check-label text-muted">Tôi cam kết và đồng ý rằng:</label>
                    </div>
                    <div class="ps-4">
                        <p class="m-0" style="font-size: 14px;">- Tất cả những thông tin khai nêu trên là đúng và sẽ thông báo cho bảo hiểm F-Care khi có bất cứ thông tin nào thay đổi.</p>
                        <p style="font-size: 14px;">- Đơn bảo hiểm sẽ là cơ sở của hợp đồng giữa tôi và bảo hiểm F-Care và tôi sẽ chấp nhận tất cả các điều khoản mà bảo hiểm F-Care quy định trong đơn bảo hiểm và nộp phí bảo hiểm đúng theo quy định.</p>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-center mb-5 mt-5">
                <button type="button" onclick="callBack()" class="btn btn-lg btn-primary rounded-pill  me-5" data-mdb-ripple-init><i class="fa-solid fa-angle-left me-2"></i>Quay lại </button>
                <button type="button" id="continue" onclick="continueToNextPage()" class="btn btn-lg btn-primary rounded-pill " data-mdb-ripple-init disabled="">Tiếp tục <i class="fa-solid fa-angle-right ms-2"></i></button>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                    function callBack() {
                        window.history.back();
                    }
        </script>
        <script>
            let customerInfo = {};
            let vehicleInfo = {};

            function validatePhoneNumber() {
                const phoneNumberRegex = /^[0-9]{10,11}$/;
                const phoneNumberValue = $("#phoneNumber").val().trim();

                if (!phoneNumberValue) {
                    $("#phoneNumberError").html("Vui lòng nhập số điện thoại");
                    return false;
                } else if (!phoneNumberRegex.test(phoneNumberValue)) {
                    $("#phoneNumberError").html("Số điện thoại không hợp lệ");
                    return false;
                } else {
                    $("#phoneNumberError").html("");
                    return true;
                }
            }
            function validateEmail() {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                const emailValue = $("#email").val().trim();

                if (!emailValue) {
                    $("#emailError").html("Vui lòng nhập email");
                    return false;
                } else if (!emailRegex.test(emailValue)) {
                    $("#emailError").html("Email không hợp lệ");
                    return false;
                } else {
                    $("#emailError").html("");
                    return true;
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
            function validateLicensePlate() {
                const licensePlateRegex = /^[0-9]{2}[A-Z][0-9]{4,5}$/;
                const licensePlateValue = $("#licensePlate").val().trim();

                if (!licensePlateValue) {
                    $("#licensePlateError").html("Vui lòng nhập biển số xe");
                    return false;
                } else if (!licensePlateRegex.test(licensePlateValue)) {
                    $("#licensePlateError").html("Biển số xe không hợp lệ");
                    return false;
                } else {
                    $("#licensePlateError").html("");
                    return true;
                }
            }
            function validateChassisNumber() {
                const chassisNumberRegex = /^[A-Z0-9]{17}$/;
                const chassisNumberValue = $("#chassisNumber").val().trim();

                if (!chassisNumberValue) {
                    $("#chassisNumberError").html("Vui lòng nhập số khung");
                    return false;
                } else if (!chassisNumberRegex.test(chassisNumberValue)) {
                    $("#chassisNumberError").html("Số khung bao gồm 17 kí tự A-Z 0-9");
                    return false;
                } else {
                    $("#chassisNumberError").html("");
                    return true;
                }
            }
            function validateEngineNumber() {
                const engineNumberRegex = /^[A-Z0-9]{9,17}$/;
                const engineNumberValue = $("#engineNumber").val().trim();

                if (!engineNumberValue) {
                    $("#engineNumberError").html("Vui lòng nhập số máy");
                    return false;
                } else if (!engineNumberRegex.test(engineNumberValue)) {
                    $("#engineNumberError").html("Số máy từ 9 đến 17 kí tự A-Z 0-9");
                    return false;
                } else {
                    $("#engineNumberError").html("");
                    return true;
                }
            }
            function continueToNextPage() {
                if ($("#checkConfirm").is(":checked")) {
                    var formData = {
                        firstName: $("#firstName").val(),
                        lastName: $("#lastName").val(),
                        gender: $("#gender").val(),
                        dob: $("#dob").val(),
                        phoneNumber: $("#phoneNumber").val(),
                        email: $("#email").val(),
                        address: $("#address").val(),
                        vehicleOwnerFirstName: $("#vehicleOwnerFirstName").val(),
                        vehicleOwnerLastName: $("#vehicleOwnerLastName").val(),
                        vehicleOwnerAddress: $("#vehicleOwnerAddress").val(),
                        licensePlate: $("#licensePlate").val(),
                        chassisNumber: $("#chassisNumber").val(),
                        engineNumber: $("#engineNumber").val()
                    };
                    $.ajax({
                        type: "POST",
                        url: "requestCustomerInfor",
                        data: formData,
                        success: function (response) {
                            console.log("Yêu cầu đã được gửi tới servlet thành công.");
                            window.location.href = "reviewCustomerInfo";
                        },
                        error: function (err) {
                            console.error("Lỗi trong quá trình gửi yêu cầu tới servlet:", err);
                        }
                    });
                } else {
                    $("#confirm-error").text("Bạn cần đồng ý với các điều khoản để tiếp tục.");
                }
            }
            $("#checkConfirm").change(function () {
                if ($(this).is(":checked")) {
                    $("#confirm-error").text("");
                }
            });
            function fillCustomerInfo() {
                if ($("#sameAsCustomer").is(":checked")) {
                    $("#vehicleOwnerFirstName").val(customerInfo.firstName);
                    $("#vehicleOwnerLastName").val(customerInfo.lastName);
                    $("#vehicleOwnerAddress").val(customerInfo.address);
                } else {
                    $("#vehicleOwnerFirstName").val("");
                    $("#vehicleOwnerLastName").val("");
                    $("#vehicleOwnerAddress").val("");
                }
            }
            function saveCustomerInfo() {
                let isValid = true;

                $(".error-message").html("");

                if (!$("#firstName").val()) {
                    $("#firstNameError").html("Vui lòng nhập họ");
                    isValid = false;
                }
                if (!$("#lastName").val()) {
                    $("#lastNameError").html("Vui lòng nhập tên");
                    isValid = false;
                }
                if (!$("#gender").val()) {
                    $("#genderError").html("Vui lòng chọn giới tính");
                    isValid = false;
                }
                if (!validateDateOfBirth()) {
                    isValid = false;
                }
                if (!validatePhoneNumber()) {
                    isValid = false;
                }
                if (!validateEmail()) {

                    isValid = false;
                }
                if (!$("#address").val()) {
                    $("#addressError").html("Vui lòng nhập địa chỉ");
                    isValid = false;
                }
                if (!isValid) {
                    return;
                }
                customerInfo = {
                    firstName: $("#firstName").val(),
                    lastName: $("#lastName").val(),
                    gender: $("#gender").val(),
                    dob: $("#dob").val(),
                    phone: $("#phoneNumber").val(),
                    email: $("#email").val(),
                    address: $("#address").val()
                };
                $("#doneFirstName").html(customerInfo.firstName);
                $("#doneLastName").html(customerInfo.lastName);
                if ($("#gender").val() === "true")
                    $("#doneGender").html('Nam');
                else
                    $("#doneGender").html('Nữ');
                const formattedDate = moment(customerInfo.dob).format('DD/MM/YYYY');
                $("#doneDob").html(formattedDate);
                $("#doneEmail").html(customerInfo.email);
                $("#doneAddress").html(customerInfo.address);
                $("#donePhoneNumber").html(customerInfo.phone);
                if ($("#doneInfo").html() === "done") {
                    $("#customerInfoForm").hide();
//                    $("#vehicleInfoForm").hide();
                    $("#doneCustomerInfoForm").show();
                    $("#doneVehicleInfoForm").show();

                    $("#editVehicleInfo").show();
                } else {
                    $("#customerInfoForm").hide();
                    $("#doneCustomerInfoForm").show();
                    $("#vehicleInfoForm").show();
                }
                if ($("#sameAsCustomer").is(":checked")) {
                    $("#doneVehicleOwnerFirstName").html($("#firstName").val());
                    $("#doneVehicleOwnerLastName").html($("#lastName").val());
                    $("#doneVehicleOwnerAddress").html($("#address").val());
                }
                fillCustomerInfo();
                checkContinue();
            }
            function saveVehicleInfo() {
                let isValid = true;

                // Xóa thông báo lỗi cũ
                $(".error-message").html("");
                if (!$("#vehicleOwnerFirstName").val()) {
                    $("#vehicleOwnerFirstNameError").html("Vui lòng nhập họ chủ sở hữu");
                    isValid = false;
                }
                if (!$("#vehicleOwnerLastName").val()) {
                    $("#vehicleOwnerLastNameError").html("Vui lòng nhập tên chủ sở hữu");
                    isValid = false;
                }
                if (!$("#vehicleOwnerAddress").val()) {
                    $("#vehicleOwnerAddressError").html("Vui lòng nhập địa chỉ chủ sở hữu");
                    isValid = false;
                }
                if (!validateLicensePlate()) {
                    isValid = false;
                }
                if (!validateChassisNumber()) {
                    isValid = false;
                }
                if (!validateEngineNumber()) {
                    isValid = false;
                }
                if (!isValid) {
                    return;
                }

                vehicleInfo = {
                    vehicleOwnerFirstName: $("#vehicleOwnerFirstName").val(),
                    vehicleOwnerLastName: $("#vehicleOwnerLastName").val(),
                    vehicleOwnerAddress: $("#vehicleOwnerAddress").val(),
                    licensePlate: $("#licensePlate").val(),
                    chassisNumber: $("#chassisNumber").val(),
                    engineNumber: $("#engineNumber").val()
                };
                console.log(vehicleInfo);
                $("#doneVehicleOwnerFirstName").html(vehicleInfo.vehicleOwnerFirstName);
                $("#doneVehicleOwnerLastName").html(vehicleInfo.vehicleOwnerLastName);
                $("#doneVehicleOwnerAddress").html(vehicleInfo.vehicleOwnerAddress);
                $("#doneLicensePlate").html(vehicleInfo.licensePlate);
                $("#doneChassisNumber").html(vehicleInfo.chassisNumber);
                $("#doneEngineNumber").html(vehicleInfo.engineNumber);

                //set done
                $("#doneInfo").html('done');
                $("#vehicleInfoForm").hide();
                $("#doneVehicleInfoForm").show();
                $("#continue").removeAttr("disabled");
                $("#editCustomerInfo").show();
                checkContinue();
            }
            function editCustomerInfo() {
                if ($("#doneInfo").html() === "done") {
                    $("#doneCustomerInfoForm").hide();
                    $("#customerInfoForm").show();
                    $("#editVehicleInfo").hide();
                } else {
                    $("#doneCustomerInfoForm").hide();
                    $("#doneVehicleInfoForm").hide();
                    $("#vehicleInfoForm").hide();
                    $("#customerInfoForm").show();
                }
                checkContinue();
            }
            function editVehicleInfo() {
                $("#doneVehicleInfoForm").hide();
                $("#vehicleInfoForm").show();
                $("#editCustomerInfo").hide();
                checkContinue();
            }
            function checkContinue() {
                if ($("#doneCustomerInfoForm").is(":visible") && $("#doneVehicleInfoForm").is(":visible")) {
                    $("#confirm").show();
                    $("#continue").removeAttr("disabled");
                } else {
                    $("#confirm").hide();
                    $("#continue").attr("disabled", true);
                }
            }
        </script>
        <script src="JS/validateRequestCustomerInfo.js" type="text/javascript"></script>
    </body>
</html>
