<%-- 
    Document   : ConsultationManagement
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
        <title>F-Care | Consultation Management</title>
        <!--        <link rel="stylesheet" href="CSS/ConsultationManagement.css"/>-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        


        <style>
            body{
                font-family: Arial, sans-serif;
            }
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
            .modal-body input[type="text"]:disabled,
            .modal-body input[type="email"]:disabled,
           
            .modal-body select:disabled {
                background-color: #e9ecef;
            }

            /* CSS for modal labels */
            .modal-body label {
                font-weight: bold;
            }
        </style>
    </head>
    <jsp:include page="header.jsp"></jsp:include>
        <body>
            <div class="container" style="margin-top: 75px;">
                <div style="margin-top:75px;">
                    <h1 class="text-center" style="color:#419FA3;margin-top: 150px; font-weight: bold;">Consultation Management</h1>
                </div>
                <div class=" d-flex justify-content-start mb-3 " style="margin-left: 110px; margin-top:70px;">
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
            <div class="row d-flex justify-content-center">
                <div class="col-md-10">
                    <table class="table table-hover table-bordered">
                        <thead class="thead-dark">
                            <tr class="table-success">
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
                            <c:if test="${not empty listAll}">
                                <c:forEach var="listAll" items="${listAll}" varStatus="status">
                                    <tr>
                                        <td>${status.index+1+(currentPage - 1)*20}</td>
                                        <td>${listAll.id}</td>
                                        <td>${listAll.name}</td>
                                        <td>${listAll.email}</td>
                                        <td><fmt:formatDate value="${listAll.createDate}" pattern="dd/MM/yyyy"/></td>
                                        <c:if test="${listAll.status == true}" >
                                            <td><span class="text-primary fw-bold">Responsed</span></td>
                                        </c:if>
                                        <c:if test="${listAll.status == false}" >
                                            <td>
                                                <div class="row">
                                                    <div class="col-7 text-nowrap text-danger fw-bold" >Not Responed</div>
                                                    <div class="col-5 d-flex justify-content-center align-items-center"><a href="ReplyConsultation?id=${listAll.id}" class="badge badge-reply rounded-pill bg-primary text-decoration-none" data-id="${listAll.id}" data-bs-toggle="modal" data-bs-target="#replyModal" style="font-size:10px;">Reply</a></div>
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
        </div>

        <!--pagination-->
        <c:if test="${numberOfPages > 1}">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <!-- Nút Previous -->
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="ConsultationManagement?page=${currentPage - 1}" aria-label="Previous">
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
                                    <a class="page-link" href="ConsultationManagement?page=${page}">${page}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <!-- Nút Next -->
                    <li class="page-item ${currentPage == numberOfPages ? 'disabled' : ''}">
                        <a class="page-link" href="ConsultationManagement?page=${currentPage + 1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </c:if>    
    </div>

    <!--    <div class="container mt-5">
            <div class="col-5 d-flex justify-content-center">
                <a href="#" class="text-light text-decoration-none btn btn-primary btn-sm" style="font-size: 10px;" data-bs-toggle="modal" data-bs-target="#replyModal">Reply</a>
            </div>
        </div>-->

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
                                <input type="text" class="form-control" id="id" name="id" value="" readonly>
                            </div>
                            <div class="col-4 mb-3">
                                <label for="title" class="form-label">Title</label>
                                <input type="text" class="form-control" id="title"name="title" value="Tư vấn" readonly>
                            </div>
                            <div class="col-6 mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" value="" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 mb-3">
                                <label for="timestamp" class="form-label">Timestamp</label>
                                <input type="text" class="form-control" id="timestamp" placeholder="" readonly/>
                            </div>
                            <div class="col-6 mb-3">
                                <label for="senderEmail" class="form-label">Email</label>
                                <input type="email" class="form-control" id="senderEmail"name="senderEmail" placeholder="" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 mb-3">
                                <label for="replyMessage" class="form-label  text-primary">Reply message</label>
                                <textarea class="form-control" id="replyMessage" rows="3" placeholder="Write your answer here!"></textarea>
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
                        <textarea class="form-control bg-light" id="replyMessage_detail" readonly></textarea>
                    </div>

                </div>
                <div class="modal-footer">

                    <button id="replyButton"  class="badge badge-reply rounded-pill bg-primary text-decoration-none border-0" data-bs-toggle="modal" data-bs-target="#replyModal">reply</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
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

//                                    var day = String(createDate.getDate()).padStart(2,'0');
//                                    var month = String(createDate.getMonth()+1).padStart(2,'0');
//                                    var year = createDate.getFullYear();
//                                    var formattedDate = day + '/' + month + '/' + year;


                                                // Show the modal
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
                                                $('#replyMessage_detail').val(data.replyMessage || "Not Answer Yet");

                                                var statusClass = data.status ? "text-primary" : "text-danger";
                                                $('#status').html(data.status ? "Responsed" : "Not Responsed").addClass(statusClass);

                                                $('#replyButton').data('id', data.id);
                                                if (!data.status) {
                                                    $('#replyButton').show();
                                                } else {
                                                    $('#replyButton').hide();
                                                }

                                                //handle date

//                                    var day = String(createDate.getDate()).padStart(2,'0');
//                                    var month = String(createDate.getMonth()+1).padStart(2,'0');
//                                    var year = createDate.getFullYear();
//                                    var formattedDate = day + '/' + month + '/' + year;


                                                // Show the modal
                                                $('#detailModal').modal('show');

                                            }
//                                            ,
//                                            error: function (err) {
//                                                console.log(err);
//                                                alert('Failed to retrieve data. Please try again.');
//                                            }
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

                                function confirmDeletion() {
                                    var id = document.getElementById('id').value;
                                    var page = document.getElementById('page').value;
                                    if (confirm('Bạn có chắc chắn muốn xóa tin nhắn này không?')) {
                                        window.location.href = 'deleteConsultation?id=' + id + '&page=' + page;
                                    }
                                }
    </script>
</body>
<jsp:include page="footer.jsp"></jsp:include>

</html>
