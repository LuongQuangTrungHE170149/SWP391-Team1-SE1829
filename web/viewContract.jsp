<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>View Contract</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <style>

        </style>
    </head>
    <body>
        <jsp:include page="staffDashboard.jsp"/>
        <div class="main-content" id="main-content">
            <!--search-->
            <div class="nav navbar bg-light sticky-top justify-content-between mb-3 px-2">
                <div class="fs-3 fw-bold text-info">Danh sách hợp đồng</div>
            </div>
            <div class="container">
                <div class="card" style="width: 1000px;">
                    <div class="card-header">
                        <div class="fs-3 fw-bold text-info mb-3">Chi tiết hợp đồng</div>
                    </div>
                    <div class="card-body">

                        <div class="info">
                            <div class="info-item">
                                <p><strong>Mã hợp đồng:</strong> ${contract.code}</p>
                            </div>

                            <div class="row">
                                <div class="col-6">
                                    <p class="half-width"><strong>Họ tên chủ xe:</strong> ${contract.vehicle.ownerFirstName} ${contract.vehicle.ownerLastName}</p>
                                    <p class="half-width"><strong>Địa chỉ chủ xe:</strong> ${contract.vehicle.ownerAddress}</p>
                                    <p><b>Loại xe: </b> ${contract.vehicle.motocycleType.name}</p>
                                    <div class="d-flex">
                                        <p><strong>Biển số xe:</strong> ${contract.vehicle.licensePlates}</p>
                                        <div>
                                            <button class="btn btn-sm btn-warning btn-rounded ms-3" type="button" onclick="checkLicensePlate()" data-mdb-ripple-init>Kiểm tra</button>
                                        </div>
                                    </div>

                                    <p class=""><strong>Số khung:</strong> ${contract.vehicle.chassis}</p>
                                    <p class=""><strong>Số máy:</strong> ${contract.vehicle.engine}</p>
                                    <p><b>Bảo hiểm tai nạn người trên xe: </b> ${contract.isAccidentInsurance == true?'Có':'Không'}</p>
                                    <p><b>Thanh toán: </b> <fmt:formatNumber value="${contract.payment}" type="currency" currencyCode="VND"/></p>
                                    <div class="d-flex">
                                        <p class="me-3"><strong>Ngày bắt đầu: </strong><fmt:formatDate value="${contract.startDate}" pattern="dd/MM/yyyy"/> </p>
                                        <p class="half-width"><strong>Ngày kết thúc: </strong> <fmt:formatDate value="${contract.endDate}" pattern="dd/MM/yyyy"/></p>
                                    </div>

                                </div>
                                <div class="col-6">
                                    <p class="half-width"><strong>Họ tên người yêu cầu:</strong> ${contract.customer.firstName} ${contract.customer.lastName}</p>
                                    <p class="half-width"><strong>Địa chỉ người yêu cầu:</strong> ${contract.customer.address}</p>
                                    <p><strong>Số điện thoại:</strong> ${contract.customer.phone}</p>
                                    <p><strong>Email:</strong> ${contract.customer.email}</p>
                                </div>
                            </div>

                            <div class="info-item align-center">
                                <p><strong>Trạng thái:</strong> <span class="badge ${contract.status == 'Pending'?'badge-warning':''}${contract.status == 'Rejected'?'badge-danger':''}${contract.status == 'Approved'?'badge-success':''}${contract.status == 'Expired'?'badge-expired':''}">${contract.status == 'Pending'?'Chờ duyệt':''}${contract.status == 'Rejected'?'Từ chối':''}${contract.status == 'Approved'?'Đã duyệt':''}${contract.status == 'Expired'?'Hết hạn':''}</span></p>
                                    <c:if test="${contract.status != 'Expired'}">
                                    <form class="d-flex mb-3 align-items-center" action="ChangeContractStatusServlet" method="post"  onsubmit="return confirmChange();">
                                        <input type="hidden" name="contractId" value="${contract.contractId}" />
                                        <select class="form-select me-3" name="newStatus" id="statusSelect" style="width: 150px;">
                                            <option value="Pending">Chờ duyệt</option>
                                            <option value="Rejected">Từ chối</option>
                                            <c:if test="${!activeContractExists}">
                                                <option value="Approved">Đã duyệt</option>
                                            </c:if>
                                        </select>
                                        <div>
                                            <button type="submit" class="btn btn-sm btn-rounded btn-warning" data-mdb-ripple-init>Sửa trạng thái</button>
                                        </div>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                        <a href="ListContract" class="btn btn-info btn-sm" data-mdb-ripple-init>Trở lại</a>
                    </div>

                </div>


            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!--mdb bootstrap-->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
        <script>
                                        function confirmChange() {
                                            return confirm("Bạn có chắc chắn muốn thay đổi trạng thái hợp đồng không?");
                                        }

                                        function checkLicensePlate() {
                                            const licensePlate = "${contract.vehicle.licensePlates}";
                                            // Assume fetchActiveContractByLicensePlate is a function that checks for active contracts
                                            fetch(`CheckLicensePlateServlet?licensePlate=${contract.vehicle.licensePlates}`)
                                                    .then(response => response.json())
                                                    .then(data => {
                                                        if (data.activeContractExists) {
                                                            alert("Biển số xe này đã có hợp đồng có hiệu lực.");
                                                            document.getElementById('statusSelect').querySelector('option[value="Approved"]').style.display = 'none';
                                                        } else {
                                                            alert("Biển số xe này không có hợp đồng nào có hiệu lực.");
                                                        }
                                                    })
                                                    .catch(error => console.error('Error:', error));
                                        }
        </script>
    </body>
</html>
