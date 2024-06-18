<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultation</title>
        <style>
            
            .btn-fixed {
                position: fixed;
                right: 20px;
                bottom: 20px;
                z-index: 1000; 
            }
            .btn-custom{
                background-color: #419FA3 !important;
                border-color:#419FA3 !important;
            }
          
        </style>
    </head>
    <body> 
        <button type="button" class="btn btn-primary btn-custom btn-fixed" data-bs-toggle="modal" data-bs-target="#consultationModal">
            Đăng ký tư vấn
        </button>
        <!-- Modal -->
        <div class="modal fade" id="consultationModal" tabindex="-1" aria-labelledby="consultationModalLabel"data-bs-backdrop="true" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title " id="consultationModalLabel">Đăng ký tư vấn</h5>
                        <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Form đăng ký -->
                        <form id="consForm">
                            <div class="form-group mb-3">
                                <label class="form-label" for="name">Họ và tên</label>
                                <input type="text" class="form-control" name="name" id="name" placeholder="Nhập họ và tên của bạn" required>
                            </div>
                            <div class="form-group mb-3">
                                <label class="form-label" for="email">Email</label>
                                <input type="email" class="form-control" name="email" id="email" placeholder="Nhập địa chỉ email của bạn" required>
                            </div>
                            <div class="form-group mb-3">
                                <label class="form-label" for="content">Nội dung</label>
                                <textarea class="form-control" id="content" name="content" rows="3" placeholder="Nhập nội dung tư vấn của bạn" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary btn-custom">Gửi yêu cầu</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
