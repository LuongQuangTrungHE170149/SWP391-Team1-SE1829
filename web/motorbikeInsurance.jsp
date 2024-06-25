<%-- 
    Document   : motorbikeInsurance
    Created on : Jun 17, 2024, 1:38:43 PM
    Author     : thuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container mt-4" style="width: 70%;">
            <div class="mb-2">
                <a href="home" style="color: #4f4f4f; font-size: 14px;">Trang chủ</a> <i class="fa-solid fa-chevron-right mx-2 text-muted" style="font-size: 12px;"></i> <span style="font-size: 14px;">Bảo hiểm xe máy</span>
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
                    <div class="row d-flex justify-content-between">
                        <div class="col-12 col-lg-8">

                        </div>
                        <div class="col-12 col-lg-4 text-end">
                            <a href="#consForm" class="btn btn-outline-primary rounded-pill ">Đăng ký tư vấn</a>
                            <a href="#request-contract" class="btn btn-primary rounded-pill btn-lg">Tính phí</a>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row mb-3"></div>

            <div class="row d-flex justify-content-center mb-3">
                <div class="col-12 col-lg-3 mb-3">
                    <div class="card card-hover" style=" width: 200px; height: 200px;
                         border-top-left-radius: 50px;
                         border-bottom-right-radius: 50px;
                         border-top-right-radius: 20px;
                         border-bottom-left-radius: 20px;">
                        <div class="card-body text-center">
                            <img class="icon_option_bh" src="https://beta.baovietonline.com.vn/uploads/product/b71a519423cdd7ef6c65079f05aaaccd.png">
                            <p style="font-size: 14px;">Với một khoản chi phí nhỏ chỉ từ 66.000 đồng</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-3">
                    <div class="card card-hover" style=" width: 200px; height: 200px;
                         border-top-left-radius: 50px;
                         border-bottom-right-radius: 50px;
                         border-top-right-radius: 20px;
                         border-bottom-left-radius: 20px;">
                        <div class="card-body text-center">
                            <img class="icon_option_bh" src="https://beta.baovietonline.com.vn/uploads/product/a626bf688ea55c12b46efeddf83de274.png">                            
                            <p style="font-size: 14px;">Bảo hiểm trách nhiệm dân sự của chủ xe và bảo hiểm tai nạn người ngồi trên xe</p>
                        </div>
                    </div>
                </div>
            </div>

            <div>
                <div>
                    <a  class="fs-5 text-419FA3"
                        data-mdb-collapse-init
                        href="#collapse1"
                        role="button"
                        aria-expanded="false"
                        aria-controls="collapse1">
                        <i class="fa-sharp fa-solid fa-chevron-right me-3"></i> Đối tượng 
                    </a>
                    <hr class="mt-0">
                    <!-- Collapsed content -->
                    <div class="collapse" id="collapse1">
                        <ul style="list-style: none;">
                            <li><i class="fa-sharp fa-solid fa-check text-419FA3 me-3"></i> <span style="font-size: 14px;">Các doanh nghiệp vận tải, dịch vụ vận chuyển bằng xe máy</span></li>
                            <li><i class="fa-sharp fa-solid fa-check text-419FA3 me-3"></i> <span style="font-size: 14px;">Mọi cá nhân trong và ngoài nước sở hữu và sử dụng xe máy</span></li>
                            <li><i class="fa-sharp fa-solid fa-check text-419FA3 me-3"></i> <span style="font-size: 14px;">Hãng sản xuất và cung cấp xe máy</span></li>
                            <li><i class="fa-sharp fa-solid fa-check text-419FA3 me-3"></i> <span style="font-size: 14px;">Khách hàng cá nhân sở hữu xe máy.</span></li>
                        </ul>
                    </div>
                </div>

                <div>
                    <a  class="fs-5 text-419FA3"
                        data-mdb-collapse-init
                        href="#collapse2"
                        role="button"
                        aria-expanded="false"
                        aria-controls="collapse2">
                        <i class="fa-sharp fa-solid fa-chevron-right me-3"></i> Quyền lợi chính
                    </a>
                    <hr class="mt-0">
                    <!-- Collapsed content -->
                    <div class="collapse" id="collapse2">
                        <div class="row mb-3">
                            <div class="col-12 col-lg-5">
                                <div class="d-flex align-items-center px-3 py-2 border-custom rounded-3" style="height: 80px;">
                                    <img width="40" height="40"  src="https://beta.baovietonline.com.vn/uploads/product/bb638d5e46bd97ed25dd001359b36bdb.png">
                                    <div class="ms-3">
                                        <p class="m-0">Khách hàng sẽ được bồi thường</p>
                                        <p class="m-0 text-muted" style="font-size: 12px;">Thiệt hại về Người và Tài sản đối với bên thứ ba do xe máy gây ra</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-5">
                                <div class="d-flex align-items-center px-3 py-2 border-custom rounded-3" style="height: 80px;">
                                    <img width="40" height="40"  src="https://beta.baovietonline.com.vn/uploads/product/1f3bd342943f7b8156b33b3498f98f6c.png">
                                    <div class="ms-3">
                                        <p class="m-0">Khách hàng sẽ được bồi thường</p>
                                        <p class="m-0 text-muted" style="font-size: 12px;">Thiệt hại về thân thể đối với người ngồi trên xe</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div>
                    <a  class="fs-5 text-419FA3"
                        data-mdb-collapse-init
                        href="#collapse3"
                        role="button"
                        aria-expanded="false"
                        aria-controls="collapse3">
                        <i class="fa-sharp fa-solid fa-chevron-right me-3"></i> Tính phí bảo hiểm
                    </a>
                    <hr class="mt-0">
                    <!-- Collapsed content -->
                    <div class="collapse show" id="collapse3">
                        <jsp:include page="calculateInsuranceForm.jsp"/>
                    </div>
                </div>

                <div>
                    <a  class="fs-5 text-419FA3"
                        data-mdb-collapse-init
                        href="#collapse4"
                        role="button"
                        aria-expanded="false"
                        aria-controls="collapse4">
                        <i class="fa-sharp fa-solid fa-chevron-right me-3"></i> Đăng ký tư vấn
                    </a>
                    <hr class="mt-0">
                    <!-- Collapsed content -->
                    <div class="collapse show" id="collapse4">
                        <div class="row mt-5">
                            <div class="col-12 col-lg-5">
                                <div class="text-419FA3 fs-3 lh-sm">Đăng ký tư vấn dành cho cá nhân</div>
                                <p class="m-0 fw-light">Chúng tôi sẽ liên hệ và tư vấn miễn phí</p>
                                <img src="images/thong-tin-lien-he.png" class="img-fluid mt-4" alt="alt"/>
                            </div>
                            <div class="col-12 col-lg-7 d-flex align-items-center">
                                <form class="card shadow py-5 px-3 mb-5" id="consForm" style="border-radius: 25px">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-12 col-lg-6">
                                                <div class="form-outline mb-3" data-mdb-input-init>
                                                    <input type="text" name="name" id="name" class="form-control" required="" />
                                                    <label for="name" class="form-label">Họ tên<span class="text-danger">*</span></label>
                                                </div>
                                            </div>
                                            <div class="col-12 col-lg-6">
                                                <div class="form-outline mb-4" data-mdb-input-init>
                                                    <input type="text" name="email" id="email" class="form-control" required="" />
                                                    <label for="email" class="form-label">Email<span class="text-danger">*</span></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-outline mb-4" data-mdb-input-init>
                                                    <textarea name="content" id="content" class="form-control" rows="4" required=""></textarea>
                                                    <label for="content" class="form-label">Nội dung tư vấn<span class="text-danger">*</span></label>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-block btn-custom" data-mdb-ripple-init>Đăng ký tư vấn</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#consForm').on('submit', function (e) {
                    e.preventDefault();
                    let formData = {
                        name: $('#name').val(),
                        email: $('#email').val(),
                        content: $('#content').val()
                    };

                    // AJAX request to send the reply to the servlet
                    $.ajax({
                        url: 'addConsultation',
                        type: 'POST',
                        data: formData,
                        success: function (response) {
                            alert('sent successfully.');
                            location.reload();
                        },
                        error: function (err) {
                            console.log(err);
                            alert('Failed to send.');
                        }
                    });
                });
            });
        </script>
    </body>
</html>
