<%-- 
    Document   : contractListForManager
    Created on : Jul 18, 2024, 6:19:35 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách hợp đồng</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <style>
            .table-custom td, .table-custom th{
                padding: 14px 16px !important;
                text-align: center;
            }
            .select-filter {
                margin-top: 10px;
                margin-bottom: 30px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="staffDashboard.jsp"/>

        <div class="main-content" id="main-content">
            <div class="nav navbar bg-light sticky-top justify-content-between align-items-start px-2"> 
                <div class="fs-3 fw-bold text-info">Danh sách hợp đồng</div>
            </div>
            <div class="mt-3">
                <div>
                    <div class="m-auto mb-3" style="width: 150px;">
                        <form class="form" action="listContractForManager" method="POST">
                            <select name="filter" class="form-select" onchange="redirectToServlet()">
                                <option disabled selected>Trạng thái</option>
                                <option value="all">Tất cả</option>
                                <option value="Pending" ${requestScope.selectedCity eq "Pending" ? "selected" : ""}>Chờ duyệt</option>
                                <option value="Approved" ${requestScope.selectedCity eq "Approved" ? "selected" : ""}>Đã duyệt</option>
                                <option value="Rejected" ${requestScope.selectedCity eq "Rejected" ? "selected" : ""}>Từ chối</option>
                                <option value="Expired" ${requestScope.selectedCity eq "Expired" ? "selected" : ""}>Hết hạn</option>
                            </select>
                        </form>
                    </div>



                    <table class="table table-hover">
                        <thead>
                            <tr>   
                                <th>Mã hợp đồng</th>
                                <th>Khách hàng</th>
                                <th>Ngày tạo</th>
                                <th>Thời hạn</th>
                                <th>Thanh toán</th>
                                <th>Ghi chú</th>
                                <th>Chi tiết</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${requestScope.listFilterContract == null}">
                                <c:forEach var="c" items="${requestScope.listContract}" >
                                    <tr>
                                        <td>${c.code}</td>
                                        <td>${c.customer.getFullName()}</td>
                                        <td><fmt:formatDate value="${c.createDate}" pattern="dd/MM/yyyy"/></td>
                                        <td>
                                            <fmt:formatDate value="${c.startDate}" pattern="dd/MM/yyyy"/> - 
                                            <fmt:formatDate value="${c.endDate}" pattern="dd/MM/yyyy"/> ${c.endDate < now?'<div class="text-danger fw-bold">Đã hết hạn</div>':''}
                                        </td>
                                        <td><fmt:formatNumber value="${c.payment}" type="currency" currencyCode="VND"/></td>
                                        <td>${c.description}</td>
                                        <td class="text-center"><a href="#" 
                                               class="text-info btn-detailContract"
                                               data-mdb-modal-init
                                               data-id="${c.contractId}"
                                               data-mdb-target="#detailContractModal"
                                               ><i class="fa-regular fa-folder-open"></i></a>
                                        </td>
                                        <td>
                                            <div class="badge ${c.status == 'Pending'?'badge-warning':''}${c.status == 'Rejected'?'badge-danger':''}${c.status == 'Approved'?'badge-success':''}${c.status == 'Expired'?'badge-danger':''}">${c.status == 'Pending'?'Chờ duyệt':''}${c.status == 'Rejected'?'Từ chối':''}${c.status == 'Approved'?'Đã duyệt':''}${c.status == 'Expired'?'Hết hạn':''}</div>                           
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${requestScope.listFilterContract != null}">
                                <c:forEach var="c" items="${requestScope.listFilterContract}" >
                                    <tr>
                                        <td>${c.code}</td>
                                        <td>${c.customer.getFullName()}</td>
                                        <td><fmt:formatDate value="${c.createDate}" pattern="dd/MM/yyyy"/></td>
                                        <td>
                                            <fmt:formatDate value="${c.startDate}" pattern="dd/MM/yyyy"/> - 
                                            <fmt:formatDate value="${c.endDate}" pattern="dd/MM/yyyy"/> ${c.endDate < now?'<div class="text-danger fw-bold">Đã hết hạn</div>':''}
                                        </td>
                                        <td><fmt:formatNumber value="${c.payment}" type="currency" currencyCode="VND"/></td>
                                        <td>${c.description}</td>
                                        <td><a href="#" 
                                               class="text-info btn-detailContract"
                                               data-mdb-modal-init
                                               data-id="${c.contractId}"
                                               data-mdb-target="#detailContractModal"
                                               ><i class="fa-regular fa-folder-open"></i></a>
                                        </td>
                                        <td>
                                            <div class="badge ${c.status == 'Pending'?'badge-warning':''}${c.status == 'Rejected'?'badge-danger':''}${c.status == 'Approved'?'badge-success':''}${c.status == 'Expired'?'badge-danger':''}">${c.status == 'Pending'?'Chờ duyệt':''}${c.status == 'Rejected'?'Từ chối':''}${c.status == 'Approved'?'Đã duyệt':''}${c.status == 'Expired'?'Hết hạn':''}</div>                           
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="modal fade" id="detailContractModal" tabindex="-1" aria-labelledby="detailContractModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-fullscreen ">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title text-info" id="detailContractModalLabel">Chi tiết hợp đồng</h4>
                            <button type="button" class="btn-close text-white" data-mdb-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row mb-3">
                                    <div class="col">
                                        <div><span class="fw-bold text-info">Trạng thái: </span><span id="status"></span></div>
                                        <div><span class="fw-bold text-warning">Ghi chú: </span><span id="description"></span></div>
                                        <div class="row mt-3">
                                            <div class="col-12 col-lg-6">

                                                <div class="fw-bold fs-5 mb-3">Chương trình bảo hiểm </div>
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Mục</th>
                                                            <th>Thông tin</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Bảo hiểm trách nhiệm dân sự bắt buộc</td>
                                                            <td>Có</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Bảo hiểm tai nạn người trên xe</td>
                                                            <td><span id="isAccidentInsurance"></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td><div class="fw-bold">Thời gian bảo hiểm</div></td> 
                                                            <td><span id="time-insurance"></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td><span class="fw-bold">Đã thanh toán</span></td>
                                                            <td><span id="payment"></span></td> 
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div class="fw-bold fs-5 mb-3">Người yêu cầu hợp đồng</div>
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Tên trường</th>
                                                            <th>Thông tin</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Tên người yêu cầu</td>
                                                            <td><span id="fullname"></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Số điện thoại</td>
                                                            <td><span id="phone-number"></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Email</td>
                                                            <td><span id="email"></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Địa chỉ</td>
                                                            <td><span id="address"></span></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-12 col-lg-6">
                                                <div class="fw-bold fs-5 mb-3">Thông tin phương tiện</div>
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Tên trường</th>
                                                            <th>Thông tin</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Tên chủ xe</td>
                                                            <td><span id="owner-fullname"></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Địa chỉ</td>
                                                            <td><span id="owner-address"></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Biển số xe</td>
                                                            <td><span id="license-plate"></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Số khung</td>
                                                            <td><span id="chassis-number"></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Số máy</td>
                                                            <td><span id="engine-number"></span></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>

        <script>
                            $(document).ready(function () {
                                $('.btn-detailContract').on('click', function (e) {
                                    e.preventDefault();
                                    let newsId = $(this).data('id');
                                    $.ajax({
                                        url: 'detailContractCustomer',
                                        type: 'GET',
                                        data: {id: newsId},
                                        success: function (data) {
                                            var status = '';
                                            if (data.status === "Pending") {
                                                status = '<div class="badge badge-warning">Chờ duyệt</div>';
                                            } else if (data.status === "Rejected") {
                                                status = '<div class="badge badge-danger">Từ chối</div>';
                                            } else if (data.status === "Approved") {
                                                status = '<div class="badge badge-success">Đã duyệt</div>';
                                            } else if (data.status === "Expired") {
                                                status = '<div class="badge badge-danger">Hết hạn</div>';
                                            }
                                            $('#status').html(status);
                                            $('#fullname').text(data.customer.firstName + " " + data.customer.lastName);
                                            $('#description').text(data.description);
                                            $('#isAccidentInsurance').text(data.isAccidentInsurance === true ? 'Có' : 'Không');
                                            $('#phone-number').text(data.customer.phone);
                                            $('#email').text(data.customer.email);
                                            $('#address').text(data.customer.address);
                                            $('#owner-address').text(data.vehicle.ownerAddress);

                                            var owner_firstName = data.vehicle.ownerFirstName;
                                            var owner_lastName = data.vehicle.ownerLastName;
                                            $('#owner-fullname').text(owner_firstName + " " + owner_lastName);
                                            $('#license-plate').text(data.vehicle.licensePlates);
                                            $('#chassis-number').text(data.vehicle.chassis);
                                            $('#engine-number').text(data.vehicle.engine);

                                            var startDate = moment(data.startDate).format('DD/MM/YYYY');
                                            var endDate = moment(data.endDate).format('DD/MM/YYYY');

                                            var nowElement = document.getElementById("now");
                                            var now = moment(nowElement ? nowElement.value : null, 'YYYY-MM-DD');

                                            var dueDate = '';
                                            if (moment(data.endDate).isBefore(now)) {
                                                dueDate = '<span class="text-danger fw-bold">Đã quá hạn</span>';
                                            }

                                            $('#time-insurance').html("<div>" + startDate + " - " + endDate + " " + dueDate + "</div>");

                                            var payment = new Number(data.payment).toLocaleString('vi-VN', {
                                                style: 'currency',
                                                currency: 'VND'
                                            });
                                            $('#payment').text(payment);


                                            $('#detailContractModal').modal('show');
                                        },
                                        error: function (err) {
                                            console.log(err);
                                            // Show error toast
                                            alert('Add failed, try again!');
                                        }
                                    });
                                });
                            });

                            function redirectToServlet() {
                                document.querySelector(".form").submit();
                            }
        </script>

    </body>
</html>
