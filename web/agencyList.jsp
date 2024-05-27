<%-- 
    Document   : agencyList
    Created on : May 20, 2024, 9:30:56 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/agency.css">
        <link rel="stylesheet" href="CSS/header.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Agency list</title>
    </head>
    <body>

        <jsp:include page="./header.jsp" />      

        <div id="listAgency-page">

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


            <c:if test="${sessionScope.updateFail != null}">
                <div id="toast-fail" class="toast-container top-0 end-0 p-3">
                    <div class="toast align-items-center text-bg-danger border-0 fade show" role="alert" aria-live="assertive" aria-atomic="true">
                        <div class="d-flex">
                            <div class="toast-body">
                                ${sessionScope.updateFail}
                            </div>
                            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                        </div>
                    </div>
                </div>
                <c:remove var="updateFail" scope="session" />
            </c:if>



            <div class="container list-agency--wrapper">
                <h3 class="list-agency--header">Quản lí đại lý</h3>
                <div class="container-action">
                    <form action="listAgency" method="post">
                        <div class="list-agency--search">
                            <input  value="${key}" placeholder="Tìm kiếm đại lý..." name="key"/>
                            <button type="submit" class="search-agency--btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </form>

                    <div>
                        <select name="filter" class="select-filter" onchange="redirectToServlet(this)">
                            <option disabled selected>Tỉnh, thành phố</option>
                            <option value="all">Tất cả</option>
                            <option value="hn" ${requestScope.selectedCity eq "Hà Nội" ? "selected" : ""} >Hà Nội</option>
                            <option value="hcm" ${requestScope.selectedCity eq "Hồ Chí Minh" ? "selected" : ""}>Tp.Hồ Chí Minh</option>
                            <option value="dn" ${requestScope.selectedCity eq "Đã Nẵng" ? "selected" : ""}>Đã Nẵng</option>

                        </select>

                    </div>      

                    <div style="display: flex;">
                        <a href="listAgency?action=sort" class="btn-wrapper btn-filter">Sắp xếp</a>

                        <a href="addAgency" class="btn-wrapper btn-add">Thêm đại lý</a>

                    </div>    
                </div>



                <div>

                    <table class="styled-table">
                        <thead>
                            <tr>

                                <th>Mã</th>
                                <th>Tên đại lí</th>
                                <th>Địa chỉ</th>
                                <th>Hotline</th>
                                <th>Giờ làm việc</th>
                                <th>Trạng thái</th>
                                <th>Hàng động</th>

                            </tr>
                        </thead>
                        <tbody >
                            <c:if test="${requestScope.listSortAgency != null || requestScope.listAgency == null || requestScope.listSearchAgency == null}">
                                <c:forEach var="agency" items="${requestScope.listSortAgency}">
                                    <tr class="agency-container">
                                        <td>${agency.agencyId}</td>
                                        <td>${agency.agencyName}</td>
                                        <td>${agency.agencyAddress}</td>
                                        <td>${agency.hotline}</td>
                                        <td>${agency.worktime}</td>
                                        <td>${agency.status eq "active" ? "Hoạt động" : "Dừng hoạt động"}</td>
                                        <td>
                                            <a class="agency-link" href="editAgency?id=${agency.agencyId}">Sửa</a>
                                            <a class="agency-link" href="agencyDetail?id=${agency.agencyId}">Chi tiết</a>
                                            <c:if test="${agency.status eq 'active'}" >
                                                <a  class="agency-link" href="inactiveAgency?id=${agency.agencyId}&action=inactive">Ngưng hoạt động</a>
                                            </c:if>
                                            <c:if test="${agency.status ne 'active'}" >
                                                <a  class="agency-link" href="inactiveAgency?id=${agency.agencyId}&action=active">Hoạt động</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>

                            <c:if test="${requestScope.listSearchAgency == null && requestScope.listSortAgency == null && requestScope.filterAgencyList == null}">
                                <c:forEach var="agency" items="${requestScope.listAgency}">
                                    <tr class="agency-container">

                                        <td>${agency.agencyId}</td>
                                        <td>${agency.agencyName}</td>
                                        <td>${agency.agencyAddress}</td>
                                        <td>${agency.hotline}</td>
                                        <td>${agency.worktime}</td>
                                        <td>${agency.status eq "active" ? "Hoạt động" : "Dừng hoạt động"}</td>
                                        <td>
                                            <a class="agency-link" href="editAgency?id=${agency.agencyId}">Sửa</a>
                                            <a class="agency-link" href="agencyDetail?id=${agency.agencyId}">Chi tiết</a>


                                            <c:if test="${agency.status eq 'active'}">
                                                <a class="agency-link" href="#" onclick="confirmAction('${agency.agencyId}', 'inactive')">Ngưng hoạt động</a>
                                            </c:if>
                                            <c:if test="${agency.status ne 'active'}">
                                                <a class="agency-link" href="#" onclick="confirmAction('${agency.agencyId}', 'active')">Hoạt động</a>
                                            </c:if>
                                        </td>

                                    </tr>
                                </c:forEach>

                            </c:if>

                            <c:if test="${requestScope.listSearchAgency != null && requestScope.listSearchAgency.size() > 0 && requestScope.filterAgencyList == null}">
                                <c:forEach var="agency" items="${requestScope.listSearchAgency}">
                                    <tr class="agency-container">

                                        <td>${agency.agencyId}</td>
                                        <td>${agency.agencyName}</td>
                                        <td>${agency.agencyAddress}</td>
                                        <td>${agency.hotline}</td>
                                        <td>${agency.worktime}</td>
                                        <td>${agency.status eq "active" ? "Hoạt động" : "Dừng hoạt động"}</td>
                                        <td>
                                            <a class="agency-link" href="editAgency?id=${agency.agencyId}">Sửa</a>
                                            <a class="agency-link" href="agencyDetail?id=${agency.agencyId}">Chi tiết</a>
                                            <c:if test="${agency.status eq 'active'}">
                                                <a class="agency-link" href="#" onclick="confirmAction('${agency.agencyId}', 'inactive')">Ngưng hoạt động</a>
                                            </c:if>
                                            <c:if test="${agency.status ne 'active'}">
                                                <a class="agency-link" href="#" onclick="confirmAction('${agency.agencyId}', 'active')">Hoạt động</a>
                                            </c:if>

                                        </td>

                                    </tr>
                                </c:forEach>
                            </c:if>

                            <c:if test="${requestScope.filterAgencyList != null && requestScope.listSearchAgency == null && requestScope.listSortAgency == null}">
                                <c:forEach var="agency" items="${requestScope.filterAgencyList}">
                                    <tr class="agency-container">
                                        <td>${agency.agencyId}</td>
                                        <td>${agency.agencyName}</td>
                                        <td>${agency.agencyAddress}</td>
                                        <td>${agency.hotline}</td>
                                        <td>${agency.worktime}</td>
                                        <td>${agency.status eq "active" ? "Hoạt động" : "Dừng hoạt động"}</td>
                                        <td>
                                            <a class="agency-link" href="editAgency?id=${agency.agencyId}">Sửa</a>
                                            <a class="agency-link" href="agencyDetail?id=${agency.agencyId}">Chi tiết</a>
                                            <c:if test="${agency.status eq 'active'}">
                                                <a class="agency-link" href="#" onclick="confirmAction('${agency.agencyId}', 'inactive')">Ngưng hoạt động</a>
                                            </c:if>
                                            <c:if test="${agency.status ne 'active'}">
                                                <a class="agency-link" href="#" onclick="confirmAction('${agency.agencyId}', 'active')">Hoạt động</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>




                        </tbody>


                    </table>

                </div>
            </div>
        </div>

        <div class="pagination">
            <a href="#" class="prev">&laquo; Trước</a>
            <a href="#" class="page">1</a>
            <a href="#" class="page">2</a>
            <a href="#" class="page">3</a>
            <a href="#" class="next">Sau &raquo;</a>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmModalLabel">Xác nhận hành động</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="confirmModalBody">
                        Bạn có chắc chắn muốn thực hiện hành động này không?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button type="button" class="btn btn-primary" id="confirmBtn">Xác nhận</button>
                    </div>
                </div>
            </div>
        </div>     


        <jsp:include page="./footer.jsp" />      

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
            });





            function confirmAction(id, action) {
                const confirmModal = new bootstrap.Modal(document.getElementById('confirmModal'));
                const confirmBtn = document.getElementById('confirmBtn');
                const confirmModalBody = document.getElementById('confirmModalBody');

                confirmModalBody.textContent = action === 'inactive' ? 'Bạn có chắc chắn muốn ngưng hoạt động đại lý này không?' : 'Bạn có chắc chắn muốn kích hoạt đại lý này không?';

                console.log(1);
                confirmBtn.onclick = function () {
                    window.location.href = "inactiveAgency?id=" + id + "&action=" + action;
                };

                confirmModal.show();
            }

            function redirectToServlet(selectElement) {
                var selectedValue = selectElement.value;
                window.location.href = "filterAgency?filter=" + encodeURIComponent(selectedValue);
            }


            document.addEventListener('DOMContentLoaded', function () {
                const prevBtn = document.querySelector('.prev');
                const nextBtn = document.querySelector('.next');
                const pages = document.querySelectorAll('.page');

                let currentPage = 1;

                function showPage(pageNum) {

                    const agenciesList = document.querySelectorAll('.agency-container');
                    agenciesList.forEach(item => {
                        item.style.display = 'none';
                    });


                    const startIndex = (pageNum - 1) * 10;
                    const endIndex = pageNum * 10;


                    for (let i = startIndex; i < endIndex; i++) {
                        if (agenciesList[i]) {
                            agenciesList[i].style.display = 'table-row';
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
