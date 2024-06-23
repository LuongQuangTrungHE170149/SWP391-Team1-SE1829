<%-- 
    Document   : newsManager
    Created on : Jun 23, 2024, 9:50:43 PM
    Author     : thuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tin tức</title>
        <!--summer note--> 
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="staffDashboard.jsp"/>

        <div class="main-content" id="main-content">
            <!--nav-->
            <div class="nav navbar bg-light sticky-top justify-content-between align-items-start mb-3 px-2"> 
                <div class="fs-3 fw-bold text-info">News Manager</div>
                <!--search-->
                <div>
                    <form action="newsManager" method="GET" class="input-group" id="select-Form">
                        <div>
                            <div class="form-outline d-flex" data-mdb-input-init>
                                <input type="search" id="formSearch" 
                                       name="searchValue" 
                                       class="form-control rounded" 
                                       aria-label="Search" aria-describedby="search-addon"
                                       Value="${searchValue!=null?searchValue:''}" 
                                       placeholder="Title, description..."/>
                                <button type="submit" class="input-group-text border-0" id="search-addon">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                            <c:if test="${not empty searchValue && searchValue != null}">
                                <div class="text-danger fw-bold mt-3">Tìm được <span class="fs-5">${totalNews}</span> bản ghi với "<span class="fs-5">${searchValue}</span>"</div>
                            </c:if>
                        </div>
                        <div class="ms-3">
                            <c:set var="dataList" value="${requestScope.listStaffAddNews}" />
                            <c:set var="selectedStaff" value="${requestScope.selectedStaff}" />
                            <select class="form-select" name="selectedStaff" id="form-select" onchange="document.getElementById('select-Form').submit();">
                                <option disabled="">Staff</option>
                                <option value="">All</option>
                                <c:forEach var="record" items="${dataList}">
                                    <option value="${record[0]}" ${record[0] == selectedStaff ? 'selected' : ''}>${record[1]}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div>
                            <h3 class="ms-3"><span class=" badge badge-danger">${totalNews}</span></h3>
                        </div>

                    </form>
                </div>
                <div class="">
                    <div>
                        <button type="button" class="btn btn-info btn-sm" onclick="location.href = 'newsManager?getHeader=true'" data-mdb-ripple-init>Header</button>
                        <button type="button"
                                class="btn btn-info btn-sm" 
                                data-mdb-ripple-init
                                data-mdb-modal-init
                                data-mdb-target="#addNewsModal">
                            <i class="fa-sharp fa-solid fa-plus"></i>Add
                        </button>
                    </div>
                    <p class="m-0 text-danger">${invalidHeader}</p>
                </div>
                <!--end search-->
            </div>
            <!--nav-->



            <!--add promotion modal-->
            <div class="modal fade" id="addNewsModal" tabindex="-1" aria-labelledby="addNewsModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title text-info" id="addNewsModalLabel">Add News</h5>
                            <button type="button" class="btn-close" data-mdb-ripple-init data-mdb-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <form action="addNews"id="addNewsForm" method="post" enctype="multipart/form-data">
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
                                        <label for="type" class="col-sm-2 col-form-label">Type:</label>
                                        <div class="col-sm-10">
                                            <select id="type" name="type" class="form-select" required="">
                                                <option value="Hoạt động công ty">Hoạt động công ty</option>
                                                <option value="Hoạt động xã hội">Hoạt động xã hội</option>
                                                <option value="Sản phảm - Dịch vụ">Sản phảm - Dịch vụ</option>
                                            </select>
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
                                        <div  class="col-sm-2">Is Header:</div>
                                        <div class="col-sm-10 d-flex">
                                            <div class="form-check me-2">
                                                <input class="form-check-input" type="radio" id="true"  name="isHeader" value="true">
                                                <label class="form-check-label" for="true">true</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" id="false"  name="isHeader" value="false" checked>
                                                <label class="form-check-label" for="false">false</label>
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
            <!--end promotion modal-->
        </div>

        <!--summernote-->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
        <script>
                            $('#content').summernote({
                                placeholder: 'Write your content here!',
                                tabsize: 2,
                                height: 200
                            });
        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- MDB -->
        <script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
        <script>
                            $(document).ready(function () {

                                //add promotion function
                                $('#addNewsForm').on('submit', function (e) {
                                    e.preventDefault();
                                    const formData = new FormData();
                                    formData.append("title", $("#title").val());
                                    formData.append("description", $("#description").val());
                                    formData.append("content", $("#content").val());
                                    formData.append("type", $("#type").val());
                                    
                                    const isHeader = $("input[name=isHeader]:checked").val();
                                    console.log(isHeader);
                                    formData.append("isHeader", isHeader);

                                    let imgFile = $("#image")[0].files[0];
                                    formData.append("image", imgFile);

                                    // AJAX request to send the reply to the servlet
                                    $.ajax({
                                        url: 'addNews',
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
    </body>
</html>
