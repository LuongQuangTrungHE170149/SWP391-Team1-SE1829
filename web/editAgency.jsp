<%-- 
    Document   : editAgency
    Created on : May 22, 2024, 11:50:52 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="CSS/agency.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <title>Edit Agency</title>
    </head>
    <body>
        <div id="editAgency-page">
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

            <jsp:include page="staffDashboard.jsp"/>

            <div class="main-content" id="main-content">
                <div class="container edit-agency--wrapper">
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div style="padding-top: 50px;" class="col-md-6 edit-form-wrapper">
                            <div class="add-form__header">
                                <h4 class="add-form__title">Sửa thông tin đại lý</h4>
                                <a href="listAgency" class="back-btn"> 
                                    <span class="back-icon"><i class="fa-solid fa-chevron-left"></i></span>
                                    Quay lại
                                </a>
                            </div>
                            <div  class="form-wrapper">
                                <c:set var="agency" value="${agency}" />
                                <form class="add-form-agency" action="editAgency" method="post">
                                    <div style="margin-bottom: 30px">
                                        <label class="input-label" for="agency-id">Mã đại lý</label></br>
                                        <input type="number" readonly="" id="agency-id" class="input-full" name="agencyId" value="${agency.agencyId}"/>
                                        <span class="error-messeage"></span>
                                    </div>
                                    <div style="margin-bottom: 30px">
                                        <label class="input-label" for="agency-name">Tên đại lý</label></br>
                                        <input type="text" required="" id="agency-name" class="input-full" name="agencyName" value="${agency.agencyName}"/>
                                        <span class="error-messeage"></span>
                                    </div>
                                    <div style="margin-bottom: 30px">
                                        <label class="input-label" for="agency-address">Địa chỉ</label></br>
                                        <input type="text" required="" id="agency-address" class="input-full" name="agencyAddress" value="${agency.agencyAddress}"/>
                                        <span class="error-messeage"></span>

                                    </div>
                                    <div style="margin-bottom: 30px">
                                        <select class="input-select" name="agencyStatus">
                                            <option value="active" ${agency.status eq "active" ? "selected" : ""}>Hoạt động</option>
                                            <option value="inactive" ${agency.status ne "active" ? "selected" : ""}>Dừng hoạt động</option>
                                        </select>
                                    </div>

                                    <div style="margin-bottom: 50px" class="input-wrapper">
                                        <div>
                                            <label class="input-label" for="agency-hotline">Hotline</label></br>
                                            <input type="text" required="" id="agency-hotline" class="input-half" name="agencyHotline" value="${agency.hotline}"/>
                                            <span class="error-messeage"></span>
                                        </div>
                                        <div>
                                            <label class="input-label" for="agency-worktime">Giờ làm việc</label></br>
                                            <input type="text" required="" id="agency-worktime" class="input-half" name="agencyWorktime" value="${agency.worktime}"/>
                                            <span class="error-messeage"></span>

                                        </div>
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


        </div>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
        <script>
            const form = document.querySelector(".add-form-agency");
            const agencyName = document.getElementById("agency-name");
            const agencyAddress = document.getElementById("agency-address");
            const hotline = document.getElementById("agency-hotline");
            const worktime = document.getElementById("agency-worktime");
            const submitBtn = document.querySelector(".btn-save");
            const formGroup = [agencyName, agencyAddress, hotline, worktime]


            const validationPhone = (value) => {
                const phoneRegex = /^(0[1-9])+([0-9]{8})$/;
                return phoneRegex.test(value) ? undefined : "Nhập số điện thoại hợp lệ"
            }
            const test = (value) => {
                return value.trim() ? undefined : 'Vui lòng nhập trường này'
            }



            formGroup.forEach((input) => {
                input.onblur = () => {
                    var errorElement = input.parentElement.querySelector(".error-messeage");
                    var errorMessage = test(input.value);
                    if (errorMessage) {
                        errorElement.innerText = errorMessage;
                        input.parentElement.classList.add('invalid');
                    } else {
                        errorElement.innerText = '';
                        input.parentElement.classList.remove('invalid');

                    }

                }
            })
            var isValid = true;
            hotline.onblur = () => {
                var errorElement = hotline.parentElement.querySelector(".error-messeage");
                var errorMessage = validationPhone(hotline.value);
                if (errorMessage) {
                    errorElement.innerText = errorMessage;
                    hotline.parentElement.classList.add('invalid');
                    isValid = false;
                } else {
                    errorElement.innerText = '';
                    hotline.parentElement.classList.remove('invalid');
                    isValid = true;
                }
            }

            form.addEventListener('submit', function (event) {
                if (isValid === false) {

                    event.preventDefault(); // Ngăn chặn việc submit form
                }
            });


            form.addEventListener('submit', function (event) {
                if (isValid === false) {
                    event.preventDefault(); // Ngăn chặn việc submit form
                } else {
                    if (!confirm("Bạn có chắc chắn muốn sửa thông tin này không?")) {
                        event.preventDefault(); // Ngăn chặn việc submit form nếu người dùng ấn "Cancel"
                    }
                }
            });

        </script>

    </body>
</html>
