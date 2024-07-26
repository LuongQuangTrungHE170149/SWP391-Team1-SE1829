<%-- 
    Document   : addAgency
    Created on : May 18, 2024, 2:41:07 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/agency.css">
        <title>Thêm đại lý</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
    </head>
    <body>

        <jsp:include page="staffDashboard.jsp"/>
        <div class="main-content" id="main-content">
            <div class="nav navbar bg-light sticky-top justify-content-between align-items-start px-2"> 
                <div class="fs-3 fw-bold text-info">Danh sách đại lý</div>
            </div>

            <div class="container">
                <div class="card mt-5 m-auto" style="width: 500px;">
                    <div class="card-header">
                        <div class="d-flex justify-content-between">
                            <div class="fs-3 text-info fw-bold">Thêm đại lý</div>
                            <div>
                                <a href="listAgency" class="btn btn-sm btn-rounded btn-primary"> 
                                    <i class="fa-solid fa-chevron-left"></i>
                                    Quay lại
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="card-body">
                        <form class="" action="addAgency" method="post">
                            <div class="form-outline mb-3" data-mdb-input-init>
                                <input type="text" id="agency-name" class="form-control" name="agencyName" required="" />
                                <label class="form-label" for="agency-name">Tên đại lý</label>
                            </div>
                            <span class="error-messeage"></span>
                            <div class="form-outline mb-3" data-mdb-input-init>
                                <input type="text" required="" id="agency-address" class="form-control" name="agencyAddress"/>
                                <label class="form-label" for="agency-address">Địa chỉ</label>
                            </div>
                            <span class="error-messeage"></span>

                            <div class="row mb-3">
                                <div class="col-6">
                                    <div class="form-outline" data-mdb-input-init>
                                        <input type="text" required="" id="agency-hotline" class="form-control" name="agencyHotline"/>
                                        <label class="form-label" for="agency-hotline">Hotline</label>
                                    </div>
                                    <span class="error-messeage"></span>
                                </div>
                                <div class="col-6">
                                    <div class="form-outline" data-mdb-input-init>
                                        <input type="text" required="" id="agency-worktime" class="form-control" name="agencyWorktime"/>
                                        <label class="form-label" for="agency-worktime">Giờ làm việc</label>
                                    </div>
                                    <span class="error-messeage"></span>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <button type="reset" class="btn btn-rounded btn-danger">Hủy</button>
                                <button type="submit" class="btn btn-primary btn-rounded">Lưu</button>        
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

    </div>     
    <!-- Hiện thị thông báo add thành công -->
    <c:if test="${sessionScope.addSuccess != null}">
        <div id="toast-success" class="toast-container top-0 end-0 p-3">
            <div class="toast align-items-center text-bg-success border-0 fade show" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="d-flex">
                    <div class="toast-body">
                        ${sessionScope.addSuccess}
                    </div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
            </div>
        </div>
        <c:remove var="addSuccess" scope="session" />
    </c:if>

    <!-- Hiện thị thông báo add thất bại -->
    <c:if test="${sessionScope.addFail != null}">
        <div id="toast-fail" class="toast-container top-0 end-0 p-3">
            <div class="toast align-items-center text-bg-danger border-0 fade show" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="d-flex">
                    <div class="toast-body">
                        ${sessionScope.addFail}
                    </div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
            </div>
        </div>
        <c:remove var="addFail" scope="session" />
    </c:if>


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
</script>

</body>
</html>
