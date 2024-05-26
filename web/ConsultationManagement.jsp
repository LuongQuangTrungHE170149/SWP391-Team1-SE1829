<%-- 
    Document   : ConsultationManagement
    Created on : May 23, 2024, 4:59:16 PM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F-Care | Consultation Management</title>
        <!--        <link rel="stylesheet" href="CSS/ConsultationManagement.css"/>-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <style>

        </style>
    </head>
    <jsp:include page="header.jsp"></jsp:include>
        <body>
            <div class="container" style="margin-top: 75px;">
                <div>
                    <h1 class="text-center">Consultation Management</h1>
                </div>
                <div class="row d-flex justify-content-center">
                    <div class="col-md-10">
                        <table class="table table-hover table-bordered">
                            <thead class="thead-dark">
                                <tr class="table-success">
                                    <th scope="col">#</th>
                                    <th scope="col">ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Create Date</th>
                                    <th scope="col" class="text-center">Status</th>
                                    <th scope="col">Detail</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty listAll}">
                                <c:forEach var="listAll" items="${listAll}" varStatus="status">
                                    <tr>
                                        <td>${status.index+1+(currentPage - 1)*20}</td>
                                        <td>${listAll.id}</td>
                                        <td>${listAll.name}</td>
                                        <td>${listAll.email}</td>
                                        <td><fmt:formatDate value="${listAll.createDate}" pattern="dd/MM/yyyy"/></td>
                                        <c:if test="${listAll.status == true}" >
                                            <td><span class="text-primary fw-bold">Responsed</span></td>
                                        </c:if>
                                        <c:if test="${listAll.status == false}" >
                                            <td>
                                                <div class="row">
                                                    <div class="col-7 text-danger fw-bold" >Not Responed</div>
                                                    <div class="col-5 d-flex justify-content-center"><a href="ConsultationReply?id=${listAll.id}" class="text-light text-decoration-none btn btn-primary btn-sm" style="font-size:10px;">Reply</a></div>
                                                </div>
                                            </td>
                                        </c:if>    

                                        <td class="text-center"><a  href="ConsultationDetail?id=${listAll.id}" class="btn btn-primary btn-sm" style="font-size:10px;">Detail</a></td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty listAll}">
                                <tr>
                                    <td colspan="7">No data</td>
                                </tr> 
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--pagination-->
        <c:if test="${numberOfPages > 1}">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <!-- Nút Previous -->
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="ConsultationManagement?page=${currentPage - 1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${numberOfPages}" var="page">
                        <c:choose>
                            <c:when test="${page == currentPage}">
                                <li class="page-item active">
                                    <span class="page-link">${page}</span>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item">
                                    <a class="page-link" href="ConsultationManagement?page=${page}">${page}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <!-- Nút Next -->
                    <li class="page-item ${currentPage == numberOfPages ? 'disabled' : ''}">
                        <a class="page-link" href="ConsultationManagement?page=${currentPage + 1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </c:if>    


    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
<jsp:include page="footer.jsp"></jsp:include>

</html>
