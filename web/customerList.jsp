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
        <title>Customer list</title>
        <link rel="stylesheet" href="CSS/agency.css">
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
    </head>
    <body>
        <jsp:include page="staffDashboard.jsp"/>
        <div class="main-content" id="main-content">
            <div class="nav navbar bg-light sticky-top justify-content-between align-items-start px-2"> 
                <div class="fs-3 fw-bold text-info">Danh sách khách hàng</div>
            </div>
            <div>
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

                <div class="mt-3">
                    <h1>${requestScope.haha}</h1>
                    <div class="d-flex justify-content-center mb-5">
                        <div class="me-3">
                            <form action="customerList">
                                <div class="form-outline d-flex" data-mdb-input-init>
                                    <input class="form-control" type="search"  value="${name}" placeholder="Tìm kiếm tên khách hàng..." name="key"/>
                                    <button type="submit" class="search-agency--btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                                </div>
                            </form>
                        </div>
                        <div class="me-3">
                            <select name="filter" class="form-select" onchange="redirectToServlet(this)">
                                <option disabled selected>Trạng thái</option>
                                <option value="all">Tất cả</option>
                                <option value="active" ${requestScope.selectedStatus eq "active" ? "selected" : ""} >Hoạt động</option>
                                <option value="inactive" ${requestScope.selectedStatus eq "inactive" ? "selected" : ""} >Dừng hoạt động</option>
                            </select>

                        </div>       


                        <div style="display: flex;">
                            <a href="customerList?action=sort"  class="btn btn-light me-3 rounded-pill" data-mdb-ripple-init>Sắp xếp</a>
                            <a href="customerAdd" class="btn btn-info rounded-pill" data-mdb-ripple-init>Thêm</a>

                        </div>   
                    </div>
                    <div>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Họ tên</th>
                                    <th>Năm sinh</th>
                                    <th>Giới tính</th>
                                    <th>Email</th>
                                    <th>Số điện thoại</th>
                                    <th>Địa chỉ</th>
                                    <th>Trạng thái</th>           
                                    <th class="text-center">Hành động</th>
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
                                        <td> 
                                            <div class="text-center">
                                                <a href="customerDetail?customerId=${cusomter.id}" class="me-3">
                                                    <i class="fa-regular fa-folder-open"></i>
                                                </a>
                                                <a href="customerEdit?customerId=${cusomter.id}"> 
                                                    <i class="fa-regular fa-pen-to-square"></i>
                                                </a>
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
