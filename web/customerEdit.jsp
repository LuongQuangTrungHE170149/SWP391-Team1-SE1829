<%-- 
    Document   : cutomerEdit
    Created on : Jun 8, 2024, 4:40:55 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/agency.css">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/cutomerManage.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Edit customer Page</title>
    </head>
    <body>
        <div id="editCustomer-page">
            <c:if test="${sessionScope.updateFail != null}">
                <div class="toast-container top-0 end-0 p-3">
                    <div class="toast align-items-center text-bg-success border-0 fade show" role="alert" aria-live="assertive" aria-atomic="true">
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
            <div>
                <jsp:include page="./header.jsp" />      
            </div>

            <div class="container edit-agency--wrapper">

                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6 edit-form-wrapper">
                        <div class="add-form__header">
                            <h4 class="add-form__title">Sửa thông tin khách hàng</h4>
                            <a href="customerList" class="back-btn"> 
                                <span class="back-icon"><i class="fa-solid fa-chevron-left"></i></span>
                                Quay lại
                            </a>
                        </div>
                        <div class="form-wrapper">
                            <c:set var="user" value="${user}" />
                            <form class="add-form-agency" action="customerEdit" method="post">
                                <div style="margin-bottom: 20px">
                                    <label class="input-label" for="customer-id">Mã khách hàng</label></br>
                                    <input type="number" readonly="" id="customer-id" class="input-full" name="customerId" value="${user.id}"/>
                                    <span class="error-messeage"></span>
                                </div>
                                <div style="margin-bottom: 20px">
                                    <label class="input-label" for="first-name">Họ</label></br>
                                    <input type="text" required="" id="first-name" class="input-full" name="firstName" value="${user.firstName}"/>
                                    <span class="error-messeage"></span>
                                </div>
                                <div style="margin-bottom: 20px">
                                    <label class="input-label" for="last-name">Tên</label></br>
                                    <input type="text" required="" id="last-name" class="input-full" name="lastName" value="${user.lastName}"/>
                                    <span class="error-messeage"></span>

                                </div>
                                <div style="margin-bottom: 20px">
                                    <label class="input-label" for="customer-Address">Địa chỉ</label></br>
                                    <input type="text" required="" id="customer-Address" class="input-full" name="address" value="${user.address}"/>
                                    <span class="error-messeage"></span>
                                </div>
                                <div style="margin-bottom: 20px">
                                    <fmt:parseDate value="${user.getDob()}" var="parsedDate" pattern="yyyy-MM-dd" />
                                    <fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy" var="formattedDate" />
                                    <label class="input-label" for="customer-dob">Năm sinh</label></br>
                                    <input type="text" required="" id="customer-dob" class="input-full" name="dob" value="${formattedDate}"/>
                                    <span class="error-messeage"></span>
                                </div>
                                <div style="margin-bottom: 20px">
                                    <label class="input-label" >Trạng thái</label></br>
                                    <select class="input-select" name="customerStatus">
                                        <option value="active" ${user.status eq 'active' ? 'selected' : ''} >Hoạt động</option>
                                        <option value="inactive ${user.status ne 'active' ? 'selected' : ''}">Dừng hoạt động</option>
                                    </select>
                                </div>

                                <div style="margin-bottom: 20px" class="input-wrapper">
                                    <div>
                                        <label class="input-label" for="customer-phone">Điện thoại</label></br>
                                        <input type="text" required="" id="customer-phone" class="input-half" name="phone" value="${user.phone}"/>
                                        <span class="error-messeage"></span>
                                    </div>
                                    <div>
                                        <label class="input-label" for="customer-gender">Giới tính</label></br>
                                        <input type="text" required="" id="customer-gender" class="input-half" name="gender" value="${user.gender == 0 ? 'Name' : 'Nữ'}"/>
                                        <span class="error-messeage"></span>

                                    </div>
                                </div>
                                <div style="margin-bottom: 20px">
                                    <label class="input-label" for="customer-Email">Email</label></br>
                                    <input type="text" required="" id="customer-Email" class="input-full" name="email" value="${user.email}"/>
                                    <span class="error-messeage"></span>
                                </div>                              


                                <div style="display: flex; justify-content: space-between; width: 473px">
                                    <button type="submit" class="btn-wrapper btn-save">Sửa</button>                      
                                </div>
                            </form>
                        </div>


                    </div>
                    <div class="col-md-3"></div>
                </div>

            </div>      
        </div>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>

    </body>
</html>
