<%-- 
    Document   : privacy
    Created on : May 26, 2024, 12:39:18 AM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F-Care | Quy định về quyền riêng tư</title>
        <style>
            .middle{
                position: relative;
                width: 100%;
                height: 500px;
                display: block;
                text-align: center;
                /*    margin-top: 50px;*/


            }
            .f-title{
                font-size:40px;
                font-weight: bold;
            }
            .f-quote{
                font-size:20px;
                line-height: 30px;
                font-style: italic;
            }
            .bg-img{
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: url('images/side-view-man-with-motorbike.jpg'); /* Thay thế link_to_your_image.jpg bằng URL của ảnh bạn muốn sử dụng */
                background-size: cover;
                background-position: center;

            }
            .bg-img::after {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(16, 12, 12, 0.54); /* Màu của lớp phủ */
            }
            .middle-content{
                position: relative;
                color: white;
                align-content: center;
                height: 100%;
            }

            .intro-section {
                background-color: #f8f9fa;
                padding: 80px 0;
            }
            .intro-text {
                text-align: justify;
            }
            .intro-text h1 {
                font-size: 36px;
                color: #333;
            }
            .intro-text p {
                font-size: 18px;
                color: #666;
            }
        </style>
        <style>
            .container{
                margin-top: 20px;
                margin-bottom: 20px;
            }
            .list-group-item {
                cursor: pointer;
            }
            .list-group-item .active {
                background-color: #f0f0f0;
                border-color: #f0f0f0;
            }
            .list-group-item:hover {
                background-color: #f0f0f0;
            }
            .active{

            }



        </style>

    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="spinnerLoading.jsp"/>
            <div class="middle">
                <div class="bg-img"></div>
                <div class="middle-content">
                    <div class="f-title">Quy Định Về Quyền Riêng Tư</div>
                    <!--                    <p class="f-quote">
                                            “Đến với F-Care, chúng tôi cung cấp cho bạn dịch vụ bảo hiểm xe máy với chi phí và chính sách tốt nhất.<br />
                                            Đồng hành cùng bạn mỗi bước đường. Bảo hiểm xe máy cho mọi hành trình!”
                                        </p>-->
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="list-group">
                            <a href="view?id=1" class="list-group-item align-items-center d-flex justify-content-between" >
                                <span>Điều khoản sử dụng</span><span class="me-2">&rarr;</span>
                            </a>
                            <a href="view?id=2" class="list-group-item align-items-center d-flex justify-content-between active" style="background-color:#419FA3; border-color: #419FA3;">
                                <span>Quy định về quyền riêng tư</span> <span class="me-2">&rarr;</span>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <h3 style="color: #419FA3;">QUY ĐỊNH VỀ QUYỀN RIÊNG TƯ</h3>
                        <div class="accordion" id="accordionPanelsStayOpenExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                                    <button class="accordion-button" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                                        CHÍNH SÁCH QUYỀN RIÊNG TƯ TRÊN INTERNET
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                                    <div class="accordion-body">
                                        <p>Tại F-Care, chúng tôi tận tâm để “mang đến một cuộc sống an toàn và đảm bảo hơn cho mọi người”, cam kết này của chúng tôi cũng được thể hiện qua việc “bảo đảm” quyền riêng tư của bạn trên trang web này. Xin đọc Chính Sách Về Quyền Riêng Tư Trên Internet dưới đây. Chính sách này giải thích rõ cách thức mà F-Care chúng tôi nỗ lực để xây dựng lòng tin của bạn và bảo đảm an toàn cho các thông tin của bạn thông qua các chính sách trên trang web của chúng tôi.</p>
                                        <p>Chính Sách Về Quyền Riêng Tư Trên Internet áp dụng cho việc quy cập của bạn vào trang web của chúng tôi tại www.fcare.com.vn và các trang web con.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                                        THU THẬP THÔNG TIN
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                                    <div class="accordion-body">
                                        <p>Các thông tin được F-Care thu thập phụ thuộc vào yêu cầu của bạn. Việc thu thập các thông tin này là nhằm giúp chúng tôi cung cấp tốt hơn các sản phẩm mà chúng tôi cung cấp cho bạn. Dưới đây là vài ví dụ về các loại thông tin mà chúng tôi thu thập trên trang web của F-Care nếu bạn đồng ý cung cấp chúng:</p>
                                        <p>"Liên lạc với chúng tôi" & các mẫu yêu cầu thư điện tử - Tên & địa chỉ thư điện tử</p>
                                        <p>Mẫu yêu cầu cung cấp thông tin - Tên & địa chỉ thư tín và/hoặc địa chỉ thư điện tử</p>
                                        <p>Trong một số ứng dụng trên nền tảng Mobile như app Baoviet Autoclaim sẽ thu nhập dữ liệu về vị trí của người dùng nhằm mục đích xác định được vị trí của người sử dụng, từ đó cho phép xác định được quãng đường, thời gian của người sử dụng đến địa điểm cần giám định</p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                                        SỬ DỤNG CÁC THÔNG TIN THU THẬP
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                                    <div class="accordion-body">
                                        <p>Các thông tin mà F-Care thu thập sẽ được sử dụng để cung cấp báo giá khi được yêu cầu, quản lý các hợp đồng bảo hiểm, trả lời các câu hỏi hoặc thắc mắc, đăng ký tham gia vào các sự kiện do F-Care tài trợ, và cung cấp các thông tin được yêu cầu một cách kịp thời.</p>
                                        <p>Bằng việc sử dụng trang web của chúng tôi, F-Care có thể lấy được các thông tin chung mang tính thống kê (từ các tập tin nhật ký (log files)) ví dụ như: tên miền, địa chỉ IP hoặc loại trình duyệt của những người sử dụng trang web của chúng tôi. Các thông tin lấy được từ tập tin nhật ký (log file) không chứa đựng các thông tin giúp xác định danh tính cá nhân, như tên, địa chỉ, điện thoại, v.v… và chỉ được sử dụng cho mục đích thống kê chung.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingFour">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseFour">
                                        COOKIES
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFour">
                                    <div class="accordion-body">
                                        <p>Cookie là gì? Cookies là các tập hợp thông tin mà máy chủ của trang web của chúng tôi cấp cho bạn khi bạn sử dụng trang web của chúng tôi. Cookies được sử dụng trong một vài khu vực trên trang web của chúng tôi chỉ để duy trì các thông tin giữa các trang. Chúng sẽ không được sử dụng để lưu giữ hoặc xác định các thông tin cá nhân của các khách hàng của chúng tôi. Các Cookies này đơn giản chỉ nhằm đưa các thông tin bạn cung cấp trên một trang màn hình sang trang màn hình tiếp theo, giúp bỏ bớt yêu cầu phải cung cấp lại thông tin. Các Cookies này không thu thập bất cứ thông tin cá nhân nào của bạn hoặc của máy tính của bạn. Bạn có quyền chọn chấp nhận hoặc không chấp nhận Cookie, tuy nhiên, nếu bạn từ chối Cookie hoặc nếu chức năng Cookies trên trình duyệt của bạn bị tắt, một vài phần của trang web này sẽ không hoạt động được.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingFive">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseFive" aria-expanded="false" aria-controls="panelsStayOpen-collapseFive">
                                        TRANG WEB KHÔNG THUỘC F-CARE
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseFive" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFive">
                                    <div class="accordion-body">
                                        <p>F-Care không chịu trách nhiệm về các chính sách về quyền riêng tư cũng như nội dung của bất cứ trang web nào trên mạng Internet có thể có đường dẫn đến trang web của F-Care. Xin được lưu ý rằng khi bạn bấm chuột vào các trang web ngoài trang web www.baoviet.com.vn/insurance, bạn đã được chuyển sang một trang web khác có thể không thuộc quyền quản lý của F-Care. Chúng tôi khuyến nghị bạn nên đọc các chính sách về quyền riêng tư của các trang web được dẫn đến đó vì các chính sách về quyền riêng tư của họ có thể khác với chính sách của chúng tôi.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingSix">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseSix" aria-expanded="false" aria-controls="panelsStayOpen-collapseSix">
                                        CHIA SẺ CÁC THÔNG TIN ĐƯỢC THU THẬP
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseSix" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingSix">
                                    <div class="accordion-body">
                                        <p>Trang web F-Care được thiết kế để cung cấp cho các khách hàng, các khách hàng tiềm năng của chúng tôi và những người viếng thăm trang web của chúng tôi một phương thức bảo mật để có được các thông tin về Công ty chúng tôi, các dịch vụ và sản phẩm của chúng tôi, và để giao dịch với chúng tôi qua Internet. Trang web của chúng tôi sẽ chỉ thu thập các thông tin mà bạn tự nguyện cung cấp để giúp chúng tôi đáp ứng các yêu cầu của bạn. Nếu bạn đã cung cấp các thông tin cá nhân trên trang web của chúng tôi để yêu cầu cung cấp báo giá, để chúng tôi quản lý các hợp đồng bảo hiểm, hoặc để yêu cầu chúng tôi trả lời các câu hỏi,… chúng tôi có thể phải chia sẻ các thông tin đó cho các bên được ủy thác, nếu cần thiết, để phục vụ các yêu cầu của bạn. Chúng tôi cũng có thể sẽ gửi và lưu trữ các thông tin này tại các bên thứ ba làm dịch vụ xử lý, lưu trữ và/hoặc sao lưu dữ liệu cho công ty chúng tôi. Chúng tôi không bán các thông tin khách hàng cho các công ty cung cấp danh sách địa chỉ emails hay các công ty kinh doanh tiếp thị qua điện thoại.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingBay">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseBay" aria-expanded="false" aria-controls="panelsStayOpen-collapseBay">
                                        BẢO VỆ CÁC THÔNG TIN THU THẬP VÀ ĐẢM BẢO AN TOÀN THÔNG TIN
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseBay" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingBay">
                                    <div class="accordion-body">
                                        <p>Các thông tin cá nhân bạn đã cung cấp sẽ được tiếp cận bởi một số nhân viên và đại lý của F-Care, những người cần biết các thông tin đó để phục vụ các yêu cầu của bạn. F-Care duy trì các biện pháp và quy trình bảo vệ thông tin tuân thủ các quy định của pháp luật nhằ bảo vệ các thông tin cá nhân của bạn. F-Care sẽ lưu giữ các thông tin thu thập được trong thời gian pháp luật yêu cầu hoặc cho phép.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingTam">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseTam" aria-expanded="false" aria-controls="panelsStayOpen-collapseTam">
                                        THÔNG BÁO VỀ CÁC THAY ĐỔI
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseTam" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTam">
                                    <div class="accordion-body">
                                        <p>Chính Sách Về Quyền Riêng Tư Trên Internet này có thể được sửa đổi vào từng thời điểm. Nếu Chính Sách Về Quyền Riêng Tư trên Internet thay đổi, chúng tôi sẽ cập nhật các thay đổi đó trên trang web này tại địa chỉ www.fcare.com.vn. Bạn có thể vào trang web này thường xuyên để đọc bản cập nhật mới nhất của Chính Sách Về Quyền Riêng Tư Trên Internet.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingChin">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseChin" aria-expanded="false" aria-controls="panelsStayOpen-collapseChin">
                                        KHÔNG CHỊU TRÁCH NHIỆM
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseChin" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingChin">
                                    <div class="accordion-body">
                                        <p>14. Mặc dù F-CareCare thực hiện mọi sự cẩn trọng khi cung cấp dịch vụ tại trang web, F-CareCare không cam kết rằng trang web này sẽ hoạt động không có lỗi hoặc hoàn toàn không có vi-rút, worms, Trojan horses hoặc các mã độc hại khác. F-CareCare không chấp nhận bất cứ trách nhiệm nào, và sẽ không chịu trách nhiệm về bất cứ thiệt hại nào xảy ra cho thiết bị máy tính hoặc các tài sản khác của bạn do việc bạn truy cập vào, sử dụng, hoặc lướt trang web này hoặc việc bạn tải xuống bất cứ tài liệu, dữ liệu, các thông tin bằng chữ, các hình ảnh, các đoạn video, hoặc các tập tin âm thanh nào từ trang web này hoặc phát sinh liên quan đến việc chậm thực hiện, lỗi, thiếu sót, bị gián đoạn, lỗi, vi-rút máy tính, chậm trễ trong hoạt động hoặc truyền dữ liệu, hoặc lỗi hệ thống hoặc đường truyền.</p>
                                        <p>15. F-CareCare cũng từ chối mọi trách nhiệm đối với: </p>
                                        <p>(i) bất cứ tổn thất nào hoặc không có khả năng lấy lại các dữ liệu hoặc thông tin vì bất cứ lý do gì và bao gồm việc không chuyển được, việc sử dụng không đúng mục đích hoặc việc chuyển sai do kết quả của bất cứ sự gián đoạn, ngưng hoặc chấm dứt dịch vụ trên trang web này;</p>
                                        <p>(ii) Bất cứ sự sai sót của các thông tin hoặc nguồn tài nguyên có sẵn, nhận được hoặc được chuyển thông qua trang web;</p>
                                        <p>(iii) bất cứ trục trặc, khuyết điểm hoặc sai sót của Trang Web;</p>
                                        <p>(iv) bất cứ sự chậm trễ hoặc không có khả năng trong việc cung cấp dịch vụ của F-CareCare tại trang Web theo các Điều Khoản và Điệu Kiện do bất cứ khuyết điểm hoặc hỏng hóc về điện tử, cơ khí, hệ thống, xử lý dữ liệu hoặc viễn thông, thiên tai, xáo trộn dân sự hoặc bất cứ sự kiện nào nằm ngoài sự kiểm soát của F-CareCare.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingMuoi">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseMuoi" aria-expanded="false" aria-controls="panelsStayOpen-collapseMuoi">
                                        MIỄN TRỪ TRÁCH NHIỆM
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseMuoi" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingMuoi">
                                    <div class="accordion-body">
                                        <p>16. Trong bất cứ trường hợp nào, F-CareCare cũng không chịu trách nhiệm về bất cứ thiệt hại, tổn thất hoặc chi phí, bao gồm nhưng không giới hạn, thiệt hại trực tiếp, đặc biệt hoặc do hệ quả của, hoặc tổn thất kinh tế phát sinh từ hoặc có liên quan hoặc có thể quy cho:</p>
                                        <p>(i) Bất cứ việc truy cập, sử dụng hoặc không thể truy cập hoặc sử dụng Trang Web hoặc dịch vụ này, hoặc tin cậy vào những thông tin trên Trang Web này;</p>
                                        <p>(ii) Bất cứ sự hỏng hóc, sai sót, chểnh mảng, gián đoạn hoặc chậm trễ trong việc truyền dữ liệu; và/hoặc</p>
                                        <p>(iii) Bất cứ vi rút máy tính hoặc hoặc các mã độc hại, hoặc các đoạn mã, chương trình hay macro mang tính chất làm hỏng hoặc phá hủy khác có thể ảnh hưởng đến các thiết bị, chương trình máy tính hoặc các tài sản khác của bạn.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingElevent">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseElevent" aria-expanded="false" aria-controls="panelsStayOpen-collapseElevent">
                                        BỒI THƯỜNG
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseElevent" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingElevent">
                                    <div class="accordion-body">
                                        <p>17. Bằng việc truy cập vào trang web này, bạn đồng ý bồi thường cho F-CareCare, giữ cho F-CareCare khỏi mọi thiệt hại và bảo vệ F-CareCare khỏi bất cứ khiếu nại, hành động hoặc đòi hỏi, bao gồm nhưng không giới hạn các chi phí pháp lý và kế toán hợp lý, được cho là hoặc là kết quả của việc bạn sử dụng trang web này hoặc dịch vụ tại trang web này, hoặc do việc bạn vi phạm các Điều Khoản và Điều Kiện.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingTWE">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseTWE" aria-expanded="false" aria-controls="panelsStayOpen-collapseTWE">
                                        CHẤM DỨT
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseTWE" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTWE">
                                    <div class="accordion-body">
                                        <p>18. F-CareCare bảo lưu quyền, theo quyết định riêng của F-CareCare, chấm dứt dịch vụ trên trang web này vào bất cứ thời điểm nào, có hoặc không có lý do hoặc chấm dứt quyền truy cập vào trang web này của bạn mà không cần báo trước và không cần lý do. Bằng việc truy cập vào trang web này, bạn được coi là từ bỏ quyền được F-CareCare thông báo về việc chấm dứt này, nếu có. F-CareCare không chịu trách nhiệm về bất cứ thiệt hại, mất mát hoặc chí phí phát sinh theo bất cứ cách thức nào, từ hoặc do việc chấm dứt dịch vụ trên trang web này.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingThird">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseThird" aria-expanded="false" aria-controls="panelsStayOpen-collapseThird">
                                        SỬA ĐỔI
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseThird" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThird">
                                    <div class="accordion-body">
                                        <p>19. F-CareCare có thể thay đổi và thay thế nội dung các Điều Khoản và Điều Kiện này và/hoặc qui định thêm các điều kiện và điều khoản mới vào bất cứ thời điểm nào mà không cần báo trước cho bạn. Bằng việc sử dụng trang web này, bạn được coi là từ bỏ quyền được thông báo hoặc chấp thuận bất cứ sửa đổi, thay đổi hoặc bổ sung nào với các Điều Khoản và Điều Kiện, nếu có. Các thay đổi sẽ có hiệu lực vào ngày đầu tiên được đưa lên trang web này. Nếu bạn tiếp tục sử dụng trang web sau thời gian đó, bạn được xem là đã chấp nhận các thay đổi.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingFourth">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseFourth" aria-expanded="false" aria-controls="panelsStayOpen-collapseFourth">
                                        LUẬT ĐIỀU CHỈNH VÀ CƠ QUAN XỬ LÝ TRANH CHẤP
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseFourth" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFourth">
                                    <div class="accordion-body">
                                        <p>20. Hợp đồng này được điều chỉnh và giải thích theo pháp luật Việt Nam.</p>
                                        <p>21. Trong trường hợp có tranh chấp giữa bạn và F-CareCare phát sinh từ hoặc có liên quan đến hợp đồng này (“Tranh Chấp”), mỗi Bên nỗ lực tối đa để thảo luậncác vấn đề với mục đích giải quyết Tranh Chấp thông qua biện pháp hòa giải. Nếu Tranh Chấp không được giải quyết theo Điều 33 của Thỏa thuận này, bất cứ Tranh Chấp sẽ được xử chung thẩm bằng biện pháp trọng tài tại Trọng Tài Quốc Tế Việt Nam bên cạnh Phòng Thương Mại và Công Nghiệp Việt Nam (“VIAC”) theo Quy chế trọng tài của VIAC và ngôn ngữ trọng tài được sử dụng là Tiếng Anh.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- MDB -->
        <!--<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>-->
    </body>
</html>
