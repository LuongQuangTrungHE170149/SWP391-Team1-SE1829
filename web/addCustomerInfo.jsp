<%-- 
    Document   : addCustomerInfo
    Created on : 26 thg 7, 2024, 04:37:22
    Author     : QUANG TRUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form id="customerInfoForm">
            <div class="fs-5 fw-bold text-419FA3">Thông tin người yêu cầu bảo hiểm</div>
            <hr class="text-419FA3">
            <div class="input-form mt-4">


                <div class="row mb-3">
                    <div class="col-12 col-lg-6">
                        <div class="form-outline" data-mdb-input-init>
                            <input type="text" name="firstName" id="firstName" value="${firstName}" class="form-control" required=""/>
                            <label for="firstName" class="form-label">Họ<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message text-danger" id="firstNameError"></span>
                    </div>
                    <div class="col-12 col-lg-6">
                        <div class="form-outline" data-mdb-input-init>
                            <input type="text" name="lastName" id="lastName" value="${lastName}" class="form-control" required=""/>
                            <label for="lastName" class="form-label">Tên<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message text-danger" id="lastNameError"></span>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12 col-lg-6">
                        <select name="gender" id="gender" class="form-select" required="" style="height: 37px;">
                            <option value="">-- Giới tính --</option>
                            <option value="true" ${gender == true?'selected':''}>Nam</option>
                            <option value="false" ${gender == false?'selected':''}>Nữ</option>
                        </select>
                        <span class="error-message text-danger" id="genderError"></span>
                    </div>
                    <div class="col-12 col-lg-6">
                        <div class="form-outline" data-mdb-input-init>
                            <input type="date" name="dob" id="dob" value="${dob}" class="form-control" required=""/>
                            <label for="dob" class="form-label">Ngày sinh<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message text-danger" id="dobError"></span>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12 col-lg-6">
                        <div class="form-outline" data-mdb-input-init>
                            <input type="text" name="phoneNumber" id="phoneNumber" value="${phoneNumber}" class="form-control" required=""/>
                            <label for="phoneNumber" class="form-label">Số điện thoại<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message text-danger" id="phoneNumberError"></span>
                    </div>
                    <div class="col-12 col-lg-6">
                        <div class="form-outline" data-mdb-input-init>
                            <input type="email" name="email" id="email" value="${email}" class="form-control" required=""/>
                            <label for="email" class="form-label">Email<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message text-danger" id="emailError"></span>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12 col-lg-12">
                        <div class="form-outline" data-mdb-input-init>
                            <input type="text" name="address" id="address" value="${address}" class="form-control"/>
                            <label for="address" class="form-label">Địa chỉ<span class="text-danger"> *</span></label>
                        </div>
                        <span class="error-message text-danger" id="addressError"></span>
                    </div>
                </div>
                </c:if>
                <div class="row mb-3">
                    <div class="col-12 col-lg-12">
                        <div>(<span class="text-danger"> *</span>) Thông tin cần thiết</div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12 col-lg-3">
                        <button type="button" class="btn btn-primary btn-block" data-mdb-ripple-init ">Tiếp tục</button>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
