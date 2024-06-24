<%-- 
    Document   : compensationHistory
    Created on : Jun 24, 2024, 4:09:24 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.min.css"
            rel="stylesheet"
            />
        <title>Compensation History</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div class="container">
            <h2>Lịch sử yêu cầu đền bù</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Họ tên</th>
                        <th scope="col">Chi phí sửa chữa ước tính</th>
                        <th scope="col">Ngày làm đơn</th>
                        <th scope="col">Ngày duyệt đơn</th>
                        <th scope="col">Bồi thường</th>
                        <th scope="col">Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="compensation" items="${requestScope.listCompensation}">
                        <tr>
                            <c:forEach var="customer" items="${requestScope.listUser}">
                                <c:if test="${customer.id == compensation.customerId}">
                                    <td>${customer.getFullName()}</td>
                                </c:if>
                            </c:forEach>

                            <td>${compensation.getEstimatedRepairCost()}</td>
                            <td>${compensation.dateFiled}</td>
                            <c:if test="${compensation.claimStatus eq 'pending'}">
                                <td class="text-warning">Đang xử lý</td>
                                <td class="text-warning">Đang xử lý</td>
                                <td class="text-warning">Đang xử lý</td>
                            </c:if>

                        </tr>
                    </c:forEach>


                </tbody>
            </table>
        </div>


        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.umd.min.js"
        ></script>
    </body>
</html>
