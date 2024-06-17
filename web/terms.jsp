<%-- 
    Document   : terms
    Created on : May 26, 2024, 12:39:18 AM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F-Care | Điều Khoản Sử Dụng</title>
        <style>
            .middle{
                position: relative;
                width: 100%;
                height: 500px;
                display: block;
                text-align: center;
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
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="middle">
                <div class="bg-img"></div>
                <div class="middle-content">
                    <div class="f-title">Các Điều Kiện Sử Dụng</div>
                </div>
            </div>
            <div class="container py-4">
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <div class="list-group">
                            <a href="view?id=1" class="list-group-item align-items-center d-flex justify-content-between active" style="background-color:#419FA3; border-color: #419FA3">
                                <span>Điều khoản sử dụng</span><span class="me-2">&rarr;</span>
                            </a>
                            <a href="view?id=2" class="list-group-item align-items-center d-flex justify-content-between">
                                <span>Quy định về quyền riêng tư</span> <span class="me-2">&rarr;</span>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <h3 style="color: #419FA3;">ĐIỀU KHOẢN SỬ DỤNG</h3>

                        <div class="accordion" id="accordionPanelsStayOpenExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                                    <button class="accordion-button" 
                                            type="button" 
                                            data-mdb-collapse-init
                                            data-mdb-target="#panelsStayOpen-collapseOne" 
                                            aria-expanded="true" 
                                            aria-controls="panelsStayOpen-collapseOne">
                                        CÁC ĐIỀU KIỆN SỬ DỤNG
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne" data-mdb-parent="#accordionPanelsStayOpenExample">
                                    <div class="accordion-body">
                                        <p><strong>1. Trang web này  (<a href="#">www.fcare.com.vn</a>)</strong> do Tổng Công Ty Bảo Hiểm F-Care sở hữu và điều hành. Việc sử dụng trang web 
                                            này phụ thuộc vào các Điều khoản và Điều Kiện của trang web này. Các <i><strong>Điều Khoản và Điều Kiện</strong></i> bao gồm:</p>
                                        <p>(A) các điều khoản và điều kiện nêu trong văn bản này và (B) mọi điều khoản bổ sung cụ thể để điều chỉnh việc sử dụng, và truy cập vào, một số mục của trang web này, 
                                            (và các điều khoản bổ sung đó sẽ có hiệu lực ràng buộc khi chúng xuất hiện trên trang web này).</p>
                                        <p>2. Khi sử dụng trang web này, bạn <strong>đồng ý</strong> với các <strong>Điều khoản và Điều kiện</strong>; và đây là một hợp đồng có giá trị ràng buộc giữa bạn và F-Care. 
                                            Vì thế, bạn hãy đọc kỹ các Điều Khoản và Điều Kiện của trang web này.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                                        CÁC HẠN CHẾ VÀ SỬ DỤNG CÁC THÔNG TIN TÀI LIỆU
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                                    <div class="accordion-body">
                                        <p>3. <strong>Trừ khi được F-Care đồng ý</strong> bằng văn bản một cách khác đi, bạn sẽ không sao chép, sao lại, tái bản, đưa lên mạng, công bố, chuyển, tạo liên kết đến hoặc phân phối dưới bất cứ hình thức nào các thông tin và tài liệu trên trang web này. Bạn có thể tải xuống các thông tin và tài liệu công bố trên trang web này để bạn sử dụng với điều kiện là bạn không dỡ bỏ các thông tin về bản quyền hoặc các quyền khác gắn với 
                                            các thông tin và tài liệu đó. Bạn không được phân phối, sửa đổi, chuyển đi, sử dụng lại, công bố, tạo liên kết hoặc sử dụng các nội dung của trang web này cho các mục đích kinh doanh hoặc công cộng, bao gồm cả các thông tin bằng chữ, các hình ảnh, các tập tin âm thanh và hình ảnh khi chưa có sự cho phép bằng văn bản của F-Care.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                                        THỜI GIAN HOẠT ĐỘNG
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                                    <div class="accordion-body">
                                        <p>4. Trang web hoạt động <strong>24 giờ x 7 ngày</strong>. Tuy nhiên, F-Care bảo lưu quyền ngắt hệ thống để bảo trì khi cần thiết. 
                                            F-Care sẽ cố gắng để lên kế hoạch và thông báo về việc hệ thống không sử dụng được bằng cách đưa một thông báo trên mạng trực tuyến. F-Care không chịu trách nhiệm đối với bất cứ thiệt hại hoặc mất mát nào do việc hệ thống bị ngắt trong trường hợp này.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingFour">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseFour">
                                        TÀI KHOẢN NGƯỜI SỬ DỤNG
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFour">
                                    <div class="accordion-body">
                                        <p>5. Bạn sẽ đăng ký và được cung cấp một Tài Khoản Người Sử Dụng để có thể mua bảo hiểm trên trang web này. Bạn sẽ giữ bí mật thông tin về Tài Khoản Người Sử Dụng này vào mọi thời điểm, và sẽ bảo đảm rằng Tài Khoản Người Sử Dụng của bạn sẽ không bị tiết lộ theo bất cứ cách thức nào cho bất kỳ ai.</p>
                                        <p>6. F-Care sẽ không chịu trách nhiệm về bất cứ giao dịch không được phép nào do việc Tài Khoản Của Người Sử Dụng bị sử dụng sai hoặc sử dụng mà không được phép. Bạn phải lập tức thông báo cho F-Care bất cứ trường hợp nào mà Tài Khoản Của Người Sử Dụng của bạn bị sử dụng sai hoặc sử dụng mà không được phép. Bạn chịu trách nhiệm hoàn toàn về việc bảo mật tên truy cập và mật khẩu và đối với bất cứ việc truy cập nào sử dụng Tài Khoản Người Sử Dụng và mật khẩu của bạn</p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingFive">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseFive" aria-expanded="false" aria-controls="panelsStayOpen-collapseFive">
                                        BẢN QUYỀN VÀ NHÃN HIỆU
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseFive" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFive">
                                    <div class="accordion-body">
                                        <p>7. Mọi nhãn hiệu hàng hóa, nhãn hiệu dịch vụ, tên thương mại, logo, biểu tượng và tên miền đặt trên trang web này là tài sản của F-Care và các đối tác khác (nếu có). Không có điều gì trên trang web này có thể được hiểu là, dù là ngầm định hay cách khác, cho phép sử dụng hoặc bất cứ quyền sử dụng nào liên quan đến bất cứ nhãn hiệu hàng hóa, nhãn hiệu dịch vụ, tên thương mại, logo, biểu tượng và tên miền đặt trên trang web này khi chưa có sự đồng ý bằng văn bản cùa F-Care hoặc bên thứ ba sở hữa các nhãn hiệu hoặc tên thương mại đặt trên trang web này. Bạn hoàn toàn không được sử dụng bất cứ nhãn hiệu hàng hóa, nhãn hiệu dịch vụ, tên thương mại, logo, biểu tượng và tên miền đặt trên trang web này hoặc bất cứ nôi dung nào khác có trên trang web này, trừ khi được cho phép trong tài liệu này. Các hình ảnh đặt trên trang web này là tài sản của F-Care hoặc được F-Care sử dụng theo sự đồng ý của chủ sở hữu. Trừ khi được cho phép cụ thể, bạn không được sử dụng bất cứ hình ảnh nào đặt trên trang web này, bạn cũng không được ủy quyền cho bất cứ người nào sử dụng bất cứ hình ảnh nào đặt trên trang web này. Bất cứ việc sử dụng không được phép nào đối với các hình ảnh này có thể vi phạm luật tác quyền, luật nhãn hiệu, luật về quyền riêng tư và luật xuất bản, và các quy định về thông tin khác.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingSix">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseSix" aria-expanded="false" aria-controls="panelsStayOpen-collapseSix">
                                        QUY ĐỊNH VỀ QUYỀN RIÊNG TƯ
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseSix" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingSix">
                                    <div class="accordion-body">
                                        <p>8. Xin đọc kỹ Chính sách riêng tư trên website chúng tôi. Chính sách này giải thích rõ những thông tin nào F-CareCare có thể thu thập từ bạn trên trang web của chúng tôi và cách thức chúng tôi sẽ sử dụng và bảo vệ các thông tin của bạn. Chúng tôi sẽ không thu thập mất cứ thông tin xác định danh tính cá nhân nào trên trang web của chúng tôi trừ khi bạn cung cấp các thông tin đó cho chúng tôi.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingBay">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseBay" aria-expanded="false" aria-controls="panelsStayOpen-collapseBay">
                                        LIÊN KẾT CÁC TRANG WEB KHÁC
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseBay" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingBay">
                                    <div class="accordion-body">
                                        F-Care sẽ cố gắng để lên kế hoạch và thông báo về việc hệ thống không sử dụng được bằng cách đưa một thông báo trên mạng trực tuyến. F-Care không chịu trách nhiệm đối với bất cứ thiệt hại hoặc mất mát nào do việc hệ thống bị ngắt trong trường hợp này.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="panelsStayOpen-headingTam">
                                    <button class="accordion-button collapsed" type="button" data-mdb-collapse-init data-mdb-target="#panelsStayOpen-collapseTam" aria-expanded="false" aria-controls="panelsStayOpen-collapseTam">
                                        AN NINH CỦA TRANG WEB
                                    </button>
                                </h2>
                                <div id="panelsStayOpen-collapseTam" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTam">
                                    <div class="accordion-body">
                                        <p>10. Bạn sẽ không xâm phạm hoặc cố gắng xâm phạm an ninh của trang web này, bao gồm nhưng không giới hạn, các hành vi dưới đây:</p>
                                        <p>(i) Truy cập thông tin hoặc nối vào một máy chủ hoặc tài khoản mà bạn không được phép truy cập;</p>
                                        <p>(ii) Cố gắng thăm dò, kiểm tra hoặc thử nghiệm điểm yếu của một hệ thống hoặc hệ thống mạng để vi phạm an ninh hoặc biện pháp nhận dạng mà không được F-CareCare cho phép bằng văn bản;</p>
                                        <p>(iii) Cố gắng can thiệp vào dịch vụ cung cấp cho bất cứ người sử dụng nào, máy chủ hoặc hệ thống mạng nào, bằng cách phát tán vi rút hoặc mã độc lên trang web, làm quá tải hoặc gây ra hiện tượng thư rác (spamming) trên trang web; và/hoặc</p>
                                        <p>(iv) Thay đổi thông tin header của gói TCP/IP hoặc bất cứ phần thông tin nào của header trong bất cứ email hay nhóm email gửi đi.</p>
                                        <p>11. Bạn không sử dụng Trang Web cho bất cứ mục đích bất hợp pháp nào.</p>
                                        <p>12. Bạn phải đảm bảo rằng tất cả các thông tin được đưa lên Trang Web là đầy đủ, chính xác, có thật, phù hợp và nhất quán với các tài liệu chứa đựng các thông tin này. Vi phạm điều này sẽ dẫn đến việc chậm trễ trong quy trình xử lý hoặc các thông tin điện tử được đưa lên bị loại bỏ. Bạn phải chịu trách nhiệm đối với toàn bộ chi phí phát sinh do việc đưa thông tin giả mạo hoặc sai.</p>
                                        <p>13. Bạn sẽ không tấn công hoặc cố gắng tấn công hoặc làm hại trang web bằng bất cứ hình thức, phương tiện nào như các công cụ tấn công, virút và chương trình máy tính có chứa các mã có thể gây hỏng máy tính. Bất cứ cố gắng nào để thực hiện các hành vi như vậy đều khiến bạn phải chịu sự truy tố theo qui định của pháp luật hiện hành.</p>
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
        <jsp:include page="footer.jsp"/>
    </body>
</html>
