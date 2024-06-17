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
                            <button class="btn btn-outline-primary rounded-pill ">Đăng ký tư vấn</button>
                            <button class="btn btn-primary rounded-pill btn-lg">Tính phí</button>
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
            
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
