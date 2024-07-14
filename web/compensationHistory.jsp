<%-- 
    Document   : compensationHistory
    Created on : Jun 24, 2024, 4:09:24 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"rel="stylesheet"/>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"rel="stylesheet"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.min.css"rel="stylesheet"/>
        <title>Compensation History</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />


        <c:if test="${sessionScope.requestSuccess != null}">
            <div id="toast-success" class="toast-container top-0 end-0 p-3">
                <div class="toast align-items-center text-bg-success border-0 fade show" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="d-flex">
                        <div class="toast-body">
                            ${sessionScope.requestSuccess}
                        </div>
                        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                </div>
            </div>
            <c:remove var="requestSuccess" scope="session" />
        </c:if>


        <div class="container" style="min-height: 500px;">
            <h2 style="margin-top: 20px">Lịch sử yêu cầu đền bù</h2>
            <a href="compensation">
                <button type="button" class="btn btn-primary float-end" data-mdb-ripple-init>
                    Yêu cầu bồi thường
                </button>
            </a>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Họ tên</th>
                        <th scope="col">Chi phí sửa chữa ước tính</th>
                        <th scope="col">Ngày làm đơn</th>
                        <th scope="col">Ngày duyệt đơn</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Mô tả</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="compensation" items="${requestScope.listCompensation}">
                        <tr>
                            <td>${sessionScope.user.getFullName()}</td>

                            <td class="amount">${compensation.getEstimatedRepairCost()}</td>

                            <td>  <fmt:formatDate value="${compensation.dateFiled}" pattern="dd/MM/yyyy" /></td>


                            <c:if test="${compensation.claimStatus eq 'pending'}">
                                <td class="text-warning">Đang xử lý</td>
                                <td class="text-warning">Đang xử lý</td>          
                            </c:if>
                            <c:if test="${compensation.claimStatus eq 'approved'}">

                                <td>  <fmt:formatDate value="${compensation.dateApproved}" pattern="dd/MM/yyyy" /></td>
                                <!--<td>/ư-->
                                    <%--<fmt:formatNumber value="${compensation.paymentAmount}" type="currency" currencySymbol="₫" groupingUsed="true"/>--%>
                                <!--</td>-->
                                <td class="text-success">Đã duyệt</td>
                            </c:if>
                            <c:if test="${compensation.claimStatus eq 'rejected'}">
                                <td> 
                                    <fmt:formatDate value="${compensation.dateApproved}" pattern="dd/MM/yyyy" />
                                </td>
                                <td class="text-danger">Bị từ chối</td>
                            </c:if>
                            <c:choose >
                                <c:when test="${compensation.notes eq null}">
                                    <td></td>
                                </c:when>
                                <c:otherwise>
                                    <td>${compensation.notes}</td>
                                </c:otherwise>
                            </c:choose>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <jsp:include page="footer.jsp"/>

        <script>
            window.addEventListener('load', () => {
                setTimeout(() => {
                    const successToast = document.getElementById('toast-success');
                    const failToast = document.getElementById('toast-fail');
                    if (successToast) {
                        successToast.style.opacity = '0';
                        setTimeout(() => successToast.style.display = 'none', 1000);
                    }
                    if (failToast) {
                        failToast.style.opacity = '0';
                        setTimeout(() => failToast.style.display = 'none', 1000);
                    }
                }, 3000);

                const amounts = document.querySelectorAll('.amount');
                amounts.forEach(amount => {
                    const value = parseFloat(amount.textContent);
                    amount.textContent = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(value);
                });
            });
        </script>
    </body>
</html>
