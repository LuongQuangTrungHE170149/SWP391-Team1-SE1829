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
        <link rel="stylesheet" href="CSS/ConsultationManagement.css"/>
        <style>

        </style>
    </head>
    <jsp:include page="header.jsp"></jsp:include>
        <body>
            <div class="content">
                <div class="table-container">
                    <h1>Consultation Management</h1>
                    <table border="1px">
                        <tr>
                            <th>STT</th>
                            <th>ID</th>
                            <th>Email</th>
                            <th>Create Date</th>
                            <th class="status-col">Status</th>
                            <th>Detail</th>


                        </tr>
                        <c:if test="${not empty listAll}">
                        <c:forEach var="listAll" items="${listAll}" varStatus="status">
                            <tr>
                                <td>${status.index+1+(currentPage - 1)*20}</td>
                                <td>${listAll.id}</td>
                                <td>${listAll.email}</td>
                                <td><fmt:formatDate value="${listAll.createDate}" pattern="dd/MM/yyyy"/></td>
                            <td>
                                ${listAll.status == true?'<span class="response">Responsed</span>':'<span class="not-response">Not Responsed</span><span style="margin-left: 10px;" class="action"><a href="ConsultationReply?id=${listAll.id}">Reply</a></span> '}
                            </td>
                            <td  class="action"><a  href="ConsultationDetail?id=${listAll.id}">Detail</a></td>
                            
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty listAll}">
                        <tr>
                            <td colspan="7">No data</td>
                        </tr> 
                    </c:if>
                </table>
                <c:if test="${numberOfPages > 1}">
                    <div class="pagination">
                        <c:forEach begin="1" end="${numberOfPages}" var="page">
                            <c:choose>
                                <c:when test="${page == currentPage}">
                                    <span class="page-number"> ${page}</span>
                                </c:when>
                                <c:otherwise>
                                    <a style="color:black;" href="ConsultationManagement?page=${page}">${page}</a>
                                </c:otherwise>
                            </c:choose>
                            <c:if test="${page < numberOfPages}"> | </c:if>
                        </c:forEach>
                    </div>
                </c:if>
            </div>

        </div>

    </body>
    <jsp:include page="footer.jsp"></jsp:include>

</html>
