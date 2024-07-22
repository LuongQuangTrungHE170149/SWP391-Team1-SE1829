<%-- 
    Document   : searchContract
    Created on : Jun 17, 2024, 3:52:55 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tra cứu hợp đồng</title>
        <style>
            .content td{
                padding: 10px !important;
                font-size: 12px;
                text-align: center !important;
            }
            .content th{
                padding: 10px !important;
                text-align: center !important;
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <%--<jsp:include page="spinnerLoading.jsp"/>--%>
        <div class="content" style="height: 70vh;">

            <div class="fs-2 fw-bold text-danger text-center mt-4 mb-3">Tra cứu hợp đồng</div> 
            <div style="width: 600px;" class="m-auto">
                <form action="searchContract" method="post">
                    <div class="form-outline d-flex align-items-center" data-mdb-input-init>
                        <input type="search" name="key" class="form-control" value="${key}" id="datatable-search-input">
                        <button type="submit" class="border-0" style="background-color: #fff"><i class="fa-solid fa-magnifying-glass me-3"></i></button>
                        <label class="form-label" for="datatable-search-input">Nhập mã hợp đồng</label>
                    </div>
                </form>
            </div>
            <c:if test="${message != null and not empty key}">
                <div class="text-danger text-center">${message}</div>
            </c:if>            


            <div class="mt-5">
                <c:if test="${not empty c}">
                    <table class="table table-hover table-bordered">
                        <thead> 
                            <tr>
                                <th>Tên chủ xe</th>
                                <th>Biển số xe</th>
                                <th>Số khung</th>
                                <th>Số máy</th>
                                <th>Loại phương tiện</th>
                                <th>Ngày hiệu lực</th>
                                <th>Ngày kết thúc</th>
                                <th>Ghi chú</th>
                                <th>Chi tiết</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${c.vehicle.ownerFirstName} ${c.vehicle.ownerLastName}</td>
                                <td>${c.vehicle.licensePlates}</td>
                                <td>${c.vehicle.chassis}</td>
                                <td>${c.vehicle.engine}</td>
                                <td>${c.vehicle.motocycleType.name}</td>
                                <td><fmt:formatDate value="${c.startDate}" pattern="dd/MM/yyyy"/></td>
                                <td><fmt:formatDate value="${c.endDate}" pattern="dd/MM/yyyy"/></td>
                                <td>${c.description}</td>
                                <td><a href="#" 
                                       class="text-info"
                                       data-mdb-modal-init
                                       data-mdb-target="#detailContractModal"
                                       ><i class="fa-regular fa-folder-open"></i></a></td>
                                <td>
                                    <div class="badge ${c.status == 'Pending'?'badge-warning':''}${c.status == 'Rejected'?'badge-danger':''}${c.status == 'Approved'?'badge-success':''}${c.status == 'Expired'?'badge-danger':''}">${c.status == 'Pending'?'Chờ duyệt':''}${c.status == 'Rejected'?'Từ chối':''}${c.status == 'Approved'?'Đã duyệt':''}${c.status == 'Expired'?'Hết hạn':''}</div>
                                </td>
                            </tr> 
                        </tbody>
                    </table>
                </c:if>
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
                                    <div><span class="fw-bold text-info">Trạng thái: </span><span class="badge ${c.status == 'Pending'?'badge-warning':''}${c.status == 'Rejected'?'badge-danger':''}${c.status == 'Approved'?'badge-success':''}${c.status == 'Expired'?'badge-danger':''}">${c.status == 'Pending'?'Chờ duyệt':''}${c.status == 'Rejected'?'Từ chối':''}${c.status == 'Approved'?'Đã duyệt':''}${c.status == 'Expired'?'Hết hạn':''}</span></div>
                                    <div><span class="fw-bold text-warning">Ghi chú: </span>${c.description}</div>
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
                                                        <td>${c.isAccidentInsurance == true?'Có':'Không'}</td>
                                                    </tr>
                                                    <tr>
                                                        <td><div class="fw-bold">Thời gian bảo hiểm</div></td> 
                                                        <td><fmt:formatDate value="${c.startDate}" pattern="dd/MM/yyyy"/> - <fmt:formatDate value="${c.endDate}" pattern="dd/MM/yyyy"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><span class="fw-bold">Đã thanh toán</span></td>
                                                        <td><fmt:formatNumber value="${c.payment}" type="currency" currencyCode="VND"/></td> 
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
                                                        <td>${c.customer.firstName} ${c.customer.lastName}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Số điện thoại</td>
                                                        <td>${c.customer.phone}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Email</td>
                                                        <td>${c.customer.email}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Địa chỉ</td>
                                                        <td>${c.customer.address}</td>
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
                                                        <td>${c.vehicle.ownerFirstName} ${c.vehicle.ownerLastName}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Địa chỉ</td>
                                                        <td>${c.vehicle.ownerAddress}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Biển số xe</td>
                                                        <td>${c.vehicle.licensePlates}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Số khung</td>
                                                        <td>${c.vehicle.chassis}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Số máy</td>
                                                        <td>${c.vehicle.engine}</td>
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
    </body>
</html>
