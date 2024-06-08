<%-- 
    Document   : ConsultationManager
    Created on : May 23, 2024, 4:59:16 PM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>F-Care | Consultation Manager</title>

        <!--summernote-->
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

        <!--chart-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

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
            .tab-content{
                width: 100%;

            }
        </style>

    </head>

    <body>

        <!--main-->
        <main class="main d-flex">

            <!--dashboard-->
            <jsp:include page="staffDashboard.jsp"/>
            <!--dashboard-->

            <!--content-->
            <div class="content d-flex flex-column align-items-center" style="background-color: #f0f2fa;" >

                <!--navbar-->
                <div class=" navbar-custom d-flex justify-content-end align-items-center shadow-3 sticky-top" style="width: 100%;">
                    <div class="fs-3 fw-bold text-white me-3">Consultation Manager</div>
                </div>
                <!--end navbar-->

                <!-- Tabs navs -->
                <ul class="nav nav-tabs" id="ex-with-icons" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a data-mdb-tab-init class="nav-link active" id="ex-with-icons-tab-1" href="#listConsultation" role="tab"
                           aria-controls="listConsultation" aria-selected="true"><i class="fa-solid fa-clipboard-list me-2"></i>List Consultation</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a data-mdb-tab-init class="nav-link" id="ex-with-icons-tab-2" href="#chart" role="tab"
                           aria-controls="chart" aria-selected="false"><i class="fa-solid fa-chart-column me-2"></i>Total Staff Answer Chart</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a data-mdb-tab-init class="nav-link" id="ex-with-icons-tab-3" href="#ex-with-icons-tabs-3" role="tab"
                           aria-controls="ex-with-icons-tabs-3" aria-selected="false"><i class="fas fa-cogs fa-fw me-2"></i>Settings</a>
                    </li>
                </ul>
                <!-- Tabs navs -->

                <!-- Tabs content -->
                <div class="tab-content p-4 pt-0" id="ex-with-icons-content">

                    <!--tab list Consultation-->
                    <div class="tab-pane fade show active shadow-lg pt-4 pb-4" 
                         id="listConsultation" role="tabpanel" 
                         aria-labelledby="ex-with-icons-tab-1"
                         style="background-color: #fff; border-radius: 12px;">
                        <!--search-->
                        <div class=" d-flex justify-content-center mb-3">
                            <div>
                                <button onclick="location.href = 'consultationManager?status=notReply'" type="button" class="btn btn-danger btn-sm mb-2" data-mdb-ripple-init>
                                    Chưa trả lời <span class="badge badge-danger">${countNotReply}</span>
                                </button>
                                <button onclick="location.href = 'consultationManager?status=reply'" type="button" class="btn btn-primary btn-sm mb-2" data-mdb-ripple-init>
                                    Đã trả lời <span class="badge badge-danger">${countReply}</span>
                                </button>
                                <button onclick="location.href = 'consultationManager'" type="button" class="btn btn-primary btn-sm me-2 mb-2" data-mdb-ripple-init>
                                    All <span class="badge badge-danger">${countAll}</span>
                                </button>
                            </div>


                            <!--search-->
                            <div>
                                <input type="hidden" id="searchValue" value="${searchValue}"/>
                                <form action="consultationManager" method="GET" class="input-group" style="width: 400px;">
                                    <input type="search" id="formSearch" 
                                           name="searchValue" 
                                           class="form-control rounded" 
                                           aria-label="Search" aria-describedby="search-addon"
                                           Value="${searchValue!=null?searchValue:''}" 
                                           placeholder="Name or Email to search"/>
                                    <button type="submit" class="input-group-text border-0" id="search-addon">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </form>
                                <c:if test="${not empty searchValue && searchValue != null}">
                                    <div class="text-danger fw-bold mt-3">Tìm được <span class="fs-5">${totalSearchResult}</span> bản ghi với "<span class="fs-5">${searchValue}</span>"</div>
                                </c:if>
                            </div>
                            <!--end search-->
                        </div>

                        <!--table-->
                        <div class="row d-flex justify-content-center">
                            <div class="col-11">
                                <!--pagination-->
                                <input type="hidden"id="page" value="${currentPage}">
                                <c:if test="${numberOfPages > 1}">
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination justify-content-center">
                                            <!-- Nút Previous -->
                                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                                <a class="page-link" href="consultationManager?<c:if test="${not empty status}">status=${status}&</c:if><c:if test="${not empty searchValue}">searchValue=${searchValue}&</c:if>page=${currentPage - 1}" aria-label="Previous"><i class="fa-solid fa-chevron-left"></i></a>
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
                                                            <a class="page-link" href="consultationManager?<c:if test="${not empty status}">status=${status}&</c:if><c:if test="${not empty searchValue}">searchValue=${searchValue}&</c:if>page=${page}">${page}</a>
                                                            </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>

                                            <!-- Nút Next -->
                                            <li class="page-item ${currentPage == numberOfPages ? 'disabled' : ''}">
                                                <a class="page-link" href="consultationManager?<c:if test="${not empty status}">status=${status}&</c:if><c:if test="${not empty searchValue}">searchValue=${searchValue}&</c:if>page=${currentPage + 1}" aria-label="Next"><i class="fa-solid fa-chevron-right"></i></a>
                                                </li>
                                            </ul>
                                        </nav>
                                </c:if>
                                <!--pagination-->
                                <table class="table table-hover table-bordered ">
                                    <thead class="">
                                        <tr class="">
                                            <th scope="col" style="width: 20px;">#</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Create Date</th>
                                            <th scope="col" class="text-center">Status</th>
                                            <th scope="col">Detail</th>
                                        </tr>
                                    </thead>

                                    <tbody >

                                    <input type="hidden" id="pre-status" value="${status}">
                                    <c:if test="${not empty listAll}">
                                        <c:forEach var="listAll" items="${listAll}" varStatus="status">
                                            <tr>
                                                <td>${status.index+1+(currentPage - 1)*20}</td>
                                                <td>${listAll.name}</td>
                                                <td>${listAll.email}</td>
                                                <td><fmt:formatDate value="${listAll.createDate}" pattern="dd/MM/yyyy"/></td>
                                                <c:if test="${listAll.status == true}" >
                                                    <td class=""><span class="btn btn-primary btn-rounded btn-sm btn-table ms-3" style="cursor: auto;" >Responsed</span></td>
                                                </c:if>
                                                <c:if test="${listAll.status == false}" >
                                                    <td>
                                                        <div class="d-flex align-items-center ms-3">
                                                            <div ><span class="btn btn-danger btn-sm btn-rounded btn-table me-2  text-nowrap" style="cursor: auto;" >Not Responsed</span></div>
                                                            <div><button class="btn btn-primary btn-rounded btn-sm btn-table badge-reply" data-id="${listAll.id}" data-mdb-modal-init data-mdb-target="#replyModal">Reply</button></div>
                                                        </div>
                                                    </td>
                                                </c:if>    

                                                <td class="text-center"><button class="btn btn-primary btn-rounded btn-sm btn-table badge-detail " data-mdb-modal-init data-mdb-target="#detailModal"data-id="${listAll.id}">Detail</button></td>
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
                            </div>
                        </div>
                        <!--table-->

                        <!--pagination-->
                        <input type="hidden"id="page" value="${currentPage}">
                        <c:if test="${numberOfPages > 1}">
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center mb-0">
                                    <!-- Nút Previous -->
                                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                        <a class="page-link" href="consultationManager?status=${status}&page=${currentPage - 1}" aria-label="Previous">Previous</a>
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
                                                    <a class="page-link" href="consultationManager?status=${status}&page=${page}">${page}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                    <!-- Nút Next -->
                                    <li class="page-item ${currentPage == numberOfPages ? 'disabled' : ''}">
                                        <a class="page-link" href="consultationManager?status=${status}&page=${currentPage + 1}" aria-label="Next">Next</a>
                                    </li>
                                </ul>
                            </nav>
                        </c:if>
                        <!--pagination-->
                    </div>
                    <!--end tab list Consultation-->

                    <!--tab chart-->
                    <div class="tab-pane fade pt-4 pb-4 shadow-lg" id="chart" 
                         role="tabpanel" 
                         aria-labelledby="ex-with-icons-tab-2"
                         style="background-color: #fff; border-radius:12px;">
                        <div class="m-2 text-center fs-4 fw-bold" style="color:#419FA3;">Total staff answer chart</div>
                        <div class="row d-flex justify-content-center">
                            <div class=" col-11">
                                <canvas class="" id="consultationChart"></canvas>
                            </div>
                        </div>
                        <%
          HashMap<String, Integer> userConsultationMap = (HashMap<String, Integer>) request.getAttribute("totalStaffAnswer");
          StringBuilder labels = new StringBuilder("[");
          StringBuilder data = new StringBuilder("[");
          for (String username : userConsultationMap.keySet()) {
              labels.append("'").append(username).append("',");
              data.append(userConsultationMap.get(username)).append(",");
          }
           labels.append("]");
           data.append("]");
                        %>
                    </div>
                    <!--end tab chart-->

                    <!-- other tab -->
                    <div class="tab-pane fade" id="ex-with-icons-tabs-3" role="tabpanel" aria-labelledby="ex-with-icons-tab-3">
                        Tab 3 content
                    </div>
                    <!-- end other tab -->
                </div>
                <!--End Tabs content -->
            </div>
        </div>
        <!-- end content-->
    </main>
    <!-- main -->







    <!--reply modal-->
    <div class="modal fade" id="replyModal" tabindex="-1" aria-labelledby="replyModalLabel" aria-hidden="true" >
        <div class="modal-dialog modal-xl  modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fw-bold fs-4" id="replyModalLabel" style="color:#419FA3;">Respond consultation</h5>
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
                            <div class="col-2 mb-3">
                                <label for="title" class="form-label">ID</label>
                                <input type="text" class="form-control" id="id" name="id" readonly>
                            </div>
                            <div class="col-4 mb-3">
                                <label for="title" class="form-label">Title</label>
                                <input type="text" class="form-control" id="title"name="title" value="Tư vấn" readonly>
                            </div>
                            <div class="col-6 mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 mb-3">
                                <label for="timestamp" class="form-label">Timestamp</label>
                                <input type="text" class="form-control" id="timestamp" readonly/>
                            </div>
                            <div class="col-6 mb-3">
                                <label for="senderEmail" class="form-label">Email</label>
                                <input type="email" class="form-control" id="senderEmail"name="senderEmail" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 mb-3">
                                <label for="replyMessage" class="form-label  text-primary">Reply message</label>
                                <textarea class="form-control" id="replyMessage" rows="3" required=""></textarea>
                            </div>
                            <div class="col-6 mb-3">
                                <label for="senderMessage" class="form-label text-danger">Consulting content</label>
                                <textarea class="form-control" id="senderMessage" rows="3" name="senderMessage" placeholder=""readonly></textarea>
                            </div>


                        </div>

                        <div class="modal-footer d-flex justify-content-between ps-0 pe-0 pb-0">
                            <div class="d-flex">
                                <button type="submit" class="btn btn-primary">Gửi</button>
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
                    <div class="modal-title fs-4 fw-bold text-nowrap" id="detailModalLabel" style="color:#419FA3;">Consultation Details</div>
                    <div class="text-nowrap fw-bold fs-6  " id="status" style="margin-left: 100px">Status</div>
                    <button type="button" class="btn-close" data-mdb-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <div class="row d-flex">
                        <div class="col-6  d-flex align-items-center">
                            <div class="fs-5 fw-bold me-2">Title: </div>
                            <div class="fw-bold">Tư Vấn</div>   
                        </div>
                        <div class="col-6  d-flex align-items-center">
                            <div class="fs-5 fw-bold me-2">ID:</div>
                            <div id="id_detail" class="fw-bold"></div>
                        </div>
                    </div>
                    <hr>

                    <div class="col-6 mb-3 d-flex align-items-center">
                        <div class="fs-5 fw-bold me-2">Email:</div>
                        <div id="senderEmail_detail" class="fw-bold"></div>
                    </div>
                    <div class="col-6 mb-3 d-flex align-items-center">
                        <div class="fs-5 fw-bold me-2">Name:</div>
                        <div id="name_detail" class="fw-bold"></div>
                    </div>

                    <div class="col-12 mb-3 d-flex align-items-center">
                        <div class="fs-5 fw-bold me-2">Timestamp:</div>
                        <div id="timestamp_detail" class="fw-light" style="font-size: 14px;"></div>
                    </div>
                    <div class="mb-3">
                        <label for="senderMessage_detail" class="form-label text-primary fs-5" >Message:</label>
                        <textarea class="form-control bg-light" id="senderMessage_detail" readonly></textarea>
                    </div>

                    <div class="mb-3 d-flex align-items-center">
                        <div class="me-2 fw-bold fs-5">Staff: </div>
                        <div class="" id="staff_name"></div>
                    </div>
                    <div class="mb-3">
                        <label for="replyMessage_detail" class="form-label text-danger fs-5">Reply Message:</label>
                        <div class="border bg-light align-items-center border-box" id="replyMessage_detail" readonly></div>
                    </div>

                </div>
                <div class="modal-footer">

                    <button id="replyButton"  class="btn btn-primary badge-reply" data-mdb-modal-init data-mdb-target="#replyModal">reply</button>
                    <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Close</button>
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
    <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>-->

    <!--chart-->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>

    <!--mdb bootstrap-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>

    <script>
                                    var ctx = document.getElementById('consultationChart').getContext('2d');
                                    var myChart = new Chart(ctx, {
                                        type: 'bar',
                                        data: {
                                            labels: <%= labels %>,
                                            datasets: [{
                                                    label: 'Total Consultations Answer',
                                                    data: <%= data %>,
                                                    backgroundColor: 'rgba(255, 99, 132, 0.5)',
                                                    borderColor: 'rgba(255, 99, 132, 1)',
                                                    borderWidth: 1
                                                }]
                                        },
                                        options: {
                                            scales: {
                                                y: {
                                                    beginAtZero: true
                                                }
                                            }
                                        }
                                    });
    </script>

    <!--script modal form-->
    <script>
        function showLoading() {
            document.getElementById('loading-overlay').style.display = 'flex';
        }

        // Ẩn lớp phủ và spinner

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
                        var createDate = new Date(data.createDate);
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
                        var createDate = new Date(data.createDate);
                        $('#timestamp_detail').html(createDate);
                        $('#senderMessage_detail').val(data.content);

                        var staffClass = data.staff ? "text-secondary" : "text-danger";
                        $('#staff_name').html(data.staff ? data.staff.username : "Not Staff Assigned").addClass(staffClass);
                        $('#replyMessage_detail').html(data.replyMessage || "Not Answer Yet");

                        var statusClass = data.status ? "text-primary" : "text-danger";
                        $('#status').html(data.status ? "Responsed" : "Not Responsed").addClass(statusClass);

                        $('#replyButton').data('id', data.id);
                        if (!data.status) {
                            $('#replyButton').show();
                        } else {
                            $('#replyButton').hide();
                        }
                        //handle date
                        //var day = String(createDate.getDate()).padStart(2,'0');
                        //var month = String(createDate.getMonth()+1).padStart(2,'0');
                        //var year = createDate.getFullYear();
                        //var formattedDate = day + '/' + month + '/' + year;

                        // Show the modal
                        $('#detailModal').modal('show');
                    }
                });
            });

            $('#replyForm').on('submit', function (e) {

                showLoading();
                e.preventDefault();
                let formData = {
                    id: $('#id').val(),
                    title: $('#title').val(),
                    senderEmail: $('#senderEmail').val(),
                    content: $('#replyMessage').val(),
                    name: $('#name').val()
                };

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
                    }
                });
            });
        });
    </script>
</body>

</html>