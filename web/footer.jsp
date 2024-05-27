<%-- 
    Document   : footer
    Created on : May 20, 2024, 3:04:28 AM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<style>
    footer{
        width: 100%;
        background-color: #F7F7F7;
        padding-bottom: 20px;
    }
    .top-footer{
        display: flex;
        justify-content: space-around;
        align-items: center;

        background: linear-gradient(to bottom,#11DDE5,#275F61);
    }
    .footer-item{
        flex: 1;
        text-align: center;
        transition: background-color 0.3s, transform 0.3s;
        border-radius: 5px;
    }
    .footer-item a {
        color: #fff;
        text-decoration: none;
        font-size: 20px;
        display: block;
        align-content: center;
        height:70px;
    }
    .footer-item a:hover {
        background-color: rgba(255, 255, 255, 0.2);
        transform: scale(1.025);
    }
    .footer-content-list{
        padding-top:30px;
        padding-bottom: 20px;
        display: flex;
        justify-content: center;
    }
    .footer-content{
        width: 250px;
        padding-left: 20px;
        height: auto;
    }
    .footer-content-header h4{
        font-size: 17px;
        font-weight: bold;
        color: #606060;
        margin: 0;
    }
    .partner{
        margin: 16px 0;
    }
    .footer-content-items{
        margin-top:16px;
    }
    .footer-content-items a{
        color: #333;
        font-size: 14px;
        text-decoration: none;
    }
    .footer-content-items ul{
        list-style: none;
        padding: 0;
    }
    .footer-content-items li{
        font-size:14px;
        line-height: 26px;
    }
    footer hr{
        border: 1px solid #ccc;
        margin-bottom: 20px;
    }
    .footer-address{
        text-align: center;
        color: #333;
        box-sizing: border-box;
        line-height: 10px;
    }

    .content-partner{
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 10px;
    }
    .item{

        float: left;
        box-shadow: -1px -1px 3px #888888;
        margin-bottom:10px;
        max-height: 63px;
        box-sizing: border-box;
    }
    .item img{
        width: 111px;
    }
    .content-connect{
        display: flex;
        justify-content: left;
        margin-top:16px;
    }
    .connect-item img{
        width: 100%;
        height: auto;
    }
    .connect-item{
        margin-right: 10px;
    }

</style>
<link rel="stylesheet" href="CSS/footer.css"/>
<div class="top-footer">
    <div class="footer-item">
        <a href="introduce">Giới thiệu chung</a>
    </div>
    <div class="footer-item">
        <a href="view?id=1">Điều khoản sử dụng</a>
    </div>
    <div class="footer-item">
        <a href="view?id=2">Bảo mật & Quyền riêng tư</a>
    </div>
    <div class="footer-item">
        <a href="#">Tin tức</a>
    </div> 
</div>
<footer>
    <div class="footer-content-list">
        <div class="footer-content">
            <div class="footer-content-header">
                <h4>SẢN PHẨM</h4>
            </div>
            <div class="footer-content-items">
                <ul>
                    <li><a href="#" target="_blank">Bảo Hiểm Xe Máy</a></li>
                </ul>
            </div>
        </div>
        <div class="footer-content">
            <div class="footer-content-header">
                <h4>HỖ TRỢ KHÁCH HÀNG</h4>
            </div>
            <div class="footer-content-items">
                <ul>
                    <li><a href="#" target="_blank">Trung Tâm Dịch Vụ Khách Hàng</a></li>
                    <li><a href="#" target="_blank">Tạo Hợp Đồng Bảo Hiểm</a></li>
                    <li><a href="#" target="_blank">Hướng Dẫn Sửa Đổi, Bổ Sung/Hủy Hợp Đồng Bảo Hiểm</a></li>
                    <li><a href="#" target="_blank">Hướng Dẫn Đặt Mua, Thanh Toán, Giao Nhận</a></li>
                </ul>
            </div>
        </div>
        <div class="footer-content">
            <div class="footer-content-header">
                <h4>XỬ LÝ BỒI THƯỜNG</h4>
            </div>
            <div class="footer-content-items">
                <ul>
                    <li><a href="#" target="_blank">Bảo Hiểm Xe Máy</a></li>
                </ul>
            </div>
        </div>
        <div class="footer-content">
            <div class="footer-contact">
                <div class="footer-content-header">
                    <h4>KẾT NỐI VỚI CHÚNG TÔI</h4>
                </div>
                <div class="content-connect">
                    <div class="connect-item">
                        <a href="https://facebook.com/khar2009" target="_blank"><img src="images/fb icon.png" alt="alt"/></a>
                    </div>
                    <div class="connect-item">
                        <a href="https://facebook.com/khar2009" target="_blank"><img src="images/instagram icon.png" alt="alt"/></a>
                    </div>
                    <div class="connect-item">
                        <a href="https://facebook.com/khar2009/" target="_blank"><img src="images/youtube icon.png" alt="alt"/></a>
                    </div>
                    <div class="connect-item">
                        <a href="https://facebook.com/khar2009/" target="_blank"><img src="images/Group 78.png" alt="alt"/></a>
                    </div>
                </div>
            </div>
            <div class="footer-partner">
                <div class="footer-content-header partner">
                    <h4>ĐỐI TÁC</h4>
                </div>
                <div class="content-partner">
                    <div class="item">
                        <img src="images/logo momo-02.png" alt="alt"/>
                    </div>
                    <div class="item">
                        <img src="images/logo-payoo111x63.png" alt="alt"/>
                    </div>
                    <div class="item">
                        <img src="images/logo-vnpay.jpg" alt="alt"/>
                    </div>
                    <div class="item">
                        <img src="images/logo-zalopay.png" alt="alt"/>
                    </div>
                    <div class="item">
                        <img src="images/viettel_pay.png" alt="alt"/>
                    </div>
                    <div class="item">
                        <img src="images/logo-vnpt-ca.png" alt="alt"/>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <hr>
    <div class="footer-address">
        <p>Trụ sở chính: Trường Đại Học FPT Hà Nội, Khu Công Nghệ Cao Hòa Lạc, Hà Nội</p>
        <p>Tel: <span style="color:#419FA3; font-weight: bold;">1900 009901 - 0123 455667</span> - Email: fcarefpt@gmail.com</p>
        <p style="margin-bottom: 0;">&COPY; 2024 FCare Insurance, All Rights Reserved</p>
    </div>
</footer>
