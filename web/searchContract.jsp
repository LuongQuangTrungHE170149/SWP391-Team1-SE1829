<%-- 
    Document   : searchContract
    Created on : Jun 17, 2024, 3:52:55 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tra cứu hợp đồng</title>
        <style>
            td{
                padding: 10px !important;
                font-size: 12px;
                text-align: center !important;
            }
            th{
                padding: 10px !important;
                text-align: center !important;
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="content" style="height: 70vh;">
            <div class="row mt-4 px-3" style="width: 100%;">
                <div class="col-12 col-lg-4">
                    <div class="fs-2 fw-bold text-danger">Tra cứu hợp đồng</div> 
                </div>

                <div class="col-12 col-lg-5 d-flex align-items-center">
                    <form action="searchContract" method="post" class="flex-grow-1">
                        <div class="form-outline d-flex align-items-center" data-mdb-input-init>
                            <input type="search" name="key" class="form-control" value="${key}" id="datatable-search-input">
                            <button type="submit" class="border-0" style="background-color: #fff"><i class="fa-solid fa-magnifying-glass me-3"></i></button>
                            <label class="form-label" for="datatable-search-input">Nhập mã hợp đồng</label>
                        </div>
                    </form>
                </div>
                <c:if test="${message != null and not empty key}">
                    <div class="text-danger text-center">${message}</div>
                </c:if>            
            </div>

            <div class="mt-5">
                <c:if test="${not empty c}">
                    <table class="table table-hover table-bordered">
                        <thead> 
                            <tr>
                                <th>Tên chủ xe</th>
                                <th>Biển số xe</th>
                                <th>Số khung</th>
                                <th>Số máy</th>
                                <th>Loại phương tiện</th>
                                <th>Ngày hiệu lực</th>
                                <th>Ngày kết thúc</th>
                                <th>Mô tả</th>
                                <th>Chi tiết</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${c.vehicle.ownerFirstName} ${c.vehicle.ownerLastName}</td>
                                <td>${c.vehicle.licensePlates}</td>
                                <td>${c.vehicle.chassis}</td>
                                <td>${c.vehicle.engine}</td>
                                <td>${c.vehicle.motocycleType.name}</td>
                                <td><fmt:formatDate value="${c.startDate}" pattern="dd/MM/yyyy"/></td>
                                <td><fmt:formatDate value="${c.endDate}" pattern="dd/MM/yyyy"/></td>
                                <td>${c.description}</td>
                                <td><a href="#" class="text-info"><i class="fa-regular fa-folder-open"></i></a></td>
                                <td>
                                    <div class="badge <c:if test="${c.status == 'Pending'}">badge-warning</c:if>">${c.status}</div>
                                    </td>
                                </tr> 
                            </tbody>
                        </table>
                </c:if>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
