<%-- 
    Document   : manageContractCustomer
    Created on : Jul 9, 2024, 7:45:08 AM
    Author     : thuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý hợp đồng</title>
        <style>
            .table-custom td, .table-custom th{
                padding: 14px 16px !important;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container mt-5" style="min-height: 70vh;"> 
             <button type="button" class="btn btn-secondary btn-sm mt-4" data-mdb-ripple-init onclick="goBack()">Quay lại</button>
            <div class="text-center fs-3 fw-bold text-danger mb-3">Quản lý hợp đồng</div>
            <input type="hidden" id="now" value="${now}"/>
            <table class="table table-bordered table-hover table-custom">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Mã hợp đồng</th>
                        <th>Người yêu cầu</th>
                        <th>Ngày tạo</th>
                        <th>Thời hạn</th>
                        <th>Thanh toán</th>
                        <th>Ghi chú</th>
                        <th>Chi tiết</th>
                        <th>Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listAll}" var="c" varStatus="s">
                        <tr>
                            <td>${s.index+1}</td>
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
                                <div class="badge ${c.status == 'Pending'?'badge-warning':''}${c.status == 'Rejected'?'badge-danger':''}${c.status == 'Approved'?'badge-success':''}">${c.status == 'Pending'?'Chờ duyệt':''}${c.status == 'Rejected'?'Từ chối':''}${c.status == 'Approved'?'Đã duyệt':''}</div>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
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
        <jsp:include page="footer.jsp"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!--format date-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

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

                            var now = moment(document.getElementById("now").value, 'YYYY-MM-DD');
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
            
            function goBack() {
            window.location.href ='home.jsp';                 
                        }
        </script>

    </body>

</html>
