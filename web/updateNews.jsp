<%-- 
    Document   : updatePromotion
    Created on : Jun 5, 2024, 4:54:32 PM
    Author     : thuhu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F-Care | Update News</title>
        <!--summer note-->
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
        <style>
            .navbar-custom {
                background: rgb(0,167,209);
                background: linear-gradient(204deg, rgba(0,167,209,1) 0%, rgba(65,159,163,1) 100%);
            }
        </style>
    </head>
    <body>

        <!--main-->

        <!--dashboard-->


        <div class="main-content" id="main-content" style="height: 100%;">
            <jsp:include page="staffDashboard.jsp"/>
            <!--navbar-->
            <div class="nav navbar sticky-top bg-light justify-content-start align-items-center mb-3 px-2">

                <div class="fs-3 fw-bold text-info me-3">Chỉnh sửa tin tức</div>
            </div>
            <!--end navbar-->
            <button type="button" class="btn btn-secondary btn-sm ms-3" data-mdb-ripple-init onclick="goBack()">Trở lại</button>
            <input type="hidden" name="id" value="${c.id}">

            <div class="p-4" style="height: 100vh;">
                <form action="updateNews" method="POST" id="updateNewsForm" enctype="multipart/form-data"> 
                    <div class="row">
                        <div class="col-md-4 col-sm-12">
                            <div class="fw-bold">
                                <div class="badge badge-primary">ID: <span class="fw-normal">${c.id}</span></div>  
                                <div class="badge badge-secondary">Tạo bởi: <span class="fw-normal">${c.staff.username}</span></div> 
                            </div>
                            <div class="fw-bold">
                                Ảnh:
                                <img class="img-thumbnail" src="${c.image}" alt="image"/>
                            </div>
                            <div class="text-muted">
                                Thay đổi ảnh tại đây
                                <input class="form-control" id="newImage" type="file" name="newImage">
                            </div>
                        </div>
                        <div class="col-md-8 col-sm-12">
                            <div class="fw-bold mb-3">
                                Tiêu đề
                                <textarea name="title" id="title" class="form-control">${c.title}</textarea>
                            </div>
                            <div class="fw-bold mb-3">
                                Mô tả
                                <textarea name="description" id="description" class="form-control">${c.description}</textarea>
                            </div>
                            <div class="row mb-3 align-items-center">

                                <div class="col-4 d-flex align-items-center">
                                    <span class="fw-bold me-2">Loại:</span>
                                    <select id="type" name="type" class="form-select">
                                        <option value="Hoạt động công ty" ${c.type == 'Hoạt động công ty'?'selected':''}>Hoạt động công ty</option>
                                        <option value="Hoạt động xã hội" ${c.type == 'Hoạt động xã hội'?'selected':''}>Hoạt động xã hội</option>
                                        <option value="Sản phẩm - Dịch vụ" ${c.type == 'Sản phẩm - Dịch vụ'?'selected':''}>Sản phẩm - Dịch vụ</option>
                                    </select>
                                </div>
                                <div class="col-4 text-center">
                                    <span class="fw-bold">Ngày tạo:</span> <br> <span>${c.createDate}</span> 
                                </div>
                                <div class="col-4">
                                    <span class="fw-bold">Bài nổi bật:</span>
                                    <div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="isHeader" id="inlineRadio1" value="true" ${c.isHeader == true?'checked':''}/>
                                            <label class="form-check-label" for="inlineRadio1">On</label>
                                        </div>

                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="isHeader" id="inlineRadio2" value="false" ${c.isHeader == false?'checked':''}/>
                                            <label class="form-check-label" for="inlineRadio2">Off</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <span class="fw-bold">Chỉnh sửa nội dung tại đây</span>
                                <textarea id="content" name="content" required>${c.content}</textarea>
                            </div>
                        </div>
                    </div>

                </form>

            </div>

            <div class="d-flex justify-content-end align-items-center border-top bg-light sticky-bottom" style="padding: 12px; height: 65px;">
                <button type="submit" class="btn btn-primary btn-update me-2" data-mdb-ripple-init data-id="${c.id}">Lưu</button>
                <button type="button" class="btn btn-secondary" data-mdb-ripple-init onclick="goBack()">Hủy</button>
            </div>
        </div>



        <!--end main-->
        <!--summernote-->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
        <script>
                    function goBack() {
                        window.history.back();
                    }
                    $('#content').summernote({
                        placeholder: 'Write your answer here!',
                        tabsize: 2,
                        height: 400
                    });

                    $(document).ready(function () {

                        $('.btn-update').on('click', function (e) {
                            e.preventDefault();
                            const formData = new FormData();
                            formData.append("id", $("input[name='id']").val());
                            formData.append("title", $("#title").val());
                            formData.append("description", $("#description").val());
                            formData.append("content", $("#content").val());
                            console.log("content: " + $("#content").html());
                            formData.append("type", $("#type").val());

                            const isHeader = $("input[name=isHeader]:checked").val();
                            formData.append("isHeader", isHeader);

                            let imgFile = $("#newImage")[0].files[0];
                            if (imgFile) {
                                formData.append("image", imgFile);
                            } else {
                                formData.append("image", null);
                            }

                            console.log("FormData values:");
                            for (var pair of formData.entries()) {
                                console.log(pair[0] + ': ' + pair[1]);
                            }
                            $.ajax({
                                url: 'updateNews',
                                type: 'POST',
                                data: formData,
                                processData: false,
                                contentType: false,
                                success: function (response) {
                                    alert('Updated successfully!');
                                    window.location.href = 'newsManager';
                                },
                                error: function (err) {
                                    console.log(err);
                                    // Show error toast
                                    alert('update failed, try again!');
                                }
                            });
                        });
                    });
        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- MDB -->
        <script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
    </body>
</html>
