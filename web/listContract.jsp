<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Danh sách hợp đồng</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <style>
            table td{
                padding:8px 12px !important;
                align-content: center;
            }

            .btn-table{
                padding: 3px 10px;
                font-size: 10px!important;
            }
            .search-form {
                display: flex;
                justify-content: flex-end;
                align-items: center;
                margin-bottom: 1rem;
            }

            .search-form input,
            .search-form select {
                margin-right: 0.5rem;
            }
            .badge-expired {
                background-color: #6c757d;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <jsp:include page="staffDashboard.jsp"/>
        <div class="main-content" id="main-content">
            <div class="nav navbar bg-light sticky-top justify-content-between align-items-start mb-3 px-2"> 
                <div class="fs-3 fw-bold text-info">Danh sách hợp đồng</div>
            </div>

            <!-- Form tìm kiếm -->
            <div class="d-flex justify-content-between">
                <div>
                    <a href="checkEmailPhone.jsp" class="btn btn-info btn-sm ms-3" data-mdb-ripple-init>Tạo hợp đồng</a>
                </div>
                <div>
                    <form action="ListContract" method="get" class="mb-3 d-flex justify-content-center">
                        <input type="text" name="search" placeholder="Tìm kiếm theo mã hợp đồng hoặc người yêu cầu" value="${param.search}" />
                        <select name="status" class="mx-2">
                            <option value="">Tất cả trạng thái</option>
                            <option value="Pending" ${param.status == 'Pending' ? 'selected' : ''}>Chờ duyệt</option>
                            <option value="Rejected" ${param.status == 'Rejected' ? 'selected' : ''}>Từ chối</option>
                            <option value="Approved" ${param.status == 'Approved' ? 'selected' : ''}>Đã duyệt</option>
                            <option value="Expired" ${param.status == 'Expired' ? 'selected' : ''}>Hết hạn</option>
                        </select>
                        <button type="submit" class="btn btn-info btn-sm">Tìm kiếm</button>
                    </form>
                </div>

                <div></div>
            </div>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th class="text-center">Mã hợp đồng</th>
                        <th class="">Người yêu cầu</th>
                        <th class="text-center">Ngày tạo</th>
                        <th class="text-center">Thời hạn</th>
                        <th class="text-end">Thanh toán</th>
                        <th class="">Ghi chú</th>
                        <th class="text-center">Chi tiết</th>
                        <th class="text-center">Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listAll}" var="c" varStatus="s">
                        <tr>
                            <td class="text-center">${c.code}</td>
                            <td>${c.customer.getFullName()}</td>
                            <td class="text-center"><fmt:formatDate value="${c.createDate}" pattern="dd/MM/yyyy"/></td>
                            <td class="text-center">
                                <fmt:formatDate value="${c.startDate}" pattern="dd/MM/yyyy"/> -
                                <fmt:formatDate value="${c.endDate}" pattern="dd/MM/yyyy"/> 
                                ${c.endDate < now ? '<div class="text-danger fw-bold">Đã hết hạn</div>' : ''}
                            </td>
                            <td class="text-end"><fmt:formatNumber value="${c.payment}" type="currency" currencyCode="VND"/></td>
                            <td>${c.description}</td>
                            <td class="text-center">
                                <a href="ViewContract?contractId=${c.contractId}" class="btn-detailContract">
                                    <i class="fa-regular fa-folder-open"></i>
                                </a>
                            </td>
                            <td class="text-center">
                                <div class="badge ${c.status == 'Pending'?'badge-warning':''}${c.status == 'Rejected'?'badge-danger':''}${c.status == 'Approved'?'badge-success':''}${c.status == 'Expired'?'badge-expired':''}">${c.status == 'Pending'?'Chờ duyệt':''}${c.status == 'Rejected'?'Từ chối':''}${c.status == 'Approved'?'Đã duyệt':''}${c.status == 'Expired'?'Hết hạn':''}</div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>


        </div>




        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!--mdb bootstrap-->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
    </body>
</html>
