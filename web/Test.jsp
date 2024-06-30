<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Khai báo</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            margin-top: 50px;
        }
        .form-container .form-title {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container .form-title i {
            font-size: 1.2rem;
            margin-right: 5px;
        }
        .form-container .form-title .edit-icon {
            cursor: pointer;
        }
        .form-container .form-title .edit-icon:hover {
            color: #007bff;
        }
        .form-container .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <!-- Form 1: Thông tin người yêu cầu bảo hiểm -->
            <form id="customerInfoForm">
                <h2 class="form-title">
                    <i class="fas fa-user"></i>
                    Thông tin người yêu cầu bảo hiểm
                    <i class="fas fa-edit edit-icon" onclick="editCustomerInfo()"></i>
                </h2>
                <div class="form-group">
                    <label for="fullName">Họ và tên:</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" required>
                </div>
                <div class="form-group">
                    <label for="gender">Giới tính:</label>
                    <select class="form-control" id="gender" name="gender" required>
                        <option value="male">Nam</option>
                        <option value="female">Nữ</option>
                        <option value="other">Khác</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="dob">Ngày sinh:</label>
                    <input type="date" class="form-control" id="dob" name="dob" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="phone">Số điện thoại:</label>
                    <input type="tel" class="form-control" id="phone" name="phone" required>
                </div>
                <div class="form-group">
                    <label for="address">Địa chỉ:</label>
                    <input type="text" class="form-control" id="address" name="address" required>
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-primary" onclick="saveCustomerInfo()">Lưu thông tin</button>
                </div>
            </form>

            <!-- Form 2: Thông tin phương tiện -->
            <form id="vehicleInfoForm" style="display: none;">
                <h2 class="form-title">
                    <i class="fas fa-car"></i>
                    Thông tin phương tiện
                </h2>
                <div class="form-group">
                    <label for="vehicleOwner">Họ chủ xe:</label>
                    <input type="text" class="form-control" id="vehicleOwner" name="vehicleOwner">
                </div>
                <div class="form-group">
                    <label for="vehicleName">Tên chủ xe:</label>
                    <input type="text" class="form-control" id="vehicleName" name="vehicleName">
                </div>
                <div class="form-group">
                    <label for="vehicleAddress">Địa chỉ:</label>
                    <input type="text" class="form-control" id="vehicleAddress" name="vehicleAddress">
                </div>
                <div class="form-group">
                    <label for="licensePlate">Biển số xe:</label>
                    <input type="text" class="form-control" id="licensePlate" name="licensePlate">
                </div>
                <div class="form-group">
                    <label for="chassisNumber">Số khung:</label>
                    <input type="text" class="form-control" id="chassisNumber" name="chassisNumber">
                </div>
                <div class="form-group">
                    <label for="engineNumber">Số máy:</label>
                    <input type="text" class="form-control" id="engineNumber" name="engineNumber">
                </div>
                <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" id="sameAsCustomer" onchange="fillCustomerInfo()">
                    <label class="form-check-label" for="sameAsCustomer">Người yêu cầu là chủ phương tiện</label>
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-primary" onclick="saveVehicleInfo()">Lưu thông tin</button>
                </div>
            </form>

            <!-- Hiển thị thông tin đã nhập -->
            <div id="displayInfo" style="display: none;">
                <h2 class="form-title">Thông tin đã nhập</h2>
                <div id="customerInfoDisplay"></div>
                <div id="vehicleInfoDisplay"></div>
                <button type="button" class="btn btn-primary mt-3" onclick="proceedToNextStep()">Tiếp tục</button>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        // Biến lưu trữ thông tin người yêu cầu và phương tiện
        let customerInfo = {};
        let vehicleInfo = {};

        // Lưu thông tin người yêu cầu bảo hiểm
        function saveCustomerInfo() {
            customerInfo = {
                fullName: $("#fullName").val(),
                gender: $("#gender").val(),
                dob: $("#dob").val(),
                email: $("#email").val(),
                phone: $("#phone").val(),
                address: $("#address").val()
            };
            displayCustomerInfo();
            showVehicleForm();
        }

        // Hiển thị thông tin người yêu cầu bảo hiểm đã lưu
        function displayCustomerInfo() {
            let displayHtml = `<h3>Thông tin người yêu cầu bảo hiểm</h3>
                <p><strong>Họ và tên:</strong> ${customerInfo.fullName}</p>
                <p><strong>Giới tính:</strong> ${customerInfo.gender}</p>
                <p><strong>Ngày sinh:</strong> ${customerInfo.dob}</p>
                <p><strong>Email:</strong> ${customerInfo.email}</p>
                <p><strong>Số điện thoại:</strong> ${customerInfo.phone}</p>
                <p><strong>Địa chỉ:</strong> ${customerInfo.address}</p>`;
            $("#customerInfoDisplay").html(displayHtml);
        }

        // Hiển thị form thông tin phương tiện
        function showVehicleForm() {
            $("#customerInfoForm").hide();
            $("#vehicleInfoForm").show();
        }

        // Lưu thông tin phương tiện
        function saveVehicleInfo() {
            vehicleInfo = {
                vehicleOwner: $("#vehicleOwner").val(),
                vehicleName: $("#vehicleName").val(),
                vehicleAddress: $("#vehicleAddress").val(),
                licensePlate: $("#licensePlate").val(),
                chassisNumber: $("#chassisNumber").val(),
                engineNumber: $("#engineNumber").val()
            };
            displayVehicleInfo();
            showDisplayInfo();
        }

        // Hiển thị thông tin phương tiện đã lưu
        function displayVehicleInfo() {
            let displayHtml = `<h3>Thông tin phương tiện</h3>
                <p><strong>Họ chủ xe:</strong> ${vehicleInfo.vehicleOwner}</p>
                <p><strong>Tên chủ xe:</strong> ${vehicleInfo.vehicleName}</p>
                <p><strong>Địa chỉ:</strong> ${vehicleInfo.vehicleAddress}</p>
                <p><strong>Biển số xe:</strong> ${vehicleInfo.licensePlate}</p>
                <p><strong>Số khung:</strong> ${vehicleInfo.chassisNumber}</p>
                <p><strong>Số máy:</strong> ${vehicleInfo.engineNumber}</p>`;
            $("#vehicleInfoDisplay").html(displayHtml);
        }

        // Hiển thị form và điền thông tin từ thông tin người yêu cầu nếu người dùng là chủ phương tiện
        function fillCustomerInfo() {
            if ($("#sameAsCustomer").is(":checked")) {
                $("#vehicleOwner").val(customerInfo.fullName);
                $("#vehicleName").val(customerInfo.fullName);
                $("#vehicleAddress").val(customerInfo.address);
            } else {
                $("#vehicleOwner").val("");
                $("#vehicleName").val("");
                $("#vehicleAddress").val("");
            }
        }

        // Hiển thị thông tin đã nhập và chuyển sang bước tiếp theo
        function showDisplayInfo() {
            $("#vehicleInfoForm").hide();
            $("#displayInfo").show();
        }

        // Chỉnh sửa thông tin người yêu cầu bảo hiểm
        function editCustomerInfo() {
            $("#customerInfoForm").show();
            $("#vehicleInfoForm").hide();
            $("#displayInfo").hide();
        }

        // Tiến hành đến bước tiếp theo (gửi thông tin đến servlet)
        function proceedToNextStep() {
            // Gửi thông tin đến servlet bằng cách sử dụng Ajax
            // Ví dụ: $.post("requestCustomerInfoServlet", { customerInfo: customerInfo, vehicleInfo: vehicleInfo });
            alert("Đã gửi thông tin đến servlet!");
            // Chuyển hướng hoặc thực hiện hành động tiếp theo
        }
    </script>
</body>
</html>
