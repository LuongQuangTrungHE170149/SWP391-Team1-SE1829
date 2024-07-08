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
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/cutomerManage.css">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/agency.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" /> 
        <title>Customer list</title>
    </head>
    <body>
        <jsp:include page="staffDashboard.jsp"/>

        <div class="main-content" id="main-content">
            <div id="listCustomer-page">
                <c:if test="${sessionScope.addSuccess != null}">
                    <div id="toast-success" class="toast-container top-0 end-0 p-3">
                        <div class="toast align-items-center text-bg-success border-0 fade show" role="alert" aria-live="assertive" aria-atomic="true">
                            <div class="d-flex">
                                <div class="toast-body">
                                    ${sessionScope.addSuccess}
                                </div>
                                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                            </div>
                        </div>
                    </div>
                    <c:remove var="addSuccess" scope="session" />
                </c:if>


                <div class="container">

                    <h1>${requestScope.haha}</h1>
                    <h3 style="text-align: center"><span>Danh sách khách hàng</span></h3>
                    <div class="container-action">
                        <div>
                            <form action="customerList">
                                <div class="list-agency--search">
                                    <input  value="${name}" placeholder="Tìm kiếm tên khách hàng..." name="key"/>
                                    <button type="submit" class="search-agency--btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                                </div>
                            </form>
                        </div>
                        <div>
                            <select name="filter" class="select-filter" onchange="redirectToServlet(this)">
                                <option disabled selected>Trạng thái</option>
                                <option value="all">Tất cả</option>
                                <option value="active" ${requestScope.selectedStatus eq "active" ? "selected" : ""} >Hoạt động</option>
                                <option value="inactive" ${requestScope.selectedStatus eq "inactive" ? "selected" : ""} >Dừng hoạt động</option>
                            </select>

                        </div>       


                        <div style="display: flex;">
                            <a href="customerList?action=sort" class="btn-wrapper btn-filter">Sắp xếp</a>
                            <a href="customerAdd" class="btn-wrapper btn-add">Thêm</a>

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
                                    <th>Trạng thái</th>           
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody >



                                <c:forEach var="cusomter" items="${requestScope.listCustomer}"  >
                                    <tr class="customerList-container">
                                        <td>${cusomter.getFullName()}</td>
                                        <td>
                                            <fmt:parseDate value="${cusomter.getDob()}" var="parsedDate" pattern="yyyy-MM-dd" />
                                            <fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy" var="formattedDate" />
                                            ${formattedDate}</td>
                                        <td>${cusomter.gender == 0 ? "Nam" : "Nữ"}</td>
                                        <td>${cusomter.email}</td>
                                        <td>${cusomter.phone}</td>
                                        <td>${cusomter.address}</td> 
                                        <td><span class="${cusomter.status eq 'active' ? 'active-customer' : 'inactive-customer' }">
                                                ${cusomter.status eq 'active' ? 'Hoạt động' : 'Ngưng hoạt động' }
                                            </span>
                                        </td> 
                                        <td> <div class="button-customer-group">
                                                <a href="customerDetail?customerId=${cusomter.id}">
                                                    <button class="button-customer view">Chi tiết</button>
                                                </a>
                                                <a href="customerEdit?customerId=${cusomter.id}"> <button class="button-customer edit">Sửa</button></a>
                                                <a href="ListVehicleServlet?customerId=${cusomter.id}"> <button class="button-customer edit">Phương tiện</button></a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>







                            </tbody>
                        </table>


                    </div>

                </div>

                <div class="pagination">
                    <a href="#" class="prev">&laquo; Trước</a>
                    <a href="#" class="page">1</a>
                    <a href="#" class="page">2</a>
                    <a href="#" class="page">3</a>
                    <a href="#" class="next">Sau &raquo;</a>
                </div>

            </div>

        </div>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>

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
                                function redirectToServlet(selectElement) {
                                    var selectedValue = selectElement.value;
                                    window.location.href = "customerList?filter=" + encodeURIComponent(selectedValue);
                                }


                                document.addEventListener('DOMContentLoaded', function () {
                                    const prevBtn = document.querySelector('.prev');
                                    const nextBtn = document.querySelector('.next');
                                    const pages = document.querySelectorAll('.page');

                                    let currentPage = 1;

                                    function showPage(pageNum) {

                                        const customerList = document.querySelectorAll('.customerList-container');
                                        customerList.forEach(item => {
                                            item.style.display = 'none';
                                        });


                                        const startIndex = (pageNum - 1) * 10;
                                        const endIndex = pageNum * 10;


                                        for (let i = startIndex; i < endIndex; i++) {
                                            if (customerList[i]) {
                                                customerList[i].style.display = 'table-row';
                                            }
                                        }


                                        pages.forEach(page => {
                                            page.classList.remove('active');
                                        });
                                        pages[pageNum - 1].classList.add('active');
                                    }


                                    showPage(currentPage);


                                    prevBtn.addEventListener('click', function () {
                                        if (currentPage > 1) {
                                            currentPage--;
                                            showPage(currentPage);
                                        }
                                    });


                                    nextBtn.addEventListener('click', function () {
                                        if (currentPage < pages.length) {
                                            currentPage++;
                                            showPage(currentPage);
                                        }
                                    });


                                    pages.forEach((page, index) => {
                                        page.addEventListener('click', function () {
                                            currentPage = index + 1;
                                            showPage(currentPage);
                                        });
                                    });
                                });


        </script>
    </body>
</html>
