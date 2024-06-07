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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F-Care | Update Promotion</title>
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
        <div class="madin d-flex">
            <!--dashboard-->
            <jsp:include page="staffDashboard.jsp"/>

            <div class="content d-flex flex-column align-items-center" style="background-color: #f0f2fa; min-height: 100vh;">
                <!--navbar-->
                <div class=" navbar-custom d-flex justify-content-between align-items-center shadow-3 sticky-top" style="width: 100%;">
                    <button type="button" class="btn btn-secondary btn-sm" data-mdb-ripple-init onclick="goBack()">Back</button>
                    <div class="fs-3 fw-bold text-white me-3">Update Promotion</div>
                </div>
                <!--end navbar-->

                <input type="hidden" name="id" value="${c.id}">

                <div class="p-4 flex-grow-1" style="background-color: #fff;">
                    <form action="UpdatePromotion" method="POST" id="updatePromotionForm" enctype="multipart/form-data"> 
                        <div class="row">
                            <div class="col-md-4 col-sm-12">
                                <div class="fw-bold">
                                    <div class="badge badge-primary">ID: <span class="fw-normal">${c.id}</span></div>  
                                    <div class="badge badge-secondary">Create by: <span class="fw-normal">${c.staff.username}</span></div> 
                                </div>
                                <div class="fw-bold">
                                    Image:
                                    <img class="img-thumbnail" src="${c.image}" alt="image"/>
                                </div>
                                <div class="text-muted">
                                    Replace image here
                                    <input class="form-control" id="newImage" type="file" name="newImage">
                                </div>
                            </div>
                            <div class="col-md-8 col-sm-12">
                                <div class="fw-bold mb-3">
                                    Title
                                    <textarea name="title" id="title" class="form-control">${c.title}</textarea>
                                </div>
                                <div class="fw-bold mb-3">
                                    Description
                                    <textarea name="description" id="description" class="form-control">${c.description}</textarea>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-3">
                                        <span class="fw-bold">Create date:</span> <br> ${c.createDate}
                                    </div>
                                    <div class="col-3">
                                        <span class="fw-bold">Time Start:</span>
                                        <input class="form-control" type="date" id="timeStart" name="timeStart" value="${c.timeStart}" required=""/>
                                    </div>
                                    <div class="col-3">
                                        <span class="fw-bold">Time End:</span>
                                        <input class="form-control" type="date" id="timeEnd" name="timeEnd" value="${c.timeEnd}" required/>
                                    </div>
                                    <div class="col-3">
                                        <span class="fw-bold">Set Header:</span>
                                        <div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="isHeader" id="inlineRadio1" value="true" ${c.isHeader == true?'checked':''}/>
                                                <label class="form-check-label" for="inlineRadio1">True</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="isHeader" id="inlineRadio2" value="false" ${c.isHeader == false?'checked':''}/>
                                                <label class="form-check-label" for="inlineRadio2">False</label>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                                <div>
                                    <span class="fw-bold">Edit content here</span>
                                    <textarea id="content" name="content" required>${c.content}</textarea>
                                </div>
                            </div>
                        </div>

                    </form>

                </div>

                <div class="d-flex justify-content-end align-items-center border-top  sticky-bottom" style="background-color: #fff; padding: 12px; width:100%; height: 65px;">
                    <button type="submit" class="btn btn-primary btn-update me-2" data-mdb-ripple-init data-id="${c.id}">Update</button>
                    <button type="button" class="btn btn-secondary" data-mdb-ripple-init onclick="goBack()">Cancel</button>
                </div>
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
                        formData.append("timeStart", $("#timeStart").val());
                        formData.append("timeEnd", $("#timeEnd").val());

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
                            url: 'UpdatePromotion',
                            type: 'POST',
                            data: formData,
                            processData: false,
                            contentType: false,
                            success: function (response) {
                                alert('Updated successfully!');
                                window.location.href = 'PromotionManagement';
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
