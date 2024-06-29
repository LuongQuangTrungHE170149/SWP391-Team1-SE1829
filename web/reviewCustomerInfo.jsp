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
        <title>Xem lại</title>
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
            .insurance-card{
                background: rgb(53,164,187);
                background: radial-gradient(circle, rgba(53,164,187,1) 0%, rgba(32,150,181,1) 51%, rgba(12,137,175,1) 100%);
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container mt-4" style="width: 70%;">
            <div class="mb-2">
                <a href="home" style="color: #4f4f4f; font-size: 14px;">Trang chủ</a> <i class="fa-solid fa-chevron-right mx-2 text-muted" style="font-size: 12px;"></i>
                <a href="motorbikeInsurance" style="color: #4f4f4f; font-size: 14px;">Bảo hiểm xe máy</a> <i class="fa-solid fa-chevron-right mx-2 text-muted" style="font-size: 12px;"></i>
                <span style="font-size: 14px;">Xem lại</span>
            </div>

            <div class="stepper d-flex justify-content-between rounded-3 mb-3" style="background-color: #FAFAFA; padding:16px 200px ; width: 100%;">
                <div class="step-item text-center">
                    <div class="rounded-circle border fw-bold m-auto mb-3 done-step" style="width: 30px; height: 30px; align-content: center;"> 1 </div>
                    <div>Tính phí</div>
                </div>
                <div class="step-item text-center">
                    <div class="rounded-circle border fw-bold m-auto mb-3 done-step " style="width: 30px; height: 30px; align-content: center;"> 2 </div>
                    <div>Khai báo</div>
                </div><div class="step-item text-center">
                    <div class="rounded-circle fw-bold m-auto mb-3 current-step" style="width: 30px; height: 30px; align-content: center;"> 3 </div>
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

            <div class="Customer-information m-auto mt-5 mb-5 pb-5 shadow " style="width: 70%;">
                <button type="button" class="btn btn-sm btn-primary rounded-pill mt-5 mb-5 ms-5" onclick="window.history.back()" data-mdb-ripple-init><i class="fa-solid fa-angle-left me-2"></i>Quay lại chỉnh sửa</button>

                <!--hien thi thong tin nguoi yeu cau-->
                <div id="doneCustomerInfoForm" class="mb-3 px-5 pb-5 border-bottom">
                    <div class="d-flex justify-content-between">
                        <div class="fs-5 fw-bold text-419FA3">Thông tin người yêu cầu bảo hiểm</div>
                        <div></div>
                        <!--<a href="#" id="editCustomerInfo" onclick="editCustomerInfo()" class="text-info">chỉnh sửa <i class="fa-regular fa-pen-to-square fs-5"></i></a>-->
                    </div>
                    <hr class="text-419FA3 mb-4" style="opacity: 100%;">
                    <div class="row mb-3">
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Họ</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneFirstName">${firstName}</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Giới tính</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneGender">${gender == true?'Nam':'Nữ'}</div>
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
                                    <div id="doneLastName">${lastName}</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Ngày sinh</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneDob"><fmt:formatDate value="${dob}" pattern="dd/MM/yyyy"/></div>
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
                                    <div id="donePhoneNumber">${phoneNumber}</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Email</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneEmail">${email}</div>
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
                                    <div id="doneAddress" class="text-nowrap">${address}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="doneInfo" style="display: none;"></div>
                </div>
                <!--hien thi thong tin phuong tien-->
                <div id="doneVehicleInfoForm" class="mb-3 px-5 pb-5 border-bottom">
                    <div class="d-flex justify-content-between">
                        <div class="fs-5 fw-bold text-419FA3">Thông tin phương tiện <span class="fw-normal">(theo đăng ký xe)</span></div>
                        <div></div>
                        <!--<a href="#" id="editVehicleInfo" onclick="editVehicleInfo()" class="text-info">chỉnh sửa <i class="fa-regular fa-pen-to-square fs-5"></i></a>-->
                    </div>
                    <hr class="text-419FA3 mb-4" style="opacity: 100%;">
                    <div class="row mb-3">
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Họ chủ xe</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneVehicleOwnerFirstName">${vehicleOwnerFirstName}</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Biển số xe</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneLicensePlate">${licensePlate}</div>
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
                                    <div id="doneVehicleOwnerLastName">${vehicleOwnerLastName}</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Số khung</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneChassisNumber">${chassisNumber}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted text-nowrap">Địa chỉ</div>
                                </div>
                                <div class="col-8">
                                    <div id="doneVehicleOwnerAddress">${vehicleOwnerAddress}</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-4">
                                    <div class="text-muted">Số máy</div>
                                </div>
                                <div class="col-4">
                                    <div id="doneEngineNumber">${engineNumber}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--hien thi thong tin bao hiem-->
                <div id="insuranceInfo" class="mb-5 px-5 pb-5 border-bottom">
                    <div class="d-flex justify-content-between">
                        <div class="fs-5 fw-bold text-419FA3">Thông tin bảo hiểm</div>
                        <div></div>
                        <a href="calculateInsurancePage" class="text-info">chọn lại bảo hiểm<i class="fa-regular fa-pen-to-square fs-5 ms-2"></i></a>
                    </div>
                    <hr class="text-419FA3 mb-4" style="opacity: 100%;">
                    <div class="row mb-3">
                        <div class="col-12 col-lg-6">
                            <div class="insurance-card rounded-3 p-3 shadow d-flex flex-column justify-content-between" style="width: 366px; height: 200px;">
                                <div class="d-flex">
                                    <img src="images/icon motor.png" width="30" height="30" alt="alt"/>
                                    <div class="text-white fw-bold fs-5 mt-1 ms-2">F-CARE INSURANCE</div>
                                </div>
                                <div>
                                    <div class="row">
                                        <div class="col-4 text-white" style="font-size: 14px;">Sản phẩm</div>
                                        <div class="col-8 text-white fw-bold" style="font-size: 14px;">Bảo hiểm xe máy</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4 text-white" style="font-size: 14px;">Ngày bắt đầu</div>
                                        <div class="col-8 text-white" style="font-size: 14px;"><fmt:formatDate value="${startDate}" pattern="dd/MM/yyyy"/></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4 text-white" style="font-size: 14px;">Ngày kết thúc</div>
                                        <div class="col-8 text-white" style="font-size: 14px;"><fmt:formatDate value="${endDate}" pattern="dd/MM/yyyy"/></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-6 text-muted">Tạm tính</div>
                                <div class="col-6"><fmt:formatNumber value="${totalPrice}" type="currency" currencyCode="VND" /></div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-6 text-muted">Thanh toán</div>
                                <div class="col-6"><fmt:formatNumber value="${totalPrice}" type="currency" currencyCode="VND" /></div>
                            </div>
                            <hr>
                        </div>
                    </div>
                </div>
            </div>
            <div id="confirm" class="m-auto ps-5" style="width: 70%;">
                <div>
                    <div class="error-message text-danger" id="confirm-error1"></div>
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" id="checkConfirm1"/>
                        <label for="checkConfirm1" class="form-check-label" style="font-size: 14px">Tôi/chúng tôi xác nhận rằng các thông tin nêu trên là đầy đủ và xác thực theo sự hiểu biết cao nhất của tôi/chúng tôi và đồng ý 
                            rằng các kê khai yêu cầu bảo hiểm là cơ sở của hợp đồng bảo hiểm và chấp nhận các điều kiện bảo hiểm quy định tại hợp đồng bảo hiểm.</label>
                    </div>
                    <div class="error-message text-danger" id="confirm-error2"></div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="checkConfirm2"/>
                        <label for="checkConfirm2" class="form-check-label" style="font-size: 14px">Yêu cầu bảo hiểm (YCBH) này là một bộ phận không tách rời của Hợp đồng bảo hiểm. 
                            Việc kê khai thông tin trong YCBH này sẽ là căn cứ để thực hiện quyền và nghĩa vụ của các bên trong tất cả các hợp đồng bảo hiểm (bao gồm hợp đồng được cấp theo YCBH này và các hợp đồng tái tục tiếp theo, trừ các thông tin được kê khai lại khi tái tục). Vui lòng kiểm tra và đọc kỹ để chắc chắn rằng Quý khách đã hiểu toàn bộ các nội dung được quy định trong Quy tắc bảo hiểm. Xin lưu ý, việc Quý khách xác nhận đồng ý với YCBH là bằng chứng xác nhận việc Quý khách hàng đã hiểu rõ tất cả các nội dung được quy định trong 
                            "Quy tắc bảo hiểm của sản phẩm" được đặt tại phần cuối cùng của trang Review, trước trang thanh toán như dưới đây.</label>
                    </div>

                </div>
            </div>
            <div class="d-flex justify-content-center mb-5 mt-5">
                <button type="button" onclick="callBack()" class="btn btn-lg btn-primary rounded-pill  me-5" data-mdb-ripple-init><i class="fa-solid fa-angle-left me-2"></i>Quay lại </button>
                <button type="button" id="continue" onclick="continueToNextPage()" class="btn btn-lg btn-primary rounded-pill " data-mdb-ripple-init>Tiếp tục <i class="fa-solid fa-angle-right ms-2"></i></button>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                    function callBack() {
                        window.history.back();
                    }
                    $("#checkConfirm1").change(function () {
                        if ($(this).is(":checked")) {
                            $("#confirm-error1").text("");
                        }
                    });
                    $("#checkConfirm2").change(function () {
                        if ($(this).is(":checked")) {
                            $("#confirm-error2").text("");
                        }
                    });
                    
                    function continueToNextPage() {
                        let isValid = true;
                        if (!$("#checkConfirm1").is(":checked")) {
                            $("#confirm-error1").html("Vui lòng chọn xác nhận!");
                            isValid = false;
                        } else {
                            $("#confirm-error1").text("");
                        }

                        if (!$("#checkConfirm2").is(":checked")) {
                            $("#confirm-error2").text("Vui lòng chọn xác nhận!");
                            isValid = false;
                        } else {
                            $("#confirm-error2").text("");
                        }
                        
                        if(isValid){
                            window.location.href = "nextPage.html";
                        }


                    }


        </script>
        <script src="JS/validateRequestCustomerInfo.js" type="text/javascript"></script>
    </body>
</html>
