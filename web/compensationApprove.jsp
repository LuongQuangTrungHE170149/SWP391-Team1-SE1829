<%-- 
    Document   : compensastionApprove
    Created on : Jun 27, 2024, 12:59:27 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"rel="stylesheet"/>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"rel="stylesheet"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.min.css"rel="stylesheet"/>
        <title>Compensation Approve Page</title>

        <style>
            .accident-detail {
                color: blue;
                cursor: pointer;
            }
            .accident-detail:hover {
                color: #00ccff;
            }
            .hidden {
                display: none;
            }
        </style>
    </head>
    <body>

        <jsp:include page="staffDashboard.jsp"></jsp:include>
            <div class="main-content" id="main-content">

                <div class="container">

                    <ul class="nav nav-pills mb-3" id="ex1" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a
                                data-mdb-pill-init
                                class="nav-link active"
                                id="ex1-tab-1"
                                href="#ex1-pills-1"
                                role="tab"
                                aria-controls="ex1-pills-1"
                                aria-selected="true"
                                >Chưa xử lý</a
                            >
                        </li>
                        <li class="nav-item" role="presentation">
                            <a
                                data-mdb-pill-init
                                class="nav-link"
                                id="ex1-tab-2"
                                href="#ex1-pills-2"
                                role="tab"
                                aria-controls="ex1-pills-2"
                                aria-selected="false"
                                >Đã xử lý</a
                            >
                        </li>

                    </ul>
                    <!-- Pills navs -->

                    <!-- Pills content -->
                    <div class="tab-content" id="ex1-content">
                        <div
                            class="tab-pane fade show active"
                            id="ex1-pills-1"
                            role="tabpanel"
                            aria-labelledby="ex1-tab-1"
                            >
                            <h1>Duyệt đơn</h1>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Mã bảo hiểm</th>
                                        <th>Khách hàng</th>
                                        <th>Tai nạn</th>
                                        <th>Chi phí sửa chữa</th>
                                        <th>Ngày làm đơn</th>
                                        <th>Ghi chú</th>
                                        <th>Xem xét đơn</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="compensation" items="${requestScope.listCompensationPending}">
                                    <c:forEach var="customer" items="${requestScope.userList}">
                                        <c:if test="${compensation.customerId == customer.id}">
                                            <c:set var="customerName" value="${customer.getFullName()}" />
                                        </c:if>
                                    </c:forEach>

                                    <c:forEach var="accident" items="${requestScope.accidentList}">
                                        <c:if test="${compensation.accidentId == accident.id}">
                                            <c:set var="accidentDetail" value="${accident}" />
                                        </c:if>
                                    </c:forEach>
                                <form id="form-note-${compensation.id}" action="compensationApprove" method="post">
                                    <tr>
                                        <th>${compensation.contractId}</th>
                                        <td>${customerName}</td>
                                        <td>
                                            <span class="accident-detail" data-mdb-ripple-init onclick="showAccidentDetails('${accidentDetail.descriptionOfAccident}', '${accidentDetail.dateOfAccident}',
                                                            '${accidentDetail.accidentLocation}', '${accidentDetail.image}',
                                                            '${accidentDetail.policeReportNumber}', '${accidentDetail.vehicleDamage}'
                                                            )">   
                                                Chi tiết
                                            </span>
                                        </td>

                                        <td class="amount">${compensation.getEstimatedRepairCost()}</td>

                                        <td>  <fmt:formatDate value="${compensation.dateFiled}" pattern="dd/MM/yyyy" /></td>

                                        <td>
                                            <div style="display: flex;">
                                                <!-- Thêm class hidden và name để gửi dữ liệu về servlet -->
                                                <span class="compensation-notes ${empty compensation.notes ? '' : 'hidden'}" onclick="toggleInput(this)">
                                                    ${empty compensation.notes ? 'Click để thêm ghi chú' : compensation.notes}
                                                </span>
                                                <input type="text" class="compensation-input ${empty compensation.notes ? 'hidden' : ''}" name="notes" value="${compensation.notes}" />
                                                <button onclick="submitPending(${compensation.id})">Gửi</button>
                                            </div>
                                        </td>


                                        <td>
                                            <div style="display: flex; justify-content: space-evenly">
                                                <button type="button" class="btn btn-success" onclick="submitApproval(${compensation.id})">Đồng ý bồi thường</button>
                                                <button type="button" class="btn btn-danger" onclick="rejectCompensation(${compensation.id})">Từ chối bồi thường</button>

                                            </div>
                                            <input type="hidden" name="compensationId" value="${compensation.id}" />
                                            <input type="hidden" name="status" id="status-${compensation.id}" value="" />
                                        </td>
                                    </tr>
                                </form>

                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane fade" id="ex1-pills-2" role="tabpanel" aria-labelledby="ex1-tab-2">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Mã bảo hiểm</th>
                                    <th>Khách hàng</th>
                                    <th>Tai nạn</th>
                                    <th>Chi phí sửa chữa</th>
                                    <th>Ngày làm đơn</th>
                                    <th>Ngày xử lý đơn</th>
                                    <th>Ghi chú</th>
                                    <th>Trạng thái</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="compensation" items="${requestScope.listCompensationNotPending}">
                                    <c:forEach var="customer" items="${requestScope.userList}">
                                        <c:if test="${compensation.customerId == customer.id}">
                                            <c:set var="customerName" value="${customer.getFullName()}" />
                                        </c:if>
                                    </c:forEach>

                                    <c:forEach var="accident" items="${requestScope.accidentList}">
                                        <c:if test="${compensation.accidentId == accident.id}">
                                            <c:set var="accidentDetail" value="${accident}" />
                                        </c:if>
                                    </c:forEach>
                                <form id="form-note-${compensation.id}" action="compensationApprove" method="post">
                                    <tr>
                                        <th>${compensation.contractId}</th>
                                        <td>${customerName}</td>
                                        <td>
                                            <span class="accident-detail" data-mdb-ripple-init onclick="showAccidentDetails('${accidentDetail.descriptionOfAccident}', '${accidentDetail.dateOfAccident}',
                                                            '${accidentDetail.accidentLocation}', '${accidentDetail.image}',
                                                            '${accidentDetail.policeReportNumber}', '${accidentDetail.vehicleDamage}'
                                                            )">   
                                                Chi tiết
                                            </span>
                                        </td>

                                        <td class="amount">${compensation.getEstimatedRepairCost()}</td>

                                        <td>  <fmt:formatDate value="${compensation.dateFiled}" pattern="dd/MM/yyyy" /></td>
                                        <td>  <fmt:formatDate value="${compensation.dateApproved}" pattern="dd/MM/yyyy" /></td>

                                        <td>
                                            ${compensation.notes}
                                        </td>


                                        <td>
                                            <c:if test="${compensation.claimStatus eq 'approved'}">
                                                <span class="text-success">Đồng ý bồi thường</span>
                                            </c:if>
                                            <c:if test="${compensation.claimStatus eq 'rejected'}">
                                                <span class="text-danger">Từ chối bồi thường</span>
                                            </c:if>

                                        </td>
                                    </tr>
                                </form>

                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
                <!-- Pills content -->


            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Chi tiết tai nạn</h5>
                        <button type="button" class="btn-close" data-mdb-ripple-init data-mdb-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body"> 
                        <p id="accidentDate"></p>
                        <p id="accidentLocation"></p>
                        <p id="policeReportNumber"></p>
                        <p id="accidentDescription"></p>
                        <p id="vehicleDamage"></p>
                        <img id="accidentImage" width="100%" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-mdb-ripple-init data-mdb-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>

        <script>

                                                window.addEventListener('load', () => {
                                                    const amounts = document.querySelectorAll('.amount');
                                                    amounts.forEach(amount => {
                                                        const value = parseFloat(amount.textContent);
                                                        amount.textContent = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(value);
                                                    });
                                                });

                                                function submitPending(id) {
                                                    document.getElementById('status-' + id).value = 'pending';
                                                    document.getElementById('form-note-' + id).submit();
                                                }

                                                function submitApproval(id) {
                                                    document.getElementById('status-' + id).value = 'approved';
                                                    document.getElementById('form-note-' + id).submit();
                                                }

                                                function rejectCompensation(id) {
                                                    document.getElementById('status-' + id).value = 'rejected';
                                                    document.getElementById('form-note-' + id).submit();
                                                }

                                                function showAccidentDetails(description, date, location, image, policeReportNumber, vehicleDamage) {
                                                    document.getElementById('accidentDescription').innerText = "Mô tả: " + description;
                                                    document.getElementById('accidentDate').innerText = "Ngày: " + date;
                                                    document.getElementById('accidentLocation').innerText = "Địa điểm: " + location;
                                                    document.getElementById('policeReportNumber').innerText = "Số biên bản cảnh sát: " + policeReportNumber;
                                                    document.getElementById('vehicleDamage').innerText = "Tình trạng xe: " + vehicleDamage;
                                                    document.getElementById('accidentImage').src = image;


                                                    var exampleModal = new mdb.Modal(document.getElementById('exampleModal'));
                                                    exampleModal.show();
                                                }
                                                function toggleInput(span) {
                                                    const parent = span.parentNode;
                                                    const spanElement = parent.querySelector('.compensation-notes');
                                                    const inputElement = parent.querySelector('.compensation-input');

                                                    // Always toggle the input element visibility
                                                    spanElement.classList.toggle('hidden');
                                                    inputElement.classList.toggle('hidden');
                                                    inputElement.focus();
                                                }

        </script>
    </body>
</html>
