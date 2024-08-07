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
        <link rel="stylesheet" href="CSS/agency.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Danh sách đại lý</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
    </head>
    <body>
        <div class="nav-wrapper" style="height: 0">
            <jsp:include page="staffDashboard.jsp" />
        </div>
        <div class="main-content" id="main-content">
            <div class="nav navbar bg-light sticky-top justify-content-between align-items-start px-2"> 
                <div class="fs-3 fw-bold text-info">Danh sách đại lý</div>
            </div>
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
                <div class="mt-3">
                    <div class="d-flex justify-content-center mb-5">
                        <form action="listAgency" method="post" class="me-3">
                            <div class="form-outline d-flex" data-mdb-input-init>
                                <input class="form-control" type="search"  value="${key}" placeholder="Tìm kiếm đại lý..." name="key"/>
                                <button type="submit" class="search-agency--btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                        </form>
                        <div class="me-3">
                            <select name="filter" class="form-select" onchange="redirectToServlet(this)">
                                <option disabled selected>Trạng thái</option>
                                <option value="all">Tất cả</option>
                                <option value="active" ${requestScope.selectedCity eq "active" ? "selected" : ""} >Hoạt động</option>
                                <option value="inactive" ${requestScope.selectedCity eq "inactive" ? "selected" : ""}>Dừng hoạt động</option>
                            </select>
                        </div>      

                        <div style="display: flex;">
                            <a href="listAgency?action=sort" class="btn btn-light me-3 rounded-pill" data-mdb-ripple-init>Sắp xếp</a>
                            <a href="addAgency" class="btn btn-info rounded-pill" data-mdb-ripple-init>Thêm đại lý</a>
                        </div>    
                    </div>
                    <div>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Tên đại lí</th>
                                    <th>Địa chỉ</th>
                                    <th>Hotline</th>
                                    <th>Giờ làm việc</th>
                                    <th>Trạng thái</th>
                                    <th class="text-center">Hành động</th>
                                </tr>
                            </thead>
                            <tbody >

                                <c:if test="${requestScope.listSearchAgency == null  && requestScope.filterAgencyList == null}">
                                    <c:forEach var="agency" items="${requestScope.listAgency}">
                                        <tr class="agency-container">


                                            <td>${agency.agencyName}</td>
                                            <td>${agency.agencyAddress}</td>
                                            <td>${agency.hotline}</td>
                                            <td>${agency.worktime}</td>
                                            <td><div class="badge ${agency.status eq "active" ? 'badge-success' : 'badge-danger'}">${agency.status eq "active" ? "Hoạt động" : "Dừng hoạt động"}</div></td>
                                            <td class="text-center">
                                                <a class="me-3" href="editAgency?id=${agency.agencyId}"><i class="fa-regular fa-pen-to-square"></i></a>
                                                <a class="me-3" href="agencyDetail?id=${agency.agencyId}"><i class="fa-regular fa-folder-open"></i></a>


                                                <c:if test="${agency.status eq 'active'}">
                                                    <a class="badge badge-danger" href="#" onclick="confirmAction('${agency.agencyId}', 'inactive')">Ngưng hoạt động</a>
                                                </c:if>
                                                <c:if test="${agency.status ne 'active'}">
                                                    <a class="badge badge-success" href="#" onclick="confirmAction('${agency.agencyId}', 'active')">Hoạt động</a>
                                                </c:if>
                                            </td>

                                        </tr>
                                    </c:forEach>

                                </c:if>

                                <c:if test="${requestScope.listSearchAgency != null && requestScope.listSearchAgency.size() > 0 && requestScope.filterAgencyList == null}">
                                    <c:forEach var="agency" items="${requestScope.listSearchAgency}">
                                        <tr class="agency-container">
                                            <td>${agency.agencyName}</td>
                                            <td>${agency.agencyAddress}</td>
                                            <td>${agency.hotline}</td>
                                            <td>${agency.worktime}</td>
                                            <td><div class="badge ${agency.status eq "active" ? 'badge-success' : 'badge-danger'}">${agency.status eq "active" ? "Hoạt động" : "Dừng hoạt động"}</div></td>
                                            <td class="text-center">
                                                <a class="me-3" href="editAgency?id=${agency.agencyId}"><i class="fa-regular fa-pen-to-square"></i></a>
                                                <a class="me-3" href="agencyDetail?id=${agency.agencyId}"><i class="fa-regular fa-folder-open"></i></a>
                                                <c:if test="${agency.status eq 'active'}">
                                                    <a class="badge badge-danger" href="#" onclick="confirmAction('${agency.agencyId}', 'inactive')">Ngưng hoạt động</a>
                                                </c:if>
                                                <c:if test="${agency.status ne 'active'}">
                                                    <a class="badge badge-success" href="#" onclick="confirmAction('${agency.agencyId}', 'active')">Hoạt động</a>
                                                </c:if>

                                            </td>

                                        </tr>
                                    </c:forEach>
                                </c:if>

                                <c:if test="${requestScope.filterAgencyList != null && requestScope.listSearchAgency == null}">
                                    <c:forEach var="agency" items="${requestScope.filterAgencyList}">
                                        <tr class="agency-container">
                                            <td>${agency.agencyId}</td>
                                            <td>${agency.agencyName}</td>
                                            <td>${agency.agencyAddress}</td>
                                            <td>${agency.hotline}</td>
                                            <td>${agency.worktime}</td>
                                            <td>${agency.status eq "active" ? "Hoạt động" : "Dừng hoạt động"}</td>
                                            <td>
                                                <a class="" href="editAgency?id=${agency.agencyId}">Sửa</a>
                                                <a class="" href="agencyDetail?id=${agency.agencyId}">Chi tiết</a>
                                                <c:if test="${agency.status eq 'active'}">
                                                    <a class="" href="#" onclick="confirmAction('${agency.agencyId}', 'inactive')">Ngưng hoạt động</a>
                                                </c:if>
                                                <c:if test="${agency.status ne 'active'}">
                                                    <a class="" href="#" onclick="confirmAction('${agency.agencyId}', 'active')">Hoạt động</a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>




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



        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>

        <script>

                                                        var childNav = document.querySelector('.nav-wrapper .sticky-top');
                                                        if (childNav) {
                                                            childNav.classList.remove('sticky-top');
                                                        }

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
