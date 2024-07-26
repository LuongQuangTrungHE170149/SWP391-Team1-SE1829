<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Danh sách khách hàng</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.min.css" rel="stylesheet"/>
        <style>
            .active-customer {
                color: green;
            }
            .inactive-customer {
                color: red;
            }
        </style>
    </head>
    <body>
        <jsp:include page="staffDashboard.jsp"/>
            <div class="main-content" id="main-content">
                <div class="nav navbar bg-light sticky-top justify-content-between align-items-start mb-3 px-2"> 
                    <div class="fs-3 fw-bold text-info">Danh sách khách hàng</div>
                </div>

                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Tên</th>
                            <th>Năm sinh</th>
                            <th>Giới tính</th>
                            <th>Email</th>
                            <th>Số điện thoại</th>
                            <th>Địa chỉ</th>
                            <th>Bảo hiểm</th>
                            <th>Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="customer" items="${requestScope.listCustomer}">
                        <tr>
                            <td>${customer.getFullName()}</td>
                            <td>
                                <fmt:parseDate value="${customer.getDob()}" var="parsedDate" pattern="yyyy-MM-dd"/>
                                <fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy" var="formattedDate"/>
                                ${formattedDate}
                            </td>
                            <td>${customer.gender == 0 ? "Nam" : "Nữ"}</td>
                            <td>${customer.email}</td>
                            <td>${customer.phone}</td>
                            <td>${customer.address}</td>
                            <td>
                                <a href="#"
                                   class="text-info btn-detailContract"
                                   data-mdb-modal-init
                                   data-id="${customer.id}"
                                   data-mdb-target="#detailContractModal">Bảo hiểm</a>
                            </td>
                            <td><span class="${customer.status eq 'active' ? 'active-customer' : 'inactive-customer'}">
                                    ${customer.status eq 'active' ? 'Hoạt động' : 'Ngưng hoạt động'}
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="modal fade" id="detailContractModal" tabindex="-1" aria-labelledby="detailContractModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title text-info" id="detailContractModalLabel">Chi tiết hợp đồng</h4>
                        <button type="button" class="btn-close text-white" data-mdb-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <table class="table table-bordered table-hover table-custom">
                                <thead>
                                    <tr>   
                                        <th>Mã hợp đồng</th>
                                        <th>Khách hàng</th>
                                        <th>Ngày tạo</th>
                                        <th>Thời hạn</th>
                                        <th>Thanh toán</th>
                                        <th>Ghi chú</th>
                                        <th>Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="contract" items="${requestScope.listContract}">
                                        <tr>

                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>


        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
        <script type="text/javascript">
            document.addEventListener("DOMContentLoaded", function () {
                const listContract = JSON.parse('${requestScope.listContractJson}'); // Proper JSON parsing
                const codeElement = document.querySelector('.code');

                document.querySelectorAll('.btn-detailContract').forEach(function (button) {
                    button.addEventListener('click', function () {
                        const customerId = this.getAttribute('data-id');
                        const contracts = listContract.filter(contract => contract.customer.id == customerId);

                        const modalBody = document.querySelector('#detailContractModal .modal-body .table tbody');
                        modalBody.innerHTML = '';
                        contracts.forEach(contract => {
                            const row = document.createElement('tr');

                            const codeCell = document.createElement('td');
                            codeCell.className = 'code';
                            codeCell.textContent = contract.code;
                            row.appendChild(codeCell);

                            const customerCell = document.createElement('td');
                            customerCell.className = 'customer';
                            customerCell.textContent = contract.customer.firstName + " " + contract.customer.lastName;
                            row.appendChild(customerCell);

                            const createDateCell = document.createElement('td');
                            createDateCell.className = 'createDate';
                            createDateCell.textContent = new Date(contract.createDate).toLocaleDateString();
                            row.appendChild(createDateCell);

                            const dateCell = document.createElement('td');
                            dateCell.className = 'date';
                            dateCell.textContent = new Date(contract.startDate).toLocaleDateString() + " - " + new Date(contract.endDate).toLocaleDateString();
                            row.appendChild(dateCell);
                            var payment = new Number(contract.payment).toLocaleString('vi-VN', {
                                style: 'currency',
                                currency: 'VND'
                            });
                            const paymentCell = document.createElement('td');
                            paymentCell.className = 'payment';
                            paymentCell.textContent = payment;
                            row.appendChild(paymentCell);

                            const noteCell = document.createElement('td');
                            noteCell.className = 'note';
                            noteCell.textContent = contract.description || 'N/A';
                            row.appendChild(noteCell);

                            const statusCell = document.createElement('td');
                            statusCell.className = 'status';
                            statusCell.textContent = contract.status === 'Pending' ? 'Chờ duyệt' :
                                    contract.status === 'Rejected' ? 'Từ chối' :
                                    contract.status === 'Approved' ? 'Đã duyệt' :
                                    'Hết hạn';
                            ;
                            row.appendChild(statusCell);


                            modalBody.appendChild(row);
                        });
                    });
                });
            });
        </script>
    </body>
</html>
