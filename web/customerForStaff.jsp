<%-- 
    Document   : customerForStaff
    Created on : Jul 14, 2024, 3:47:34 PM
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
        <title>Customer list</title>

        <style>
            .active-customer{
                color: green;
            }

            .inactive-customer{
                color: red;
            }

        </style>
    </head>
    <body>
        <jsp:include page="staffDashboard.jsp"></jsp:include>

            <div class="main-content" id="main-content">
                <div class="container">
                    <h1 style="margin-top: 20px">Danh sách khách hàng</h1>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Tên </th>
                                <th>Năm sinh</th>
                                <th>Giới tính</th>
                                <th>Email</th>
                                <th>Số điện thoại</th>
                                <th>Địa chỉ</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="customer" items="${requestScope.listCustomer}">
                            <tr>
                                <td>${customer.getFullName()}</td>
                                <td>
                                    <fmt:parseDate value="${customer.getDob()}" var="parsedDate" pattern="yyyy-MM-dd" />
                                    <fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy" var="formattedDate" />
                                    ${formattedDate}</td>
                                <td>${customer.gender == 0 ? "Nam" : "Nữ"}</td>
                                <td>${customer.email}</td>
                                <td>${customer.phone}</td>
                                <td>${customer.address}</td> 
                                <td><span class="${customer.status eq 'active' ? 'active-customer' : 'inactive-customer' }">
                                        ${customer.status eq 'active' ? 'Hoạt động' : 'Ngưng hoạt động' }
                                    </span>
                                </td> 
                            </tr>
                        </c:forEach>


                    </tbody>
                </table>
            </div>

        </div>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>

    </body>
</html>
