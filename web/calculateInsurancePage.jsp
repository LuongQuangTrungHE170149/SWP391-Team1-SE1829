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
        <title>Bảo hiểm xe máy</title>
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
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container mt-4" style="width: 70%;">
            <div class="mb-2">
                <a href="home" style="color: #4f4f4f; font-size: 14px;">Trang chủ</a> <i class="fa-solid fa-chevron-right mx-2 text-muted" style="font-size: 12px;"></i>
                <a href="motorbikeInsurance" style="color: #4f4f4f; font-size: 14px;">Bảo hiểm xe máy</a> <i class="fa-solid fa-chevron-right mx-2 text-muted" style="font-size: 12px;"></i>
                <span style="font-size: 14px;">Tính phí</span>
            </div>
            <div class="card">
                <img src="images/banner bao hiem xe may.jpg" class="card-img-top" alt="alt"/>
                <div class="card-body">
                    <div class="row d-flex justify-content-between">
                        <div class="col-12 col-lg-9">
                            <h4 class="card-title text-419FA3">Bảo hiểm xe máy</h4>
                            <div class="card-text" style="font-size: 13px;">Bảo hiểm xe máy bao gồm Bảo hiểm Bắt buộc trách nhiệm dân sự và Bảo hiểm tai nạn người ngồi trên xe, 
                                giúp bảo vệ khách hàng trước những rủi ro tài chính do tai nạn khi tham gia giao thông.</div>
                        </div>
                        <div class="col-12 col-lg-3">
                            <div class="card-text text-end" style="font-size: 13px;">
                                Phí bảo hiểm từ: <span class="fs-4 fw-bold text-419FA3 ms-3">66.000đ</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="mt-5">
                    <div class="text-419FA3 fs-5 fw-bold mb-3">Tính phí bảo hiểm</div> 
                    <p style="font-size: 14px;">Để xem chi tiết các quyền lợi dành riêng cho mình, hãy bắt đầu bằng cách nhập thông tin và ước tính chi phí.</p>
                    <jsp:include page="calculateInsuranceForm.jsp"/>
                </div>
            </div>

            <form method="post" action="calculateInsurancePage" class="mt-5 mb-5">
                <div class="text-419FA3 fs-5 fw-bold mb-3">Chọn chương trình bảo hiểm phù hợp</div> 
                <div class="row mb-4">
                    <div class="col-12 col-lg-4">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="text-white mt-3">BẢO HIỂM TRÁCH NHIỆM DÂN SỰ BẮT BUỘC</h5>
                                <p class="fw-bold text-white">Phí bảo hiểm: <fmt:formatNumber value="${v.price}" type="currency" currencyCode="VND" /></p>
                            </div>
                            <div class="card-body">
                                <p class="text-muted" style="font-size: 14px;">Tham gia Gói bảo hiểm xe máy, khách hàng sẽ được bồi thường</p>
                                <ul>
                                    <li><p style="font-size: 14px;">Thiệt hại về thân thể, tính mạng và tài sản đối với bên thứ ba do xe gây ra</p></li>
                                    <li><p style="font-size: 14px;">Thiệt hại về thân thể đối với người điều khiển xe và người ngồi trên xe bị tai nạn khi đang ở trên xe, lên xuống xe trong quá trình xe tham gia giao thông</p></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-8">
                        <img src="images/website-hero-bg-1-.jpg" class="rounded-3 shadow" style="width: 100%;" alt="alt"/>
                    </div>
                </div>
                <div>
                    <div class="text-419FA3 fs-5 fw-bold mb-3">Bạn có thể chọn thêm</div> 
                    <div class="row p-3 border rounded-3 shadow-1-strong">
                        <div class="col-8 col-lg-3 d-flex align-items-center border-end">
                            <input type="checkbox" id="isAccidentInsurance" name="isAccidentInsurance" value="true" ${isAccidentInsurance == true?'checked':''} style="cursor: pointer;"/>
                            <label for="isAccidentInsurance" class="lh-sm ms-2" style="cursor: pointer;">BẢO HIỂM TAI NẠN NGƯỜI TRÊN XE</label>
                        </div>
                        <div class="col-8 col-lg-6">
                            <div class="row ms-2">
                                <div class="col-12 col-lg-4 p-2 rounded-3 text-center me-5" style="background-color: #eee;">
                                    <p class="m-0 text-muted" style="font-size: 12px;">Số người tham gia</p>
                                    <p class="m-0 fw-bold">2</p>
                                </div>
                                <div class="col-12 col-lg-5 p-2 rounded-3 text-center" style="background-color: #eee;">
                                    <p class="m-0 text-muted" style="font-size: 12px;">Chương trình bảo hiểm</p>
                                    <p class="m-0 fw-bold">10.000.000đ</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-8 col-lg-3" style="align-content: center;">
                            <p class="fw-bold m-0">Phí bảo hiểm: <fmt:formatNumber value="${20000*num_years}" type="currency" currencyCode="VND" /></p>
                        </div>
                    </div>


                    <!--tinh phi-->
                    <input type="hidden" id="num_years" name="num_years" value="${num_years}"/>
                    <input type="hidden" id="motocycleTypePrice" name="motocycleTypePrice" value="${v.price}"/>
                    <input type="hidden" id="vehicleType" name="vehicleType" value="${v.id}"/>
                    <input type="hidden" id="startDate" name="startDate" value="${startDate}"/>
                    <input type="hidden" id="endDate" name="endDate" value="${endDate}"/>
                    <div class="row p-3 rounded-3 mt-5" style="background-color: #e6f9fc;">
                        <div class="col-8 col-lg-3 d-flex align-items-center border-end">
                            <p class="m-0 me-3" style="font-size: 14px;">Chọn loại xe:</p>
                            <p class="m-0 fw-bold">${v.name}</p>
                        </div>
                        <div class="col-8 col-lg-4 border-end">
                            <div class="row">
                                <div class="col-12 p-2 me-5" >
                                    <p class="m-0 " style="font-size: 14px;">Thời hạn bảo hiểm:  
                                        <b><fmt:formatDate value="${startDate}" pattern="dd/MM/yyyy"/> - <fmt:formatDate value="${endDate}" pattern="dd/MM/yyyy"/></b></p>
                                    <p class="m-0" style="font-size: 14px;">Chương trình bảo hiểm: <b>Bảo hiểm trách nhiệm dân sự bắt buộc</b></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-8 col-lg-3" style="align-content: center;">
                            <p class="fw-bold m-0">Thành tiền: <span class="fw-bold" id="totalPrice" ></span></p>
                            <input type="hidden" name="totalPrice" id="totalPriceInput" value=""/>
                        </div>
                        <div class="col-8 col-lg-2 d-flex align-items-center">
                            <button type="submit" class="btn btn-primary rounded-pill btn-lg" data-mdb-ripple-init>Đặt mua</button>
                        </div>
                    </div>
                </div>
            </form>
            <a href="motorbikeInsurance" class="btn btn-primary rounded-pill mb-5"><i class="fa-solid fa-angle-left me-2"></i>Thông tin sản phẩm </a>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>

            $(document).ready(function () {
                function calculateTotalPrice() {
                    var motocycleTypePrice = parseFloat($("#motocycleTypePrice").val()) || 0;
                    var num_years = $("#num_years").val();
                    var isAccidentInsurance = $("#isAccidentInsurance").is(':checked') ? 20000 : 0;
                    var totalPrice = (motocycleTypePrice + isAccidentInsurance) * num_years;

                    $("#totalPrice").text(totalPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}));
                    $("#totalPriceInput").val(totalPrice);
                }
                $('#isAccidentInsurance').change(function () {
                    calculateTotalPrice();
                });

                // Tính toán giá ban đầu khi tải trang
                calculateTotalPrice();
            });
        </script>
    </body>
</html>
