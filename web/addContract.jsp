<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Điền thông tin hợp đồng</title>
        <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <style>
            .text-419FA3 {
                color: #419FA3;
            }
            .error-message {
                font-size: 0.875rem;
                color: #dc3545;
            }
            .info{
                color: blue;
            }
        </style>

    </head>
    <body>
        <jsp:include page="staffDashboard.jsp"/>
        <div class="main-content" id="main-content">
            <div class="nav navbar bg-light sticky-top justify-content-between align-items-start mb-3 px-2"> 
                <div class="fs-3 fw-bold text-info">Tạo hợp đồng</div>
            </div>
            <div class="container">
                <div style="width: 500px;">
                    <div class="card">
                        <div class="card-body">
                            <div class="fs-5 fw-bold text-419FA3">Thông tin hợp đồng</div>
                            <hr class="text-419FA3">
                            <div class="">
                                <div class="mb-3">                                
                                    <a  href="CheckUser">Quay lại chỉnh sửa <i class="fa-solid fa-pen" style="font-size: 14px;"></i></a>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-5">
                                        <div>Họ chủ xe:</div>  
                                    </div>
                                    <div class="col-5"> 
                                        <div class="info">${vehicleOwnerFirstName}</div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-5">
                                        <div>Tên chủ xe:</div>
                                    </div>
                                    <div class="col-5">
                                        <div class="info">${vehicleOwnerLastName}</div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-5">
                                        <div>Địa chỉ chủ xe:</div>
                                    </div>
                                    <div class="col-5">
                                        <div class="info">${vehicleOwnerAddress}</div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-5">
                                        <div>Biển số xe:</div>
                                    </div>
                                    <div class="col-5">
                                        <div class="info">${licensePlate}</div>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-5">
                                        <div>Số khung:</div>
                                    </div>
                                    <div class="col-5">
                                        <div class="info">${chassisNumber}</div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-5">
                                        <div>Số máy:</div>
                                    </div>
                                    <div class="col-5">
                                        <div class="info">${engineNumber}</div>
                                    </div>
                                </div>
                            </div>
                            <form action="AddContractSuccess" method="post">
                                <input type="hidden" name="vehicleType" value="${vehicleType}">
                                <input type="hidden" name="vehicleOwnerFirstName" value="${vehicleOwnerFirstName}">
                                <input type="hidden" name="vehicleOwnerLastName" value="${vehicleOwnerLastName}">
                                <input type="hidden" name="vehicleOwnerAddress" value="${vehicleOwnerAddress}">
                                <input type="hidden" name="licensePlate" value="${licensePlate}">
                                <input type="hidden" name="chassisNumber" value="${chassisNumber}">
                                <input type="hidden" name="engineNumber" value="${engineNumber}">
                                <input type="hidden" name="customerId" value="${customerId}">
                                <div class="row mb-3">
                                    <div class="col-5">
                                        <div>Số năm bảo hiểm: </div>
                                    </div>
                                    <div class="col-5">
                                        <select class="form-select" id="numYear" name="numYear" required onchange="updateEndDate()">
                                            <option value="1">1 năm</option>
                                            <option value="2">2 năm</option>
                                            <option value="3">3 năm</option>
                                        </select>
                                    </div>
                                </div>



                                <div class="row mb-3">
                                    <div class="col-5">
                                        <div>Ngày bắt đầu:</div> 
                                    </div>
                                    <div class="col-5">
                                        <input class="form-control" type="date" id="startDate" name="startDate" required onchange="updateEndDate()">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-5">
                                        <div>Ngày kết thúc:</div>
                                    </div>
                                    <div class="col-5">
                                        <input class="form-control" type="date" id="endDate" name="endDate" readonly>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-5">
                                        <div>Bảo hiểm tai nạn:</div>
                                    </div>
                                    <div class="col-5">
                                        <div class="d-flex">
                                            <div class="form-check me-3">
                                                <input class="form-check-input" type="radio" id="accidentInsuranceYes" name="accidentInsurance" value="yes" >
                                                <label class="form-check-label" for="accidentInsuranceYes">Có</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" id="accidentInsuranceNo" name="accidentInsurance" value="no" checked="">
                                                <label class="form-check-label" for="accidentInsuranceNo">Không</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-10">
                                        <div class="form-outline" data-mdb-input-init>
                                            <textarea id="description" name="description" rows="4" class="form-control" required></textarea>
                                            <label for="description" class="form-label">Mô tả</label>
                                        </div>
                                    </div>
                                </div>


                                <div class="row mb-3">
                                    <div class="col-5">
                                        <div>Trạng thái:</div>
                                    </div>
                                    <div class="col-5">
                                        <select class="form-select" id="status" name="status" required>
                                            <option value="pending">Chờ duyệt</option>
                                            <option value="Approved">Đang hiệu lực</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-10">
                                        <button type="submit" class="btn btn-primary btn-block" data-mdb-ripple-init>Lưu hợp đồng</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!--mdb bootstrap-->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
        <script>
                                            function updateEndDate() {
                                                const startDate = document.getElementById('startDate').value;
                                                const numYear = document.getElementById('numYear').value;

                                                if (startDate && numYear) {
                                                    const startDateObj = new Date(startDate);
                                                    const endDateObj = new Date(startDateObj);
                                                    endDateObj.setFullYear(startDateObj.getFullYear() + parseInt(numYear));
                                                    document.getElementById('endDate').value = endDateObj.toISOString().split('T')[0];
                                                } else {
                                                    document.getElementById('endDate').value = '';
                                                }
                                            }

                                            function setMinStartDate() {
                                                const today = new Date().toISOString().split('T')[0];
                                                document.getElementById('startDate').setAttribute('min', today);
                                            }

                                            window.onload = function () {
                                                setMinStartDate();
                                            }
        </script>
    </body>
</html>
