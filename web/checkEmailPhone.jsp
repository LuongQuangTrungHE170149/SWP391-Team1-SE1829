<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kiểm tra số điện thoại hoặc email</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <style>
            #result {
                margin-top: 20px;
                font-size: 16px;
                color: #333;
            }
            .error {
                color: red;
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="staffDashboard.jsp"/>

        <div class="main-content" id="main-content">
            <div class="nav navbar bg-light sticky-top justify-content-between align-items-start mb-3 px-2"> 
                <div class="fs-3 fw-bold text-info">Tạo hợp đồng</div>
            </div>
            <div class="text-center fs-3 fw-bold text-info mb-3">Kiểm tra Email hoặc Số điện thoại</div>

            <div style="width: 600px;" class="p-3 m-auto shadow rounded-3">
                <form id="checkForm" action="checkEmailorPhone" method="post" onsubmit="return validateInput()"> 
                    <div class="d-flex mb-3">
                        <div class="form-outline" data-mdb-input-init>
                            <input class="form-control" type="text" id="phoneOrEmail" name="phoneOrEmail" value="${emailOrPhone}" required="">
                            <label class="form-label" for="phoneOrEmail">Nhập số điện thoại hoặc email</label>
                            <div id="inputError" class="error"></div>
                        </div>
                        <button class="btn btn-primary ms-3" type="submit" data-mdb-ripple-init>Check</button>
                    </div>
                    <div class="text-center">
                        <input type="hidden" id="exist" value="${exist}"/>
                        <input type="hidden" id="customerId" value="${customerId}"/>
                        <div class="text-danger">${message}</div>
                        <a id="cancel-btn" href="ListContract" class="btn btn-sm btn-danger" style="display: none;">Hủy</a>
                        <a class="btn btn-sm btn-primary" id="next-btn" href="#" style="display: none;">Tiếp tục</a>
                    </div>
                </form>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!--mdb bootstrap-->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
        <script>
                    function validateInput() {
                        const input = $("#phoneOrEmail").val().trim();
                        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                        const phoneRegex = /^[0-9]{10,11}$/;

                        if (!input) {
                            $("#inputError").html("Vui lòng nhập số điện thoại hoặc email");
                            return false;
                        } else if (!emailRegex.test(input) && !phoneRegex.test(input)) {
                            $("#inputError").html("Vui lòng nhập email hoặc số điện thoại hợp lệ");
                            return false;
                        } else {
                            $("#inputError").html("");
                            return true;
                        }
                    }

                    $(document).ready(function () {
                        var exist = document.getElementById("exist").value;
                        var nextBtn = document.getElementById("next-btn");
                        var cancelBtn = document.getElementById("cancel-btn");
                        var customerId = document.getElementById("customerId").value;
                        var phoneOrEmail = document.getElementById("phoneOrEmail").value;

                        if (exist === "true") {
                            nextBtn.href = "addVehicleForm?customerId=" + customerId + "&exist=" + exist;
                            nextBtn.style.display = "inline-block";
                            cancelBtn.style.display = "inline-block";
                        } else if (exist === "false") {
                            nextBtn.href = "AddCustomerForm?phoneOrEmail=" + encodeURIComponent(phoneOrEmail) + "&exist=" + exist;
                            nextBtn.style.display = "inline-block";
                            cancelBtn.style.display = "inline-block";
                        } else {
                            nextBtn.style.display = "none";
                            cancelBtn.style.display = "none";
                        }
                    });
        </script>

    </body>
</html>
