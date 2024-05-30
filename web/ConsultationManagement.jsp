<%-- 
    Document   : ConsultationManagement
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
        <title>F-Care | Consultation Management</title>

        <!--summernote-->
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

        <!--can thiet-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <!--chart-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">



        <!--ROBOTO fonts-->
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');
        </style>

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
            td{
                align-content: center;
            }



        </style>

        <!--dashboard-->
        <style>

        </style>

    </head>
    <body>
        <div class="main d-flex">
            <!--dashboard-->
            <jsp:include page="staffDashboard.jsp"></jsp:include>

            <!--content-->
            <div class="content">
                <div class="container  mt-3 mb-3 bg-body shadow-lg">

                    <div class="d-flex align-items-center">
                        <div class=" d-flex justify-content-start mb-3 " style="margin-left: 110px; margin-top:50px;">
                            <button onclick="location.href = 'ConsultationManagement?status=notReply'" class="btn btn-danger btn-sm me-2 btn-custom">
                                Chưa trả lời <span class="badge bg-secondary">${countNotReply}</span>
                            </button>
                            <button onclick="location.href = 'ConsultationManagement?status=reply'" class="btn btn-primary btn-sm me-2 btn-custom">
                                Đã trả lời <span class="badge bg-secondary">${countReply}</span>
                            </button>
                            <button onclick="location.href = 'ConsultationManagement?status=all'" class="btn btn-primary btn-sm me-2 btn-custom">
                                All <span class="badge bg-secondary">${countAll}</span>
                            </button>
                        </div>
                        <h1 class="text-center fw-bold" style="color:#419FA3; margin-left: 50px; margin-top: 20px;">Consultation Management</h1>
                    </div>

                    <div class="row d-flex justify-content-center">
                        <div class="col-md-10">
                            <table class="table table-hover table-bordered">
                                <thead class="" style="background-color: #419FA3; color:#fff;">
                                    <tr class="">
                                        <th scope="col">#</th>
                                        <th scope="col">ID</th>
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
                                            <td>${listAll.id}</td>
                                            <td>${listAll.name}</td>
                                            <td>${listAll.email}</td>
                                            <td><fmt:formatDate value="${listAll.createDate}" pattern="dd/MM/yyyy"/></td>
                                            <c:if test="${listAll.status == true}" >
                                                <td><span class="badge bg-primary rounded-pill" style="font-size:10px; margin-left:30px;">Responsed</span></td>
                                            </c:if>
                                            <c:if test="${listAll.status == false}" >
                                                <td>
                                                    <div class="d-flex justify-content-center ">
                                                        <div class=" text-nowrap badge bg-danger rounded-pill me-2 " style="font-size:10px; width: 100px">Not Responsed</div>
                                                        <div class=" d-flex justify-content-center align-items-center"><a href="ReplyConsultation?id=${listAll.id}" class="badge badge-reply rounded-pill bg-primary text-decoration-none" data-id="${listAll.id}" data-bs-toggle="modal" data-bs-target="#replyModal" style="font-size:10px;">Reply</a></div>
                                                    </div>
                                                </td>
                                            </c:if>    

                                            <td class="text-center"><a  href="ReplyConsultation?id=${listAll.id}" class="badge badge-detail rounded-pill bg-primary text-decoration-none" data-bs-toggle="modal" data-bs-target="#detailModal"data-id="${listAll.id}" style="font-size:10px;">Detail</a></td>
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

                    <!--pagination-->
                    <input type="hidden"id="page" value="${currentPage}">
                    <c:if test="${numberOfPages > 1}">
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center">
                                <!-- Nút Previous -->
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="ConsultationManagement?status=${status}&page=${currentPage - 1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <c:forEach begin="1" end="${numberOfPages}" var="page">
                                    <c:choose>
                                        <c:when test="${page == currentPage}">
                                            <li class="page-item active">
                                                <span class="page-link">${page}</span>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="hidden"id="page" value="${currentPage}">
                                            <li class="page-item">
                                                <a class="page-link" href="ConsultationManagement?status=${status}&page=${page}">${page}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <!-- Nút Next -->
                                <li class="page-item ${currentPage == numberOfPages ? 'disabled' : ''}">
                                    <a class="page-link" href="ConsultationManagement?status=${status}&page=${currentPage + 1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </c:if>  
                </div>

                <!--chart-->
                <div class="container mt-3 mb-3 bg-body shadow-lg" id="chart">
                    <div class="row">
                        <div class="col-12">
                            <canvas id="consultationChart"></canvas>
                        </div>
                    </div>
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

        <!--modal-->
        <div class="modal fade" id="replyModal" tabindex="-1" aria-labelledby="replyModalLabel" aria-hidden="true" >
            <div class="modal-dialog modal-lg  modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title fw-bold fs-4" id="replyModalLabel" style="color:#419FA3;">Respond consultation</h5>
                        <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="ReplyConsultation" id="replyForm" method="post">
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
                            <div>
                                <button type="submit" class="btn btn-primary">Gửi</button>
                                <button type="button" class="btn btn-danger" onclick="confirmDeletion()">Xóa</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>


        <!--modal detail-->
        <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="modal-title fs-4 fw-bold text-nowrap" id="detailModalLabel" style="color:#419FA3;">Consultation Details</div>
                        <div class="text-nowrap fw-bold fs-6  " id="status" style="margin-left: 100px">Status</div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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

                        <button id="replyButton"  class="badge badge-reply rounded-pill bg-primary text-decoration-none border-0" data-bs-toggle="modal" data-bs-target="#replyModal">reply</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <!--chart-->
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>
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
                        url: 'ReplyConsultation',
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

                        }
                        //                                            ,
                        //                                            error: function (err) {
                        //                                                console.log(err);
                        //                                                alert('Failed to retrieve data. Please try again.');
                        //                                            }
                    });
                });

                $('.badge-detail').on('click', function (e) {
                    e.preventDefault();
                    let consultationId = $(this).data('id');
                    // AJAX request to get data from the servlet
                    $.ajax({
                        url: 'ReplyConsultation',
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
                        url: 'ReplyConsultation',
                        type: 'POST',
                        data: formData,
                        success: function (response) {
                            alert('Reply sent successfully.');
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
