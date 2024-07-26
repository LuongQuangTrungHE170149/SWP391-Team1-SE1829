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
        <title>Quản lý tin tức</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <!--summer note--> 
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
        <style>
            table td{
                padding:8px 12px !important;
                align-content: center;
            }

            .btn-table{
                padding: 3px 10px;
                font-size: 10px!important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="staffDashboard.jsp"/>

        <div class="main-content" id="main-content">
            <!--nav-->
            <div class="nav navbar bg-light sticky-top justify-content-between align-items-start mb-3 px-2"> 
                <div class="fs-3 fw-bold text-info">Quản lý tin tức</div>
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
                                       placeholder="Tiêu đề, mô tả..."/>
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
                                <option value="">Tất cả</option>
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
                        <button type="button" class="btn btn-info btn-sm" onclick="location.href = 'newsManager?getHeader=true'" data-mdb-ripple-init>Bài nổi bật</button>
                        <button type="button"
                                class="btn btn-info btn-sm" 
                                data-mdb-ripple-init
                                data-mdb-modal-init
                                data-mdb-target="#addNewsModal">
                            <i class="fa-sharp fa-solid fa-plus"></i>Thêm
                        </button>
                    </div>
                    <p class="m-0 text-danger">${invalidHeader}</p>
                </div>
                <!--end search-->
            </div>
            <!--nav-->

            <!--table-->
            <div class="">
                <div>
                    <!--pagination-->
                    <input type="hidden" id="selectedStaff" value="${selectedStaff}"/>
                    <input type="hidden"id="page" value="${currentPage}">
                    <input type="hidden" id="searchValue" value="${searchValue}"/>
                    <c:if test="${numberOfPages > 1}">
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center m-0">
                                <!-- Nút Previous -->
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="newsManager?searchValue=${searchValue}&selectedStaff=${selectedStaff}&page=${currentPage - 1}" aria-label="Previous"><i class="fa-solid fa-chevron-left"></i></a>
                                </li>
                                <c:forEach begin="1" end="${numberOfPages}" var="page">
                                    <c:choose>
                                        <c:when test="${page == currentPage}">
                                            <li class="page-item active" aria-current="page">
                                                <span class="page-link">${page}</span>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="hidden"id="page" value="${currentPage}">
                                            <li class="page-item">
                                                <a class="page-link" href="newsManager?searchValue=${searchValue}&selectedStaff=${selectedStaff}&page=${page}">${page}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <!-- Nút Next -->
                                <li class="page-item ${currentPage == numberOfPages ? 'disabled' : ''}">
                                    <a class="page-link" href="newsManager?searchValue=${searchValue}&selectedStaff=${selectedStaff}&page=${currentPage + 1}" aria-label="Next"><i class="fa-solid fa-chevron-right"></i></a>
                                </li>
                            </ul>
                        </nav>
                    </c:if>
                    <!--pagination-->
                    <table class="table table-hover " >
                        <thead class="text-nowrap">
                            <tr class="">
                                <th scope="col" class="" >Tiêu đề</th>
                                <th scope="col" class="" >Mô tả</th>
                                <th scope="col" class="" >Loại</th>
                                <th scope="col" class="" >Ngày tạo</th>
                                <th scope="col" class="text-center" >Bài nổi bật</th>
                                <th scope="col" class="text-center" >Hành động</th>
                            </tr>
                        </thead>

                        <tbody >

                            <c:if test="${not empty listAll}">
                                <c:forEach var="listAll" items="${listAll}" varStatus="status">
                                <input type="hidden" id="id" value="${listAll.id}"/>
                                <tr>
                                    <td class="ps-4">${listAll.title}</td>
                                    <td class="ps-4">${listAll.description}</td>
                                    <c:if test="${listAll.type == 'Hoạt động công ty'}">
                                        <td class="ps-4"><div class="badge badge-danger">${listAll.type}</div></td>
                                        </c:if>
                                        <c:if test="${listAll.type == 'Hoạt động xã hội'}">
                                        <td class="ps-4"><div class="badge badge-success">${listAll.type}</div></td>
                                        </c:if>
                                        <c:if test="${listAll.type == 'Sản phẩm - Dịch vụ'}">
                                        <td class="ps-4"><div class="badge badge-primary">${listAll.type}</div></td>
                                        </c:if>
                                    <td class="ps-4"><fmt:formatDate value="${listAll.createDate}" pattern="dd/MM/yyyy"/></td>
                                    <c:if test="${listAll.isHeader == true}" >
                                        <td class="text-center">
                                            <a href = 'newsManager?unset=true&selectedStaff=${selectedStaff}&page=${currentPage}<c:if test="${not empty searchValue && searchValue != null}">&searchValue=${searchValue}</c:if>'
                                               class="fs-3 text-info">
                                                    <i class="fa-solid fa-toggle-on"></i></a>
                                            </td>
                                    </c:if>
                                    <c:if test="${listAll.isHeader == false}" >
                                        <td class="text-center">
                                            <a href ='newsManager?setHeaderAtId=${listAll.id}&selectedStaff=${selectedStaff}&page=${currentPage}<c:if test="${not empty searchValue && searchValue != null}">&searchValue=${searchValue}</c:if>'
                                               class="fs-3 text-info">
                                                    <i class="fa-solid fa-toggle-off"></i>
                                                </a>
                                            </td>
                                    </c:if> 
                                    <td>
                                        <div class="d-flex justify-content-center align-items-center">
                                            <a href="#" class="btn-detailNews fs-6 text-info me-3" 
                                               data-id="${listAll.id}" data-mdb-modal-init data-mdb-target="#detailNewsModal"
                                               data-mdb-ripple-init>
                                                <i class="fa-regular fa-eye"></i>
                                            </a>
<!--                                            <a href="newsDetail?id=${listAll.id}" target="_blank"
                                               data-mdb-ripple-init
                                               class="fs-6 text-info me-3">
                                                <i class="fa-solid fa-arrow-up-right-from-square"></i>
                                            </a>-->
                                            <a href="#" class="fs-6 text-info me-3"  
                                               onclick="location.href = 'updateNews?id=${listAll.id}'">
                                                <i class="fa-regular fa-pen-to-square"></i>
                                            </a>
                                            <a href="#" class="fs-6 text-danger" onclick="confirmDeletion(${listAll.id})">
                                                <i class="fa-regular fa-trash-can"></i>
                                            </a>
                                        </div>

                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty listAll}">
                            <tr>
                                <td colspan="7">No data</td>
                            </tr> 
                        </c:if>
                        </tbody>
                    </table>
                    <!--pagination-->
                    <c:if test="${numberOfPages > 1}">
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center">
                                <!-- Nút Previous -->
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="newsManager?searchValue=${searchValue}&selectedStaff=${selectedStaff}&page=${currentPage - 1}" aria-label="Previous"><i class="fa-solid fa-chevron-left"></i></a>
                                </li>
                                <c:forEach begin="1" end="${numberOfPages}" var="page">
                                    <c:choose>
                                        <c:when test="${page == currentPage}">
                                            <li class="page-item active" aria-current="page">
                                                <span class="page-link">${page}</span>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="hidden"id="page" value="${currentPage}">
                                            <li class="page-item">
                                                <a class="page-link" href="newsManager?searchValue=${searchValue}&selectedStaff=${selectedStaff}&page=${page}">${page}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <!-- Nút Next -->
                                <li class="page-item ${currentPage == numberOfPages ? 'disabled' : ''}">
                                    <a class="page-link" href="newsManager?searchValue=${searchValue}&selectedStaff=${selectedStaff}&page=${currentPage + 1}" aria-label="Next"><i class="fa-solid fa-chevron-right"></i></a>
                                </li>
                            </ul>
                        </nav>
                    </c:if>
                    <!--pagination-->
                </div>
            </div>
            <!--table-->

            <!--add detail promotion modal-->
            <div class="modal fade" id="detailNewsModal" tabindex="-1" aria-labelledby="detailNewsModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-fullscreen ">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title text-info" id="detailNewsModalLabel">Chi tiết tin tức</h5>
                            <button type="button" class="btn-close text-white" data-mdb-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-12 col-md-4">
                                        <div>
                                            <div class="badge badge-primary">ID: <span class="fw-normal" id="id_detail"></span></div>
                                            <div class="badge badge-secondary">Người tạo: <span class="fw-normal" id="staff_detail"></span></div>
                                        </div>
                                        <div>
                                            <div class="fw-bold">Ảnh</div>
                                            <div id="image_detail"></div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-8">
                                        <div class="row">
                                            <div class="col-12 col-lg-2 fw-bold"> Tiêu đề:</div>
                                            <div id="title_detail" class="col-12 col-lg-10"></div>
                                        </div>
                                        <hr>

                                        <div class="row">
                                            <div class="col-12 col-lg-2 fw-bold">Ngày tạo:</div>
                                            <div id="createDate_detail" class="col-12 col-lg-10"></div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-12 col-lg-2 fw-bold">Mô tả:</div>
                                            <div id="description_detail" class="col-12 col-lg-10"></div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-12 col-lg-2 fw-bold">Loại:</div>
                                            <div id="type_detail" class="col-12 col-lg-10"></div>
                                        </div>
                                        <hr>
                                        <div class="fw-bold">Nội dung:</div>
                                        <div class="border border-1 p-3 shadow" style="border-radius: 12px;">
                                            <div id="content_detail"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary btn-update me-2" data-mdb-ripple-init>Chỉnh sửa</button>
                            <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--end add detail promotion modal-->
            <!--add new modal-->
            <div class="modal fade" id="addNewsModal" tabindex="-1" aria-labelledby="addNewsModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title text-info" id="addNewsModalLabel">Thêm mới tin tức</h5>
                            <button type="button" class="btn-close" data-mdb-ripple-init data-mdb-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <form action="addNews"id="addNewsForm" method="post" enctype="multipart/form-data">
                                    <div class="row mb-3">
                                        <label for="title" class="col-sm-2 col-form-label">Tiêu đề:</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="title" name="title" required>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="description" class="col-sm-2 col-form-label">Mô tả:</label>
                                        <div class="col-sm-10">
                                            <textarea class="form-control" id="description" name="description" required></textarea>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="type" class="col-sm-2 col-form-label">Loại:</label>
                                        <div class="col-sm-10">
                                            <select id="type" name="type" class="form-select" required="">
                                                <option value="Hoạt động công ty">Hoạt động công ty</option>
                                                <option value="Hoạt động xã hội">Hoạt động xã hội</option>
                                                <option value="Sản phẩm - Dịch vụ">Sản phẩm - Dịch vụ</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="image" class="col-sm-2 col-form-label">Ảnh:</label>
                                        <div class="col-sm-10">
                                            <input type="file" class="form-control" id="image" name="image">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="content" class="col-sm-2 col-form-label">Nội dung</label>
                                        <textarea class="form-control" id="content" rows="3" required=""></textarea>
                                    </div>
                            </div>
                            <div class="row mb-3 align-items-center">
                                <div  class="col-sm-2">Bài nổi bật:</div>
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
                                <button type="submit" class="btn btn-primary btn-block" data-mdb-ripple-init><i class="fa-solid fa-plus me-2"></i>Thêm</button>
                                <button type="button" class="btn btn-secondary btn-block" data-mdb-ripple-init data-mdb-dismiss="modal">Đóng</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--end new modal-->
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
    <script>
        function confirmDeletion(id) {
            var searchValue = document.getElementById('searchValue').value;
            //                var  = encodeURIComponent(searchValueEncode);
            var selectedStaff = document.getElementById('selectedStaff').value;
            var page = 1;
            var pageParam = document.getElementById('page').value;
            if (pageParam && !isNaN(pageParam)) {
                page = parseInt(pageParam);
            }
            if (confirm('Bạn có chắc chắn muốn xóa news với id = ' + id + '?')) {
                window.location.href = 'deleteNews?searchValue=' + searchValue + '&id=' + id + '&selectedStaff=' + selectedStaff + '&page=' + page;
            }
        }
        $(document).ready(function () {
            //add news function
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

            $('.btn-detailNews').on('click', function (e) {
                e.preventDefault();
                let newsId = $(this).data('id');
                $.ajax({
                    url: 'newsManagerDetail',
                    type: 'GET',
                    data: {id: newsId},
                    success: function (data) {
                        $('#id_detail').html(data.id);
                        $('#staff_detail').html(data.staff.username);
                        $('#title_detail').html(data.title);
                        //handle date
                        var createDate = new Date(data.createDate);
                        var day = String(createDate.getDate()).padStart(2, '0');
                        var month = String(createDate.getMonth() + 1).padStart(2, '0');
                        var year = createDate.getFullYear();
                        var formattedDate = day + '/' + month + '/' + year;
                        $('#createDate_detail').html(formattedDate);
                        $('#type_detail').html(data.type);
                        $('#description_detail').html(data.description);
                        $('#content_detail').html(data.content);
                        $('#image_detail').html('<img class="img-fluid rounded-4 shadow-3" src="' + data.image + '">');
                        $('#detailNewsModal').modal('show');
                    },
                    error: function (err) {
                        console.log(err);
                        // Show error toast
                        alert('Add failed, try again!');
                    }
                });
            });
            $('.btn-update').on('click', function () {
                var id = $('#id_detail').html();
                window.location.href = 'updateNews?id=' + id;
            });


        });
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- MDB -->
    <script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
</body>
</html>
