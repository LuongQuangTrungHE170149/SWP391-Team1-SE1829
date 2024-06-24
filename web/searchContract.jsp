<%-- 
    Document   : searchContract
    Created on : Jun 17, 2024, 3:52:55 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/searchContract.css">

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
        <title>Search Contract Page</title>

    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="container">
            <form action="searchContract" method="post">
                <div style="margin-top: 20px" class="form-outline mb-4" data-mdb-input-init>
                    <input type="search" name="key" class="form-control" value="${requestScope.key}" id="datatable-search-input">
                    <label class="form-label" for="datatable-search-input">Nhập biển số xe của bạn</label>
                </div>
            </form>

            <div>

                <c:choose>
                    <c:when test="${requestScope.listContract.size() > 0}">
                        <table class="table">
                            <thead> 
                                <tr>
                                    <th>Tên chủ xe</th>
                                    <th>Biển số xe</th>
                                    <th>Số khung</th>
                                    <th>Số máy</th>
                                    <th>Loại bảo hiểm</th>
                                    <th>Ngày hiệu lực</th>
                                    <th>Ngày kết thúc</th>
                                </tr>

                            </thead>
                            <tbody>
                                <c:forEach var="contract" items="${requestScope.listContract}">
                                    <tr>
                                        <c:forEach var="customer" items="${requestScope.listUser}">
                                            <c:if test="${contract.customerId == customer.id}">
                                                <td>${customer.getFullName()}</td>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach var="vehicle" items="${listVehicle}">
                                            <c:if test="${contract.vehicleId == vehicle.id}">
                                                <td>${vehicle.getLicensePlates()}</td>
                                                <td>${vehicle.chassis}</td>
                                                <td>${vehicle.engine}</td>
                                            </c:if>
                                        </c:forEach>
                                        <td>${contract.getContractType()}</td>
                                        <td>${contract.startDate}</td>
                                        <td>${contract.endDate}</td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <h1>Không có hợp đồng</h1>
                    </c:otherwise>
                </c:choose>

            </div>



        </div>

        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.umd.min.js"
        ></script>
    </body>
</html>
