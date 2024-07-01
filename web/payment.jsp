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
        <title>Thanh toán</title>
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
                background-color: #419FA3 !important;
/*                background: rgb(65,159,163);
                background: linear-gradient(285deg, rgba(65,159,163,1) 29%, rgba(84,222,252,1) 100%);*/
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
                <span style="font-size: 14px;">Thanh toán</span>
            </div>

            <div class="stepper d-flex justify-content-between rounded-3 mb-3" style="background-color: #FAFAFA; padding:16px 200px ; width: 100%;">
                <div class="step-item text-center">
                    <div class="rounded-circle border fw-bold m-auto mb-3 done-step position-relative" style="width: 30px; height: 30px; align-content: center;"> 
                        1 <i class="fa-solid fa-check text-success position-absolute bottom-0"></i></div>
                    <div>Tính phí</div>
                </div>
                <div class="step-item text-center">
                    <div class="rounded-circle border fw-bold m-auto mb-3 done-step position-relative" style="width: 30px; height: 30px; align-content: center;"> 
                        2 <i class="fa-solid fa-check text-success position-absolute bottom-0"></i>
                    </div>
                    <div>Khai báo</div>
                </div><div class="step-item text-center">
                    <div class="rounded-circle border fw-bold m-auto mb-3 done-step position-relative" style="width: 30px; height: 30px; align-content: center;">
                        3 <i class="fa-solid fa-check text-success position-absolute bottom-0"></i>
                    </div>
                    <div>Xem lại</div>
                </div><div class="step-item text-center">
                    <div class="rounded-circle fw-bold m-auto mb-3  current-step" style="width: 30px; height: 30px; align-content: center;"> 4 </div>
                    <div>Thanh toán</div>
                </div>
                <div class="step-item text-center">
                    <div class="rounded-circle border fw-bold m-auto mb-3 text-disable" style="width: 30px; height: 30px; align-content: center;"> 5 </div>
                    <div>Hoàn tất</div>
                </div>
            </div>

            <div class="Customer-information m-auto mt-5 mb-5 pb-5 shadow " style="width: 100%;">
                <!--                <button type="button" class="btn btn-sm btn-primary rounded-pill mt-5 mb-5 ms-5" onclick="window.history.back()" data-mdb-ripple-init><i class="fa-solid fa-angle-left me-2"></i>Quay lại chỉnh sửa</button>-->
                <!--hien thi thong tin bao hiem-->
                <div id="insuranceInfo" class="px-5">
                    <div class="d-flex justify-content-between pt-4">
                        <div class="fs-5 fw-bold text-419FA3">Thông tin bảo hiểm</div>
                        <div></div>
                        <!--<a href="calculateInsurancePage" class="text-info">chọn lại bảo hiểm<i class="fa-regular fa-pen-to-square fs-5 ms-2"></i></a>-->
                    </div>
                    <hr class="text-419FA3 mb-4" style="opacity: 100%;">
                    <div class="row mb-3">
                        <div class="col-12 col-lg-2">
                            <div class="text-muted">Tên chủ xe</div>
                        </div>
                        <div class="col-12 col-lg-3">${vehicleOwnerFirstName} ${vehicleOwnerLastName}</div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-12 col-lg-2">
                            <div class="text-muted">Biển số xe</div>
                        </div>
                        <div class="col-12 col-lg-3">${licensePlate}</div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-12 col-lg-2">
                            <div class="text-muted">Số khung</div>
                        </div>
                        <div class="col-12 col-lg-3">${chassisNumber}</div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-lg-2">
                            <div class="text-muted">Số máy</div>
                        </div>
                        <div class="col-12 col-lg-3">${engineNumber}</div>
                    </div>
                </div>
                <!--hien thi thong tin san pham-->
                <div id="doneCustomerInfoForm" class="mb-3 px-5">
                    <div class="d-flex justify-content-between pt-4">
                        <div class="fs-5 fw-bold text-419FA3">Sản phẩm</div>
                        <div></div>
                        <!--<a href="#" id="editCustomerInfo" onclick="editCustomerInfo()" class="text-info">chỉnh sửa <i class="fa-regular fa-pen-to-square fs-5"></i></a>-->
                    </div>
                    <hr class="text-419FA3 mb-4" style="opacity: 100%;">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Loại xe</th>
                                <th>Loại sản phẩm</th>
                                <th>Phí bảo hiểm (đã bao gồm thuế VAT)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>${v.name}</td>
                                <td>Bảo hiểm trách nhiệm dân sự bắt buộc</td>
                                <td><fmt:formatNumber value="${v.price}" type="currency" currencyCode="VND"/></td>
                            </tr>
                            <c:if test="${isAccidentInsurance == true}">
                            <td>2</td>
                            <td>${v.name}</td>
                            <td>Bảo hiểm tai nạn người trên xe</td>
                            <td><fmt:formatNumber value="20000" type="currency" currencyCode="VND"/></td>
                        </c:if>
                        <tr>
                            <td colspan="4" class="fw-bold">Thời gian bảo hiểm: <fmt:formatDate value="${startDate}" pattern="dd/MM/yyyy"/> đến <fmt:formatDate value="${endDate}" pattern="dd/MM/yyyy"/></td>
                        </tr>
                        <tr>
                            <td colspan="3" class="text-center fw-bold">Tổng tiền</td>
                            <td><fmt:formatNumber value="${totalPrice}" type="currency" currencyCode="VND"/></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div id="paymentChoice" class="px-5">
                    <div class="d-flex justify-content-between pt-4">
                        <div class="fs-5 fw-bold text-419FA3">Chọn phương thức thanh toán</div>
                        <div></div>
                        <!--<a href="calculateInsurancePage" class="text-info">chọn lại bảo hiểm<i class="fa-regular fa-pen-to-square fs-5 ms-2"></i></a>-->
                    </div>
                    <hr class="text-419FA3 mb-4" style="opacity: 100%;">
                </div>

                <div class="d-flex justify-content-center">
                    <a href="#" class="btn btn-danger me-3" data-mdb-ripple-init>Hủy</a>
                    <a href="submitContract" class="btn btn-primary" data-mdb-ripple-init>Thanh toán</a>
                </div>
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

                if (isValid) {
                    window.location.href = "payment";
                }
            }


        </script>
        <script src="JS/validateRequestCustomerInfo.js" type="text/javascript"></script>
    </body>
</html>
