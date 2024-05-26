<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            /* Tùy chỉnh vị trí của button */
            .btn-fixed {
                position: fixed;
                right: 20px;
                bottom: 20px;
                z-index: 1000; /* Đảm bảo button hiển thị trên cùng */
            }
            .btn-custom{
                background-color: #419FA3;
                border-color:#419FA3;
            }
/*            .btn-custom:hover{
                background-color: #198754;
                border-color: #198754;
            }*/
        </style>
    </head>
    <body>
        <button type="button" class="btn btn-primary btn-custom btn-fixed" data-toggle="modal" data-target="#consultationModal">
            Đăng ký tư vấn
        </button>
        <!-- Modal -->
        <div class="modal fade" id="consultationModal" tabindex="-1" aria-labelledby="consultationModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title " id="consultationModalLabel">Đăng ký tư vấn</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Form đăng ký -->
                        <form id="consultationForm" method="post" action="addConsultation">
                            <div class="form-group">
                                <label for="name">Họ và tên</label>
                                <input type="text" class="form-control" name="name" id="name" placeholder="Nhập họ và tên của bạn" required>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" name="email" id="email" placeholder="Nhập địa chỉ email của bạn" required>
                            </div>
                            <div class="form-group">
                                <label for="content">Nội dung</label>
                                <textarea class="form-control" id="content" name="content" rows="3" placeholder="Nhập nội dung tư vấn của bạn" required></textarea>
                            </div>
                            <button id="submit" type="submit" class="btn btn-primary btn-custom">Gửi yêu cầu</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#consultationForm').submit(function (event) {
                 
                    event.preventDefault();
                    var formData = {
                        'name': $('#name').val(),
                        'email': $('#email').val(),
                        'content': $('#content').val()
                    };

                    // Gửi AJAX request
                    $.ajax({
                        type: 'POST', // Hoặc 'POST' tùy thuộc vào cách bạn cấu hình servlet
                        url: 'addConsultation', // Đường dẫn của servlet
                        data: formData,
                        dataType: 'json', // Kiểu dữ liệu mong đợi từ phản hồi của servlet
                        encode: true,
                        success: function (response) {
                            // Xử lý phản hồi từ servlet (nếu cần)
                            console.log(response);
                            // Đóng modal (nếu cần)
                            $('#consultationModal').modal('hide');
                        },
                        error: function (xhr, status, error) {
                            // Xử lý lỗi (nếu có)
                            console.error(error);
                        }
                    });
                });
            });
        </script>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
