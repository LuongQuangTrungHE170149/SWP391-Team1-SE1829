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
    </head>
    <body>

        <div class="container">
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
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="compensation" items="${requestScope.listCompensationPending}">
                        <c:forEach var="customer" items="${requestScope.userList}">
                            <c:if test="${compensation.customerId == customer.id}">
                                <c:set var="customerName" value="${customer.getFullName()}" />
                            </c:if>
                        </c:forEach>
                        <tr>
                            <th>${compensation.contractId}</th>
                            <td>${customerName}</td>
                            <td>${compensation.accidentId}</td>
                            <td>
                                <fmt:formatNumber value="${compensation.estimatedRepairCost}" type="currency" currencySymbol="VND" groupingUsed="true"/>
                            </td>
                            <td>  <fmt:formatDate value="${compensation.dateFiled}" pattern="dd/MM/yyyy" /></td>
                            <td>${compensation.notes}</td>
                            <td>
                                <div style="display: flex; justify-content: space-evenly">
                                    <button type="button" class="btn btn-success" onclick="openApproveModal(${compensation.contractId})">Đồng ý bồi thường</button>
                                    <form id="compensationForm" action="compensationApprove" method="post">
                                        <input type="hidden" name="status" value="rejected" />
                                        <input type="hidden" name="contractId" value="${compensation.contractId}" />

                                        <button type="button" class="btn btn-danger" data-mdb-ripple-init  onclick="rejectCompensation()">Từ chối bồi thường</button>
                                    </form>
                                </div>
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Approve Modal -->
        <div class="modal fade" id="approveModal" tabindex="-1" aria-labelledby="approveModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="approveModalLabel">Nhập số tiền bồi thường</h5>
                        <button type="button" class="btn-close" data-mdb-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="approvalForm" method="post" action="compensationApprove">
                            <input type="hidden" id="contractIdInput" name="contractId" value="" />
                            <input type="hidden" name="status" value="approved" />

                            <div class="mb-3">
                                <label for="compensationAmount" class="form-label">Số tiền bồi thường</label>
                                <input type="number" class="form-control" id="compensationAmount" name="compensationAmount" required />
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Hủy</button>
                        <button type="button" class="btn btn-primary" onclick="submitApproval()">Xác nhận</button>
                    </div>
                </div>
            </div>
        </div>






        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>

        <script>
                            function openApproveModal(contractId) {
                                document.getElementById('contractIdInput').value = contractId;
                                var approveModal = new mdb.Modal(document.getElementById('approveModal'));
                                approveModal.show();
                            }

                            function submitApproval() {
                                document.getElementById('approvalForm').submit();
                            }

                            function rejectCompensation() {
                                document.getElementById('compensationForm').submit();
                            }
        </script>
    </body>
</html>
