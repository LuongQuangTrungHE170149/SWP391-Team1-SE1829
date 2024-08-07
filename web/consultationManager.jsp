<%-- 
    Document   : ConsultationManager
    Created on : May 23, 2024, 4:59:16 PM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Quản lý tư vấn</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.30.1/moment.min.js"></script>
        <!--summernote-->
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

        <style>
            /* CSS for modal fields */
            .modal-body input[type="text"],
            .modal-body input[type="email"],

            .modal-body select {
                width: 100%;
                padding: 0.375rem 0.75rem;
                font-size: 1rem;
                line-height: 1.5;
                color: #495057;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #ced4da;
                border-radius: 0.25rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            /* CSS for disabled fields */


            /* CSS for modal labels */
            .modal-body label {
                font-weight: bold;
            }
            table td{
                padding:8px 12px !important;
                align-content: center;
            }
            th{
                align-content: center;
                padding: 14px 16px;
            }
            .btn-table{
                padding: 3px 10px;
                font-size: 10px!important;
            }
            .navbar-custom {
                background: rgb(0,167,209);
                background: linear-gradient(204deg, rgba(0,167,209,1) 0%, rgba(65,159,163,1) 100%);
            }
            #loading-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5); /* Màu nền đen với độ mờ 50% */
                z-index: 9999; /* Số thứ tự để hiển thị lớp phủ trên cùng */
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .nav-link{
                padding: 10px !important;
            }

        </style>

    </head>

    <body>

        <!--main-->

        <!--dashboard-->
        <jsp:include page="staffDashboard.jsp"/>
        <!--dashboard-->

        <!--content-->
        <div class="main-content" id="main-content">
            <!--search-->
            <div class="nav navbar bg-light sticky-top justify-content-between mb-3 px-2">
                <input type="hidden" name="status" value="${status}"/>
                <input type="hidden" name="staff" value="${staff}"/>
                <div class="fs-3 fw-bold text-info">Quản lý tư vấn</div>
                <form action="consultationManager" method="GET" id="select-Form" class="d-flex" >
                    <!--search-->
                    <div>
                        <input type="hidden" id="searchValue" value="${searchValue}"/>
                        <div class="form-outline d-flex" data-mdb-input-init style="width: 300px;">
                            <input type="search" id="formSearch" 
                                   name="searchValue" 
                                   class="form-control rounded" 
                                   aria-label="Search" aria-describedby="search-addon"
                                   Value="${searchValue!=null?searchValue:''}" 
                                   placeholder="Tìm kiếm bằng tên hoặc email"/>
                            <button type="submit" class="input-group-text border-0" id="search-addon">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                        <c:if test="${not empty searchValue && searchValue != null}">
                            <div class="text-danger fw-bold mt-3">Tìm được <span class="fs-5">${totalSearchResult}</span> bản ghi với "<span class="fs-5">${searchValue}</span>"</div>
                        </c:if>
                    </div>
                    <div class="ms-3">
                        <select class="form-select" name="staff" id="form-select" onchange="document.getElementById('select-Form').submit();">
                            <option value=""selected="" disabled="">Nhân viên</option>
                            <option value="" ${staff eq ""?'selected':''}>Tất cả</option>
                            <c:forEach items="${listStaffAnswer}" var="s">
                                <option value="${s[0]}" ${s[0] == staff?'selected':''}>${s[1]}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="ms-3 me-3">
                        <select class="form-select" name="status" id="form-select" onchange="document.getElementById('select-Form').submit();">
                            <option disabled="" selected="">Trạng thái</option>
                            <option value="" ${status eq ""?'selected':''}>Tất cả</option>
                            <option value="true" ${status eq "true"?'selected':''} class="text-primary fw-bold">Đã trả lời</option>
                            <option value="false" ${status eq "false"?'selected':''} class="text-danger fw-bold">Chưa trả lời</option>
                        </select>
                    </div>


                    <div>
                        <h3><span class="badge badge-danger">${totalSearchResult}</span></h3>
                    </div>

                </form>
                <div></div>
            </div>
            <!--table-->
            <div class="">
                <a href="#" class="openbtn" id="openbtn" onclick="toggleSidebar()"><i class="fa-solid fa-bars"></i></a>
                <div class="">
                    <!--pagination-->
                    <input type="hidden"id="page" value="${currentPage}">
                    <c:if test="${numberOfPages > 1}">
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center m-0">
                                <!-- Nút Previous -->
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="consultationManager?<c:if test="${not empty staff}">staff=${staff}&</c:if><c:if test="${not empty status}">status=${status}&</c:if><c:if test="${not empty searchValue}">searchValue=${searchValue}&</c:if>page=${currentPage - 1}" aria-label="Previous"><i class="fa-solid fa-chevron-left"></i></a>
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
                                                <a class="page-link" href="consultationManager?<c:if test="${not empty staff}">staff=${staff}&</c:if><c:if test="${not empty status}">status=${status}&</c:if><c:if test="${not empty searchValue}">searchValue=${searchValue}&</c:if>page=${page}">${page}</a>
                                                </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <!-- Nút Next -->
                                <li class="page-item ${currentPage == numberOfPages ? 'disabled' : ''}">
                                    <a class="page-link" href="consultationManager?<c:if test="${not empty staff}">staff=${staff}&</c:if><c:if test="${not empty status}">status=${status}&</c:if><c:if test="${not empty searchValue}">searchValue=${searchValue}&</c:if>page=${currentPage + 1}" aria-label="Next"><i class="fa-solid fa-chevron-right"></i></a>
                                    </li>
                                </ul>
                            </nav>
                    </c:if>
                    <!--pagination-->
                    <table class="table table-hover">
                        <thead class="">
                            <tr class="">

                                <th scope="col">Họ và Tên</th>
                                <th scope="col" >Email</th>
                                <th scope="col" >Ngày tạo</th>
                                <th scope="col" class="text-center">Chi tiết</th>
                                <th scope="col" class="text-center">Trạng thái</th>

                            </tr>
                        </thead>
                        <tbody >
                        <input type="hidden" id="pre-status" value="${status}">
                        <c:if test="${not empty listAll}">
                            <c:forEach var="listAll" items="${listAll}" varStatus="status">
                                <tr>
                                    <td class="ps-4">${listAll.name}</td>
                                    <td class="ps-4">${listAll.email}</td>
                                    <td class="ps-4"><fmt:formatDate value="${listAll.createDate}" pattern="dd/MM/yyyy"/></td>
                                    <td class="text-center">
                                        <a href="#" class="badge-detail fs-6 text-info" 
                                           data-mdb-modal-init 
                                           data-mdb-target="#detailModal"
                                           data-id="${listAll.id}">
                                            <i class="fa-regular fa-eye"></i>
                                        </a>
                                    </td>
                                    <c:if test="${listAll.status == true}" >
                                        <td class="text-center"><span class="fs-6 text-info"><i class="fa-solid fa-check"></i></span></td>
                                            </c:if>
                                            <c:if test="${listAll.status == false}" >
                                        <td class="text-center">
                                            <a href="#" class="badge-reply fs-6 text-danger" 
                                               data-id="${listAll.id}" 
                                               data-mdb-modal-init 
                                               data-mdb-target="#replyModal">
                                                <i class="fa-solid fa-comment-dots"></i>
                                            </a>
                                        </td>
                                    </c:if>    
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
                    <input type="hidden"id="page" value="${currentPage}">
                    <c:if test="${numberOfPages > 1}">
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center">
                                <!-- Nút Previous -->
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="consultationManager?<c:if test="${not empty staff}">staff=${staff}&</c:if><c:if test="${not empty status}">status=${status}&</c:if><c:if test="${not empty searchValue}">searchValue=${searchValue}&</c:if>page=${currentPage - 1}" aria-label="Previous"><i class="fa-solid fa-chevron-left"></i></a>
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
                                                <a class="page-link" href="consultationManager?<c:if test="${not empty staff}">staff=${staff}&</c:if><c:if test="${not empty status}">status=${status}&</c:if><c:if test="${not empty searchValue}">searchValue=${searchValue}&</c:if>page=${page}">${page}</a>
                                                </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <!-- Nút Next -->
                                <li class="page-item ${currentPage == numberOfPages ? 'disabled' : ''}">
                                    <a class="page-link" href="consultationManager?<c:if test="${not empty staff}">staff=${staff}&</c:if><c:if test="${not empty status}">status=${status}&</c:if><c:if test="${not empty searchValue}">searchValue=${searchValue}&</c:if>page=${currentPage + 1}" aria-label="Next"><i class="fa-solid fa-chevron-right"></i></a>
                                    </li>
                                </ul>
                            </nav>
                    </c:if>
                    <!--pagination-->
                </div>
            </div>
            <!--table-->
        </div>

        <!-- main -->

        <!--reply modal-->
        <div class="modal fade" id="replyModal" tabindex="-1" aria-labelledby="replyModalLabel" aria-hidden="true" >
            <div class="modal-dialog modal-xl  modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title fw-bold fs-4" id="replyModalLabel" style="color:#419FA3;">Trả lời tư vấn</h5>
                        <button type="button" class="btn-close" data-mdb-dismiss="modal" aria-label="close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="spinner" style="display: none;">
                            <div class="spinner-border text-info" role="status">
                                <span class="visually-hidden">Loading...</span>
                            </div>
                        </div>
                        <form action="replyConsultation" id="replyForm" method="post">
                            <div class="row">
                                <div class="col-6 mb-3">
                                    <label for="title" class="form-label">Tiêu đề</label>
                                    <input type="text" class="form-control" id="title"name="title" value="Tư vấn" readonly>
                                </div>
                                <input type="hidden" id="id"/>
                                <div class="col-6 mb-3">
                                    <label for="name" class="form-label">Họ và Tên</label>
                                    <input type="text" class="form-control" id="name" name="name" readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6 mb-3">
                                    <label for="timestamp" class="form-label">Ngày tạo</label>
                                    <input type="text" class="form-control" id="timestamp" readonly/>
                                </div>
                                <div class="col-6 mb-3">
                                    <label for="senderEmail" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="senderEmail"name="senderEmail" readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 mb-3">
                                    <label for="senderMessage" class="form-label text-danger">Nội dụng cần tư vấn</label>
                                    <textarea class="form-control" id="senderMessage" rows="3" name="senderMessage" placeholder=""readonly></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 mb-3">
                                    <label for="replyMessage" class="form-label  text-primary">Trả lời tư vấn</label>
                                    <textarea class="form-control" id="replyMessage" rows="3" required=""></textarea>
                                </div>
                            </div>

                            <div class="modal-footer d-flex justify-content-between ps-0 pe-0 pb-0">
                                <div class="d-flex">
                                    <button type="submit" class="btn btn-primary me-2">Gửi</button>
                                    <button type="button" class="btn btn-danger" onclick="confirmDeletion()">Xóa</button>
                                    <!--spinner-->
                                    <div id="loading-overlay" style="display: none;">
                                        <div class="spinner-border text-info" role="status" >
                                            <span class="visually-hidden">Loading...</span>
                                        </div>
                                    </div>

                                </div>
                                <button class="btn btn-secondary" data-mdb-dismiss="modal">Đóng</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--reply modal-->

        <!--modal detail-->
        <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="modal-title fs-4 fw-bold text-nowrap" id="detailModalLabel" style="color:#419FA3;">Chi tiết tư vấn</div>
                        <div class="text-nowrap fw-bold fs-6  " id="status" style="margin-left: 100px"></div>
                        <button type="button" class="btn-close" data-mdb-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        <div class="row mb-3">
                            <div class="col-2 fw-bold">Tiêu đề: </div>
                            <div class="col-3">Tư Vấn</div>   
                        </div>

                        <div class="row mb-3">
                            <div class="col-2 fw-bold">Email:</div>
                            <div class="col-3" id="senderEmail_detail" ></div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-2 fw-bold">Họ và Tên:</div>
                            <div class="col-3" id="name_detail"></div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-2 fw-bold">Ngày tạo:</div>
                            <div class="col-3" id="timestamp_detail" class="fw-light" style="font-size: 14px;"></div>
                        </div>
                        <div class="mb-3">
                            <label for="senderMessage_detail" class="form-label text-primary fs-5" >Nội dung cần tư vấn:</label>
                            <textarea class="form-control bg-light" id="senderMessage_detail" readonly></textarea>
                        </div>

                        <div class="mb-3 d-flex align-items-center">
                            <div class="me-2 fw-bold fs-5">Nhân viên trả lời: </div>
                            <div class="" id="staff_name"></div>
                        </div>
                        <div class="mb-3">
                            <label for="replyMessage_detail" class="form-label text-danger fs-5">Nội dung trả lời:</label>
                            <div class="border bg-light align-items-center border-box" id="replyMessage_detail" readonly></div>
                        </div>

                    </div>
                    <div class="modal-footer">

                        <button id="replyButton"  class="btn btn-primary badge-reply" data-mdb-modal-init data-mdb-target="#replyModal">Trả lời</button>
                        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
        <!--modal detail-->



        <!--summernote-->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
        <script>
                                        $('#replyMessage').summernote({
                                            placeholder: 'Write your answer here!',
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

        <!-- jQuery can thiet cho bootstrap!! -->

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!--mdb bootstrap-->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>

        <!--format date-->

        <script>
                                        function showLoading() {
                                            document.getElementById('loading-overlay').style.display = 'flex';
                                        }
                                        window.addEventListener('load', () => {
                                            setTimeout(() => {
                                                hideLoading();
                                            }, 1000);
                                        });
                                        window.onload = function () {
                                            showSpinner();
                                        };
                                        function showSpinner() {
                                            var spinner = document.getElementById('loading-overlay');
                                            spinner.style.display = 'flex';
                                            setTimeout(function () {
                                                hideLoading();
                                            }, 2000);
                                        }
                                        function hideLoading() {
                                            document.getElementById('loading-overlay').style.display = 'none';
                                        }
                                        function confirmDeletion() {
                                            var id = document.getElementById('id').value;
                                            var status = document.getElementById('pre-status').value;
                                            var page = 1;

                                            var pageParam = document.getElementById('page').value;

                                            if (pageParam && !isNaN(pageParam)) {
                                                page = parseInt(pageParam);
                                            }
                                            if (confirm('Bạn có chắc chắn muốn xóa tin nhắn này không?')) {
                                                window.location.href = 'deleteConsultation?id=' + id + '&status=' + status + '&page=' + page;
                                            }

                                        }
                                        $(document).ready(function () {
                                            $('.badge-reply').on('click', function (e) {
                                                e.preventDefault();
                                                let consultationId = $(this).data('id');
                                                // AJAX request to get data from the servlet
                                                $.ajax({
                                                    url: 'replyConsultation',
                                                    type: 'GET',
                                                    data: {id: consultationId},
                                                    success: function (data) {
                                                        // Populate the modal fields with the received data
                                                        $('#id').val(data.id);
                                                        $('#name').val(data.name);
                                                        $('#senderEmail').val(data.email);
                                                        var createDate = moment(data.createDate).format('DD/MM/YYYY');
                                                        $('#timestamp').val(createDate);
                                                        $('#senderMessage').val(data.content);

                                                        //handle date

                                                        // var day = String(createDate.getDate()).padStart(2,'0');
                                                        // var month = String(createDate.getMonth()+1).padStart(2,'0');
                                                        // var year = createDate.getFullYear();
                                                        // var formattedDate = day + '/' + month + '/' + year;

                                                        // Show the modal
                                                        $('#detailModal').modal('hide');
                                                        $('#replyModal').modal('show');
                                                    },
                                                    error: function (err) {
                                                        console.log(err);
                                                        alert('Failed to retrieve data. Please try again.');
                                                    }
                                                });
                                            });

                                            $('.badge-detail').on('click', function (e) {
                                                e.preventDefault();
                                                let consultationId = $(this).data('id');
                                                // AJAX request to get data from the servlet
                                                $.ajax({
                                                    url: 'replyConsultation',
                                                    type: 'GET',
                                                    data: {id: consultationId},
                                                    success: function (data) {
                                                        // Populate the modal fields with the received data
                                                        $('#id_detail').html(data.id);
                                                        $('#name_detail').html(data.name);
                                                        $('#senderEmail_detail').html(data.email);

                                                        var createDate = moment(data.createDate).format('DD/MM/YYYY');
                                                        $('#timestamp_detail').html(createDate);

                                                        $('#senderMessage_detail').val(data.content);

                                                        var staffClass = data.staff ? "text-secondary" : "text-danger";
                                                        $('#staff_name').html(data.staff ? data.staff.username : "Chưa có nhân viên trả lời").addClass(staffClass);
                                                        $('#replyMessage_detail').html(data.replyMessage || "Chưa trả lời");

                                                        var statusClass = data.status ? "text-primary" : "text-danger";
                                                        $('#status').html(data.status ? "Đã trả lời" : "Chưa trả lời").addClass(statusClass);

                                                        $('#replyButton').data('id', data.id);
                                                        if (!data.status) {
                                                            $('#replyButton').show();
                                                        } else {
                                                            $('#replyButton').hide();
                                                        }

                                                        $('#detailModal').modal('show');
                                                    }
                                                });
                                            });

                                            $('#replyForm').on('submit', function (e) {
                                                showLoading();
                                                e.preventDefault();
                                                let formData = {
                                                    id: $("#id").val(),
                                                    title: $("#title").val(),
                                                    senderEmail: $("#senderEmail").val(),
                                                    content: $("#replyMessage").val(),
                                                    name: $("#name").val()
                                                };
                                                console.log(formData);

                                                // AJAX request to send the reply to the servlet
                                                $.ajax({
                                                    url: 'replyConsultation',
                                                    type: 'POST',
                                                    data: formData,
                                                    success: function (response) {
                                                        alert('Reply sent successfully.');
                                                        hideLoading();
                                                        location.reload(); // Reload the page
                                                    },
                                                    error: function (err) {
                                                        console.log(err);
                                                        alert('Failed to send the reply. Please try again.');
                                                        hideLoading();
                                                        location.reload();
                                                    }
                                                });
                                            });
                                        });
        </script>
    </body>

</html>
