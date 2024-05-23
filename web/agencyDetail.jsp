<%-- 
    Document   : agencyDetail
    Created on : May 21, 2024, 9:25:56 PM
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
        <link rel="stylesheet" href="CSS/header.css"/>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Agency detail</title>
    </head>
    <body>
        <div id="agencyDetail-page">
            <div>
                <jsp:include page="./header.jsp" />      
            </div>
            <div class="wrraper">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 agency-info">
                            <a href="listAgency" class="link-back"><i class="fa-solid fa-chevron-left"></i></a>
                            <c:set var="agency" value="${requestScope.agency}"/>
                            <div class="agency-info--wrapper">
                                <div class="agency-info-detail">
                                    <span><strong>Tên đại lý: </strong></span>
                                    <p>${agency.agencyName}</p>
                                </div>
                                <div class="agency-info-detail">
                                    <span><strong>Địa chỉ: </strong></span>
                                    <p>${agency.agencyAddress}</p>
                                </div>
                                <div class="agency-info-detail">
                                    <span><strong>Hotline: </strong></span>
                                    <p>${agency.hotline}</p>
                                </div>
                                <div class="agency-info-detail">
                                    <span><strong>Giờ làm việc: </strong></span>
                                    <p>${agency.worktime}</p>
                                </div>
                                <div class="agency-info-detail">
                                    <span><strong>Trạng thái: </strong></span>
                                    <p>${agency.status eq "active" ? "Hoạt động" : "Dừng hoạt động"}</p>
                                </div>
                            </div>
                            <a href="editAgency?id=${agency.agencyId}" class="btn btn-edit">Sửa</a>

                        </div>
                        <div class="col-md-1">

                        </div>
                        <div class="col-md-7 agency-review">
                            <h3 style="text-align: center; margin-top: 10px;"><span>Doanh thu</span></h3>

                            <c:if test="${requestScope.totalPayment != null}">
                                <div style="margin: 20px;">
                                    <p><strong>Tổng doanh thu: </strong><span>${totalPayment}đ</span></p>

                                    <canvas id="earningsChart"></canvas>
                                        <c:forEach var="entry" items="${requestScope.monthlyPayment.entrySet()}">
                                        <p style="display: none" class="month">${entry.key}</p>
                                        <p style="display: none" class="earning">${entry.value}</p>
                                    </c:forEach>
                                </div>
                            </c:if>



                        </div>
                    </div>
                    <div class="row" style="margin-top: 30px;">
                        <div class="agency-staffs">
                            <h4 style="text-align: center; margin-top: 10px;"><span>Danh sách nhân viên</span></h4>
                            <table class="employee-table">
                                <thead>
                                    <tr>
                                        <th>Mã</th>
                                        <th>Tên</th>
                                        <th>Đại lý</th>
                                        <th>Email</th>
                                        <th>Số điện thoại</th>
                                        <th>Giới tính</th>
                                        <th>Địa chỉ</th>
                                        <th>Năm sinh</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="staff" items="${requestScope.users}">
                                        <tr>
                                            <td>${staff.id}</td>
                                            <td>${staff.getFullName()}</td>
                                            <td>${agency.agencyName}</td>
                                            <td>${staff.email}</td>
                                            <td>${staff.phone}</td>
                                            <td>${staff.gender == 0 ? "Nam" : "Nữ"}</td>
                                            <td>${staff.address}</td>
                                            <td>${staff.date}</td>


                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var labels = [];
                var data = [];

                // Lấy các phần tử có lớp là 'month' và 'earning'
                var monthElements = document.querySelectorAll('.month');
                var earningElements = document.querySelectorAll('.earning');

                // Lấy dữ liệu từ các phần tử và lưu vào mảng
                monthElements.forEach(function (monthElement, index) {
                    var month = monthElement.innerText;
                    var earning = parseFloat(earningElements[index].innerText.replace(/[^0-9.-]+/g, "")); // Loại bỏ ký tự không phải số
                    labels.push(month);
                    data.push(earning);
                });

                var ctx = document.getElementById('earningsChart').getContext('2d');
                var earningsChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                                label: 'Doanh thu mỗi tháng',
                                data: data,
                                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                                borderColor: 'rgba(54, 162, 235, 1)',
                                borderWidth: 1
                            }]
                    },
                    options: {
                        indexAxis: 'x',
                        scales: {
                            xAxes: [{
                                    ticks: {
                                        beginAtZero: true,
                                        callback: function (value, index, values) {
                                            return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' VND';
                                        }
                                    }
                                }]
                        }
                    }
                });

            });
        </script>
    </body>
</html>
