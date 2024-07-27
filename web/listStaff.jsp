<%-- 
    Document   : listStaff
    Created on : Jul 26, 2024, 2:57:57 AM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/manager.css">
        <title>Danh sách nhân viên</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
    </head>
    <body>

        <jsp:include page="staffDashboard.jsp"/>

        <c:if test="${sessionScope.mess != null}">
            <div id="toast-success" class="toast-container top-0 end-0 p-3">
                <div class="toast align-items-center text-bg-success border-0 fade show" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="d-flex">
                        <div class="toast-body">
                            ${sessionScope.mess}
                        </div>
                        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                </div>
            </div>
            <c:remove var="mess" scope="session" />
        </c:if>
        <div class="main-content" id="main-content">
            <div class="nav navbar bg-light sticky-top justify-content-between align-items-start px-2"> 
                <div class="fs-3 fw-bold text-info">Danh sách nhân viên</div>
            </div>
            <div class="mt-3">
                <div class="users-table table-wrapper">
                    <a href="addStaff" class="btn btn-info my-3 ms-3">
                            Thêm Nhân Viên
                    </a>
                    <table class="posts-table">
                        <thead>
                            <tr class="users-table-info">
                                <th>Họ tên</th>
                                <th>Giới tính</th>
                                <th>Ngày sinh</th>
                                <th>Số điện thoại</th>
                                <th>Email</th>
                                <th>Nơi làm việc</th>
                                <th>Trạng thái</th>
                                <th>Chuyển nơi làm việc</th>
                                <th>Chuyển trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="staff" items="${requestScope.listStaffs}">
                                <tr>
                                    <td>${staff.getFullName()}</td>
                                    <td>${staff.gender == 0 ? "Nam" : "Nữ"}</td>
                                    <td>
                                        <fmt:parseDate value="${staff.getDob()}" var="parsedDate" pattern="yyyy-MM-dd" />
                                        <fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy" var="formattedDate" />
                                        ${formattedDate}
                                    </td>
                                    <td>${staff.phone}</td>
                                    <td>${staff.email}</td>
                                    <td>
                                        <c:set var="isStaffIdExist" value="false" />
                                        <c:set var="agencyId" value="Chưa có đại lý" />
                                        <c:forEach var="staffWorkPlace" items="${requestScope.staffByAgency}">
                                            <c:if test="${staffWorkPlace.staffId == staff.id}">
                                                <c:set var="isStaffIdExist" value="true" />
                                                <c:set var="agencyId" value="${staffWorkPlace.agencyId}" />
                                            </c:if>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test="${isStaffIdExist}">
                                                <c:forEach var="agency" items="${requestScope.listAgency}">
                                                    <c:if test="${agency.agencyId == agencyId}">
                                                        ${agency.agencyName}
                                                    </c:if>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                Chưa có đại lý
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:forEach var="staffWorkPlace" items="${requestScope.staffByAgency}">
                                            <c:if test="${staffWorkPlace.staffId == staff.id}">
                                                <span class="${staffWorkPlace.status eq 'active' ? 'active-staff' : 'inactive-staff'}">${staffWorkPlace.status eq 'active' ? 'Hoạt động' : 'Nghỉ việc'}</span>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <c:set var="staffHasAgency" value="false" />      
                                        <c:set var="staffActive" value="false" />          
                                        <c:forEach var="staffWorkPlace" items="${requestScope.staffByAgency}">
                                            <c:if test="${staffWorkPlace.staffId == staff.id}">
                                                <c:set var="staffHasAgency" value="true" />
                                                <c:set var="currentAgencyId" value="${staffWorkPlace.agencyId}" />
                                                <c:if test="${staffWorkPlace.status eq 'active'}">
                                                    <c:set var="staffActive" value="true" />          
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${staffActive || !staffHasAgency }">
                                            <form id="agencyForm-${staff.id}" method="POST" action="listStaff">
                                                <input type="hidden" name="staffId" value="${staff.id}" />
                                                <input type="hidden" name="action" value="${staffHasAgency ? 'change' : 'add'}" />
                                                <select class="select-agency" name="changeAgency" onchange="submitAgencyForm('${staff.id}')">
                                                    <option disabled selected>Chọn đại lý</option>
                                                    <c:forEach var="agency" items="${requestScope.listAgency}">
                                                        <c:if test="${!staffHasAgency || agency.agencyId != currentAgencyId}">
                                                            <option value="${agency.agencyId}">${agency.agencyName}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </form>
                                        </c:if>
                                    </td>
                                    <td>
                                        <form class="form-status" id="form-status-${staff.id}" action="${staffActive ? 'listStaff?action=inactive' : 'listStaff?action=active'}" method="post" >
                                            <c:if test="${staffActive}">
                                                <input type="hidden" name="staffId" value="${staff.id}" />
                                                <button type="button" class="btn-action btn-inactive" onclick="submitStatusForm(${staff.id})">Nghỉ việc</button>
                                            </c:if>
                                            <c:if test="${!staffActive}">
                                                <input type="hidden" name="staffId" value="${staff.id}" />
                                                <button type="button" class="btn-action btn-active" onclick="submitStatusForm(${staff.id})">Hoạt động</button>
                                            </c:if>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
        <script>
                                                    function submitAgencyForm(staffId) {
                                                        if (confirm("Bạn có chắc chắn muốn thay đổi làm việc của nhân viên này?")) {
                                                            document.getElementById("agencyForm-" + staffId).submit();
                                                        }
                                                    }

                                                    function submitStatusForm(staffId) {
                                                        if (confirm("Bạn có chắc chắn muốn thay đổi trạng thái làm việc của nhân viên này?")) {
                                                            document.getElementById("form-status-" + staffId).submit();
                                                        }
                                                    }

                                                    setTimeout(() => {
                                                        const successToast = document.getElementById('toast-success');
                                                        if (successToast) {
                                                            successToast.style.opacity = '0';
                                                            setTimeout(() => successToast.style.display = 'none', 1000);
                                                        }
                                                    }, 3000);
        </script>
    </body>
</html>
