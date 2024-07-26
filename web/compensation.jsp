<%-- 
    Document   : compensation
    Created on : May 30, 2024, 1:07:59 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.min.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/compensation.css">

        <title>Request compensation</title>
    </head>
    <body>

        <jsp:include page="header.jsp" />  

        <c:if test="${sessionScope.messError != null}">
            <div id="toast-success" class="toast-container top-0 end-0 p-3">
                <div class="toast align-items-center text-bg-danger border-0 fade show" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="d-flex">
                        <div class="toast-body">
                            ${sessionScope.messError}
                        </div>
                        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                </div>
            </div>
            <c:remove var="messError" scope="session" />
        </c:if>

        <div style=" background-color: #f4f4f9; padding: 50px">
            <div class="container">
                <div class="wrapper">
                    <h1>Mẫu Yêu cầu Đền bù</h1>
                    <form action="compensation" method="post" enctype="multipart/form-data">
                        <label for="policyNumber">Mã bảo hiểm<span class="text-danger">*</span> :</label>
                        <input type="text" id="policyNumber" name="policyNumber" value="${requestScope.policyNumber}" required>
                        <span style="color: red">${requestScope.error}</span>

                        <label for="incidentDate">Ngày Sự cố<span class="text-danger">*</span> :</label>
                        <input type="date" id="incidentDate" name="incidentDate" value="${requestScope.incidentDate}" required>
                        <span style="color: red">${requestScope.errorDate}</span>

                        <label for="incidentLocation">Địa điểm Sự cố<span class="text-danger">*</span>:</label>
                        <input type="text" id="incidentLocation" name="incidentLocation" value="${requestScope.incidentLocation}" required>

                        <label for="policeReportNumber">Số biên bản cảnh sát<span class="text-danger">*</span> :</label>
                        <input type="text" id="policeReportNumber" name="policeReportNumber" value="${requestScope.policeReportNumber}" required>

                        <label for="vehicleDamage">Tình trạng xe<span class="text-danger">*</span> :</label>
                        <input type="text" id="vehicleDamage" name="vehicleDamage" value="${requestScope.vehicleDamage}" required>
                        
                        <label for="estimatedRepairCost">Chi phi sửa chữa<span class="text-danger">*</span> :</label>
                        <input type="number" min="0" id="estimatedRepairCost" name="estimatedRepairCost" value="${requestScope.estimatedRepairCost}" required>
                        <span style="color: red">${requestScope.errorCost}</span>

                        <label for="incidentDescription">Mô tả Sự cố<span class="text-danger">*</span> :</label>
                        <textarea id="incidentDescription" name="incidentDescription" rows="4" value="${requestScope.incidentDescription}" required></textarea>

                        <label for="supportingDocuments">Tài liệu Hỗ trợ<span class="text-danger">*</span> :</label>
                        <input type="file" id="supportingDocuments" name="supportingDocuments" multiple>
                        <button style="margin-top: 20px" type="submit">Gửi Yêu cầu</button>
                    </form>
                </div>
            </div>
        </div>

        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.umd.min.js"
        ></script>

        <script>
            window.addEventListener('load', () => {
                setTimeout(() => {
                    const successToast = document.getElementById('toast-success');
                    const failToast = document.getElementById('toast-fail');
                    if (successToast) {
                        successToast.style.opacity = '0';
                        setTimeout(() => successToast.style.display = 'none', 1000);
                    }

                }, 3000);


            });
        </script>
    </body>
</html>
