<%-- 
    Document   : customerList
    Created on : May 29, 2024, 9:38:49 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/cutomerManage.css">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/agency.css">
        <link rel="stylesheet" href="CSS/header.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Customer list</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div id="listCustomer-page">

            <c:if test="${sessionScope.updateSuccess != null}">
                <div id="toast-success" class="toast-container top-0 end-0 p-3">
                    <div class="toast align-items-center text-bg-success border-0 fade show" role="alert" aria-live="assertive" aria-atomic="true">
                        <div class="d-flex">
                            <div class="toast-body">
                                ${sessionScope.updateSuccess}
                            </div>
                            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                        </div>
                    </div>
                </div>
                <c:remove var="updateSuccess" scope="session" />
            </c:if>



            <div class="container">

                <h1>${requestScope.haha}</h1>
                <h3 style="text-align: center"><span>Danh sách khách hàng</span></h3>
                <div class="container-action">
                    <div>
                        <form action="" method="post">
                            <div class="list-agency--search">
                                <input  value="${name}" placeholder="Tìm kiếm tên khách hàng..." name="key"/>
                                <button type="submit" class="search-agency--btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                        </form>
                    </div>

                    <div style="display: flex;">
                        <a href="customerList?action=sort" class="btn-wrapper btn-filter">Sắp xếp</a>
                        <a href="" class="btn-wrapper btn-add">Thêm</a>

                    </div>   
                </div>
                <div>
                    <table class="styled-table">
                        <thead>
                            <tr>

                                <th>Họ tên</th>
                                <th>Năm sinh</th>
                                <th>Giới tính</th>
                                <th>Email</th>
                                <th>Số điện thoại</th>
                                <th>Địa chỉ</th>           
                                <th></th>
                            </tr>
                        </thead>
                        <tbody >


                            <c:forEach var="cusomter" items="${requestScope.listCustomer}"  >

                                <tr>
                                    <td>${cusomter.getFullName()}</td>
                                    <td>
                                        <fmt:parseDate value="${cusomter.getDob()}" var="parsedDate" pattern="yyyy-MM-dd" />
                                        <fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy" var="formattedDate" />
                                        ${formattedDate}</td>
                                    <td>${cusomter.gender == 0 ? "Nam" : "Nữ"}</td>
                                    <td>${cusomter.email}</td>
                                    <td>${cusomter.phone}</td>
                                    <td>${cusomter.address}</td> 
                                    <td> <div class="button-customer-group">
                                            <a href="customerDetail?customerId=${cusomter.id}">
                                                <button class="button-customer view">Chi tiết</button>
                                            </a>
                                            <a href="customerEdit?customerId=${cusomter.id}"> <button class="button-customer edit">Sửa</button></a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            <c:if test="${listSearchCustomer != null}">
                                <c:forEach var="cusomter" items="${requestScope.listSearchCustomer}"  >
                                    <tr>
                                        <td>${cusomter.getFullName()}</td>
                                        <td>${cusomter.getDate()}</td>
                                        <td>${cusomter.gender == 0 ? "Nam" : "Nữ"}</td>
                                        <td>${cusomter.email}</td>
                                        <td>${cusomter.phone}</td>
                                        <td>${cusomter.address}</td> 
                                        <td> <div class="button-group">
                                                <a href="customerDetail?customerId=${cusomter.id}">
                                                    <button class="button-customer view">Chi tiết</button>
                                                </a>
                                                <a href="customerEdit?customerId=${cusomter.id}"> <button class="button-customer edit">Sửa</button></a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>


                        </tbody>
                    </table>


                </div>

            </div>



        </div>
        <script>
            window.addEventListener('load', () => {
                setTimeout(() => {
                    const successToast = document.getElementById('toast-success');
                    if (successToast) {
                        successToast.style.opacity = '0';
                        setTimeout(() => successToast.style.display = 'none', 1000);
                    }

                }, 3000);
            });

        </script>
    </body>
</html>
