<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <!--summernote-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.css" rel="stylesheet">
        <title>JSP Page</title>
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
                        <form id="consForm">
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
                            <button type="submit" class="btn btn-primary btn-custom">Gửi yêu cầu</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <!-- Bootstrap JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
        <!-- Summernote JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.js"></script>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        
        
        
        <script>

            $(document).ready(function () {
                $('#consultationModal').on('hidden.bs.modal', function () {
                    // Đặt lại giá trị của các trường dữ liệu trong modal
                    $('#name').val('');
                    $('#email').val('');
                    $('#content').val('');
                    $('#consultationModal').modal('hide');
                });

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
                            $('#consultationModal').modal('hide');
                            alert('sent successfully.');

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
