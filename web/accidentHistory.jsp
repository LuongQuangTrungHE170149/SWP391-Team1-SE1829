<%-- 
    Document   : accidentHistory
    Created on : Jun 28, 2024, 4:21:37 PM
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
        <title>Accident History Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div class="container" style="min-height: 500px;">
            <h2 style="margin-top: 20px">Lịch sử tai nạn</h2>

            <table class="table">
                <thead>
                    <tr>
                        <th>Họ tên</th>
                        <th>Ngày tai nạn</th>
                        <th>Địa điểm tai nạn</th>
                        <th>Biên bản cảnh sát</th>
                        <th>Mô tả</th>
                        <th>Tình trạng xe</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="accident" items="${requestScope.listAccident}">
                        <tr>
                            <td>${sessionScope.user.getFullName()}</td>             
                            <td>  <fmt:formatDate value="${accident.dateOfAccident}" pattern="dd/MM/yyyy" /></td>  
                            <td>
                                ${accident.accidentLocation}
                            </td>
                            <td>
                                ${accident.policeReportNumber}

                            </td>
                            <td>
                                ${accident.descriptionOfAccident}

                            </td>
                            <td>
                                ${accident.vehicleDamage}

                            </td>
                           
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
