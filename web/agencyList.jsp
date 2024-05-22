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
        <div id="listAgency-page">



            <div>
                <jsp:include page="./header.jsp" />      
            </div>

            <div class="container list-agency--wrapper">
                <h3 class="list-agency--header">Quản lí đại lý</h3>
                <div class="container-action">
                    <form action="listAgency" method="post">
                        <div class="list-agency--search">
                            <input  value="${key}" placeholder="Tìm kiếm đại lý..." name="key"/>
                            <button type="submit" class="search-agency--btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </form>
                    <div style="display: flex;">
                        <a href="listAgency?action=sort" class="btn btn-filter">Sắp xếp</a>

                        <a href="addAgency" class="btn btn-add">Thêm đại lý</a>

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

                            <c:if test="${listSortAgency != null || requestScope.listAgency == null || requestScope.listSearchAgency == null}">
                                <c:forEach var="agency" items="${requestScope.listSortAgency}">
                                    <tr>

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

                            <c:if test="${requestScope.listSearchAgency == null || requestScope.listSearchAgency.size() eq 0}">
                                <c:forEach var="agency" items="${requestScope.listAgency}">
                                    <tr>

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

                            <c:if test="${requestScope.listSearchAgency != null || requestScope.listSearchAgency.size() > 0}">
                                <c:forEach var="agency" items="${requestScope.listSearchAgency}">
                                    <tr>

                                        <td>${agency.agencyId}</td>
                                        <td>${agency.agencyName}</td>
                                        <td>${agency.agencyAddress}</td>
                                        <td>${agency.hotline}</td>
                                        <td>${agency.worktime}</td>
                                        <td>${agency.status}</td>
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
                        </tbody>


                    </table>

                </div>
            </div>


        </div>



    </body>
</html>
