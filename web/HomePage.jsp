<%-- 
    Document   : HomePage
    Created on : May 18, 2024, 12:40:15 AM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>F-Care Insurance</title>
        <link rel="stylesheet" href="CSS/style.css" />
        <style>

        </style>
    </head>
    <body>

        <header>
            <a class="logo" href="#">
                <div class="img-logo">
                    <img src="images/logo.png"width="100%" height="100%" alt="alt"/>
                </div>
                <div class="f-care">F Care Insurance</div>
            </a>
            <div class="navbar">
                <div><a href="#">Trang chủ</a></div>
                <div><a href="#">Giới thiệu</a></div>
                <div><a href="#">Dịch vụ</a></div>
                <div><a href="#">Tin tức</a></div>
                <div><a href="#">Liên hệ</a></div>
            </div>
            <div class="signup-signin">
                <a href="#" class="login-button">Đăng nhập</a>
                <a href="#">Đăng ký</a>
            </div>
        </header>


        <div class="middle">
            <div class="bg-img"></div>
            <div class="middle-content">
                <div class="f-title">BẢO HIỂM F-Care</div>
                <p class="f-quote">
                    “Đến với F-Care, chúng tôi cung cấp cho bạn dịch vụ bảo hiểm xe máy với chi phí và chính sách tốt nhất.<br />
                    Đồng hành cùng bạn mỗi bước đường. Bảo hiểm xe máy cho mọi hành trình!”
                </p>
            </div>
        </div>
        
        <!-- dang ky tu van -->
        <button id="openFormBtn">Đăng ký tư vấn</button>
        <div id="consultationForm" class="form-container">
            <button id="closeFormBtn" class="close-btn">&times;</button>
            <form id="form" onsubmit="handleSubmit(event)">
                <h2>Đăng ký tư vấn</h2>
                <label for="name">Họ và Tên</label>
                <input type="text" id="name" name="name" required>

                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>

                <label for="message">Thông tin hỗ trợ</label>
                <textarea id="message" name="message" rows="4" required></textarea>

                <button type="submit">Gửi</button>
            </form>
        </div>

        <!-- Tai sao chon fcare -->
        <div class="content">
            <div class="content-header">
                <h2>TẠI SAO CHỌN F-CARE?</h2>
                <p>luôn thấu hiểu, luôn lắng nghe, sự hài lòng là tuyệt đối!</p>
            </div>
            <div class="content-list">
                <div class="content-items">
                    <img src="images/icon-1.png" alt="alt"/>
                    <h3>Chính Sách Tốt Nhất</h3>
                    <p>Cung cấp chính sách tốt nhất với rủi ro cực kì thấp.</p>
                </div>
                <div class="content-items">
                    <img src="images/icon-2.png" alt="alt"/>
                    <h3>An Toàn</h3>
                    <p>Bảo mật thông tin của khách hàng.</p>
                </div><div class="content-items">
                    <img src="images/icon-3.png" alt="alt"/>
                    <h3>Đảm Bảo Uy Tín</h3>
                    <p>Cam kết làm đúng theo hợp đồng và chính sách đã đề ra.</p>
                </div>
            </div>
        </div>

      


        <div class="group-3">
            <div class="group-wrapper">
                <div class="div-wrapper"><div class="text-wrapper-5">Tại Sao Chọn F-Care?</div></div>
            </div>
            <div class="group-4">
                <div class="div-3">
                    <div class="group-5">
                        <img class="group-6" src="img/group-19.png" />
                        <div class="text-wrapper-6">Chính Sách Tốt Nhất</div>
                        <p class="p">Cung cấp chính sách tốt nhất với rủi ro cực kì thấp.</p>
                    </div>
                </div>
                <div class="group-7">
                    <div class="group-8">
                        <div class="group-9">
                            <div class="text-wrapper-7">Đảm Bảo Uy Tín</div>
                            <p class="text-wrapper-8">Cam kết làm đúng theo hợp đồng và chính sách đã đề ra.</p>
                        </div>
                        <img class="group-10" src="img/group-25.png" />
                    </div>
                </div>
                <div class="group-11">
                    <div class="overlap-group-2">
                        <div class="group-12">
                            <div class="group-13">
                                <div class="frame-wrapper">
                                    <div class="frame-2"><div class="text-wrapper-9">An Toàn</div></div>
                                </div>
                                <p class="text-wrapper-10">Bảo mật thông tin của khách hàng.</p>
                            </div>
                            <img class="group-14" src="img/group-20.png" />
                        </div>
                        <div class="div-3"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="group-15">
            <div class="group-16">
                <div class="overlap-wrapper">
                    <div class="overlap-2">
                        <div class="group-17"><div class="text-wrapper-11">Chọn Bảo Hiểm</div></div>
                        <div class="group-18">
                            <div class="overlap-group-3">
                                <div class="text-wrapper-12">Nhận Bảo Hiểm</div>
                                <div class="group-19">
                                    <div class="group-20">
                                        <div class="text-wrapper-13">Gặp Đại Lý</div>
                                        <img class="ellipse" src="img/ellipse-5.png" />
                                    </div>
                                    <img class="ellipse-2" src="img/ellipse-6.png" />
                                    <img class="ellipse-3" src="img/ellipse-7.png" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="group-21">
                <div class="group-22"><p class="text-wrapper-5">Dễ Dàng Tiếp Cận Dịch Vụ</p></div>
                <p class="text-wrapper-14">Dễ dàng tiếp cận, tiện dụng, nhanh chóng!</p>
            </div>
        </div>
        <div class="group-23">
            <div class="group-24">
                <div class="group-25"><p class="text-wrapper-5">Khách hàng của chúng tôi nghĩ gì?</p></div>
                <p class="text-wrapper-15">Chúng tôi luôn tận tâm, nỗ lực vì khách hàng của mình!</p>
            </div>
            <div class="group-26">
                <div class="overlap-3">
                    <img class="group-27" src="img/group-43.png" />
                    <div class="group-28">
                        <div class="overlap-4">
                            <div class="group-29">
                                <div class="overlap-group-4">
                                    <div class="text-wrapper-16">“</div>
                                    <p class="text-wrapper-17">
                                        “ Là một người thích phưu lưu, tôi luôn coi chiếc xe của mình là một người bạn đồng hành và đến
                                        với F-Care là một điều không thể thiếu! ”
                                    </p>
                                </div>
                            </div>
                            <div class="group-30">
                                <img class="group-31" src="img/group-40.png" />
                                <div class="text-wrapper-18">Nguyễn Duy Hùng</div>
                                <div class="text-wrapper-19">Developer</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="group-34">
            <img class="group-35" src="img/group-14.png" />
            <div class="new-button-3"><button class="button">Tìm hiểu thêm</button></div>
            <div class="text">
                <p class="text-wrapper-22">Chúng tôi cung cấp chính sách bảo hiểm xe máy tốt nhất</p>
                <p class="text-wrapper-23">
                    Chúng tôi tự hào là đối tác đáng tin cậy trong việc cung cấp những chính sách bảo hiểm xe máy tốt nhất.
                    Với cam kết mang lại sự an tâm và bảo vệ toàn diện cho khách hàng, chúng tôi không ngừng nỗ lực để đảm bảo
                    rằng mỗi chuyến đi trên con đường đều được bảo vệ tối đa. Từ việc tư vấn chuyên nghiệp đến sự đáng tin cậy
                    trong quản lý và xử lý các trường hợp bảo hiểm, chúng tôi cam kết mang lại trải nghiệm tuyệt vời nhất cho
                    khách hàng của mình. Hãy để chúng tôi đồng hành và bảo vệ mỗi bước đi của bạn trên con đường.
                </p>
            </div>
        </div>
        <footer class="footer">
            <div class="frame-4">
                <div class="text-wrapper-24">Dịch vụ</div>
                <div class="text-wrapper-25">Bảo Hiểm Xe Máy</div>
            </div>
            <div class="frame-5">
                <div class="text-wrapper-26">Truy cập nhanh</div>
                <div class="text-wrapper-25">Trang chủ</div>
                <div class="text-wrapper-25">Giới thiệu</div>
                <div class="text-wrapper-25">Tin tức</div>
                <div class="text-wrapper-25">Liên hệ</div>
                <div class="text-2"></div>
            </div>
            <div class="frame-6">
                <div class="text-wrapper-27">Mạng xã hội</div>
                <img class="group-36" src="img/group-57.png" />
            </div>
            <img class="line" src="img/line-1.svg" />
            <div class="frame-7">
                <div class="text-wrapper-28">Điều Khoản</div>
                <div class="ellipse-4"></div>
                <p class="text-wrapper-28">Chính Sách Quyền Riêng Tư</p>
                <div class="ellipse-4"></div>
                <div class="text-wrapper-28">Copyright ©2024 by F-Care</div>
                <div class="ellipse-4"></div>
                <div class="text-wrapper-28">Liên Hệ</div>
            </div>
            <div class="frame-8">
                <div class="div-2">
                    <div class="overlap-group-wrapper">
                        <div class="overlap-group">
                            <img class="exclude" src="img/exclude.svg" />
                            <img class="subtract" src="img/subtract.svg" />
                            <div class="rectangle-2"></div>
                            <div class="rectangle-3"></div>
                            <img class="img" src="img/exclude-2.svg" />
                            <img class="vector" src="img/vector-3-2.svg" />
                        </div>
                    </div>
                    <div class="f-care">F-Care</div>
                </div>
                <div class="div-2">
                    <div class="text-wrapper-29">Phone</div>
                    <div class="text-wrapper-30">0327983593</div>
                </div>
                <div class="div-2">
                    <div class="text-wrapper-29">Email</div>
                    <div class="text-wrapper-30">fcare@gmail.com</div>
                </div>
            </div>
        </footer>
        <div class="new">
            <div class="text-wrapper-31">Tin mới</div>
            <div class="new-button-4"><button class="button">Xem tất cả</button></div>
            <div class="new-bar">
                <div class="frame-9">
                    <img class="rectangle-4" src="img/rectangle-29-3.svg" />
                    <p class="text-wrapper-32">Tìm Ra Giải Pháp Mới</p>
                    <div class="text-wrapper-33">24 tháng 9, 2024</div>
                </div>
                <div class="frame-9">
                    <img class="rectangle-4" src="img/rectangle-29-2.svg" />
                    <p class="text-wrapper-32">Kết Nối Với Khách Hàng</p>
                    <div class="text-wrapper-33">12 tháng 5, 2024</div>
                </div>
                <div class="frame-9">
                    <img class="rectangle-4" src="img/rectangle-29.svg" />
                    <p class="text-wrapper-32">Bảo Hiểm Du Lịch Mới</p>
                    <div class="text-wrapper-33">4 tháng 1, 2024</div>
                </div>
            </div>
        </div>
    </div>
    <script src="JS/script.js"></script>
    <script>
                document.addEvenListenner('DOMContentLoaded', () => {
                    const toggleButton = document.getElementById('toggleButton');
                    const registrationPanel = document.getElementById('registrationPanel');
                    const registrationForm = document.getElementById('registrationForm');
                    const consultationForm = document.getElementById('consultationForm');
                    const successMessage = document.getElementById('successMessage');

                    toggleButton.addEventListener('click', () => {
                        registrationPanel.classList.toggle('show');
                        registrationForm.classList.toggle('show');
                    });

                    consultationForm.addEventListener('submit', (e) => {
                        e.preventDefault();

                        //xu ly du lieu dang ky

                        //Hien thi thanh cong
                        successMessage.classList.add('show');

                        //an form dang ky
                        registrationPanel.classList.remove('show');
                        registrationForm.classList.remove('show');

                        //an thong bao sau 3s
                        setTimeout(() => {
                            successMessage.classList.remove('show');
                        }, 3000);
                    });
                });

    </script>
</body>
</html>

