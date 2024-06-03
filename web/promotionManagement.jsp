<%-- 
    Document   : StaffManager
    Created on : Jun 1, 2024, 2:25:44 AM
    Author     : thuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F-Care | Promotion Management</title>

        <!--summer note-->
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    </head>
    <style>
        .navbar-custom {
            background: rgb(0,167,209);
            background: linear-gradient(204deg, rgba(0,167,209,1) 0%, rgba(65,159,163,1) 100%);
        }
    </style>
    <body>
        <div class="main d-flex">
            <!--dashboard-->
            <jsp:include page="staffDashboard.jsp"></jsp:include>

            <!--content-->
            <div class="content d-flex flex-column align-items-center">
                <div class="nav navbar navbar-custom d-flex justify-content-center align-items-center sticky-top" style="width: 100%; top:0;">
                    <div class="fs-3 fw-bold text-white">Promotion Management</div>
                </div>

                <button type="button"
                        class="btn btn-info" 
                        data-mdb-ripple-init
                        data-mdb-modal-init
                        data-mdb-target="#addPromotionModal">
                    <i class="fa-solid fa-plus me-2"></i>Add Promotion
                </button>
            </div>
            <!--end content-->
        </div>


        <!--add promotion modal-->
        <div class="modal fade" id="addPromotionModal" tabindex="-1" aria-labelledby="addPromotionModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addPromotionModalLabel">Add Promotion</h5>
                        <button type="button" class="btn-close" data-mdb-ripple-init data-mdb-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <form action="addPromotion"id="addPromotionForm" method="post" enctype="multipart/form-data">
                                <div class="row mb-3">
                                    <label for="title" class="col-sm-2 col-form-label">Title:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="title" name="title" required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="description" class="col-sm-2 col-form-label">Description:</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" id="description" name="description" required></textarea>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="timeStart" class="col-sm-2 col-form-label">Start Time:</label>
                                    <div class="col-sm-10">
                                        <input type="date" class="form-control" id="timeStart" name="timeStart" required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="timeEnd" class="col-sm-2 col-form-label">End Time:</label>
                                    <div class="col-sm-10">
                                        <input type="date" class="form-control" id="timeEnd" name="timeEnd" required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="image" class="col-sm-2 col-form-label">Image:</label>
                                    <div class="col-sm-10">
                                        <input type="file" class="form-control" id="image" name="image">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="content" class="col-sm-2 col-form-label">Content:</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" id="content" rows="3" required=""></textarea>
                                    </div>
                                </div>
                                <div class="row mb-3 align-items-center">
                                    <label for="isHeader" class="col-sm-2 col-form-label">Is Header:</label>
                                    <div class="col-sm-10 d-flex" id="isHeader">
                                        <div class="form-check me-2">
                                            <input class="form-check-input" type="radio"  name="isHeader" value="true">
                                            <label class="form-check-label" for="">true</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio"  name="isHeader" value="false" checked>
                                            <label class="form-check-label" for="">false</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <hr>
                                    <button type="submit" class="btn btn-primary btn-block" data-mdb-ripple-init><i class="fa-solid fa-plus me-2"></i>Add</button>
                                    <button type="button" class="btn btn-secondary btn-block" data-mdb-ripple-init data-mdb-dismiss="modal">Đóng</button>
                                </div>
                            </form>
                        </div>
                    </div>



                </div>
            </div>
        </div>

    </body>
    <!--summernote-->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script>
        $('#content').summernote({
            placeholder: 'Write your content here!',
            tabsize: 2,
            height: 120,
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'underline', 'clear']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'video']],
                ['view', ['fullscreen', 'codeview', 'help']]
            ]
        });
    </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!--mdb bootstrap-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>

    <script>

        $(document).ready(function () {

            $('#addPromotionForm').on('submit', function (e) {
                e.preventDefault();
                const formData = new FormData();
                formData.append("title", $("#title").val());
                formData.append("description", $("#description").val());
                formData.append("content", $("#content").val());
                formData.append("timeStart", $("#timeStart").val());
                formData.append("timeEnd", $("#timeEnd").val());

                const isHeader = $("input[name=isHeader]:checked").val();
                console.log(isHeader);
                formData.append("isHeader", isHeader);

                let imgFile = $("#image")[0].files[0];
                formData.append("image", imgFile);

                // AJAX request to send the reply to the servlet
                $.ajax({
                    url: 'addPromotion',
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        alert('Add thành công!');
                        location.reload();
                    },
                    error: function (err) {
                        console.log(err);
                        // Show error toast
                        alert('Add failed, try again!');
                    }
                });
            });

        });
    </script>
</html>
