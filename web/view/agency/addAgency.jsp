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

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/agency.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Add Agency</title>

    </head>
    <body>
        <div id="addAgency-page">

            <div>
                <jsp:include page="" />      
            </div>

            <div class="wrraper">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="add-form">
                                <div class="add-form__header">
                                    <h4 class="add-form__title">Thêm đại lý</h4>
                                    <a href="" class="back-btn"> 
                                        <span class="back-icon"><i class="fa-solid fa-chevron-left"></i></span>
                                        Quay lại
                                    </a>
                                </div>

                                <div class="form-wrapper">
                                    <form class="add-form-agency" action="addAgency" method="post">
                                        <div style="margin-bottom: 30px">
                                            <label class="input-label" for="agency-name">Tên đại lý</label></br>
                                            <input type="text" required="" id="agency-name" class="input-full" name="agencyName"/>
                                        </div>
                                        <div style="margin-bottom: 30px">
                                            <label class="input-label" for="agency-address">Địa chỉ</label></br>
                                            <input type="text" required="" id="agency-address" class="input-full" name="agencyAddress"/>
                                        </div>

                                        <div style="margin-bottom: 50px" class="input-wrapper">
                                            <div>
                                                <label class="input-label" for="agency-hotline">Hotline</label></br>
                                                <input type="text" required="" id="agency-hotline" class="input-half" name="agencyHotline"/>
                                                <span class="error-hotline"></span>
                                            </div>
                                            <div>
                                                <label class="input-label" for="agency-worktime">Giờ làm việc</label></br>
                                                <input type="text" required="" id="agency-worktime" class="input-half" name="agencyWorktime"/>
                                            </div>
                                        </div>
                                        <div style="display: flex; justify-content: space-between; width: 473px">
                                            <button type="submit" class="btn btn-save">Lưu</button>        
                                            <button type="reset" class="btn btn-cancel">Hủy</button>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>     
                <!--Hiện thị thông báo add thành công-->
                <c:if test="${sessionScope.addSuccess != null}">
                    <div class="toast-container top-0 end-0 p-3">
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
                 <c:if test="${sessionScope.addFail != null}">
                    <div class="toast-container top-0 end-0 p-3">
                        <div class="toast align-items-center text-bg-success border-0 fade show" role="alert" aria-live="assertive" aria-atomic="true">
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
        </div>


        <script>
            const form = document.querySelector(".add-form-agency");
            const hotline = document.getElementsByName("agencyHotline")[0];

            const validationPhone = (phone) => {
                const phoneRegex = /^(0[3|5|7|8|9])+([0-9]{8})$/;

                // Kiểm tra số điện thoại với biểu thức chính quy
                if (phoneRegex.test(phone)) {
                    return true;  // Số điện thoại hợp lệ
                } else {
                    return false; // Số điện thoại không hợp lệ
                }
            }
//            form.addEventListener('submid', (event) => {
//                console.log(event.target.value);
//
//            })



        </script>

    </body>
</html>
