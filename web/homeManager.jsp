<%-- 
    Document   : homeManager
    Created on : May 25, 2024, 4:37:55 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
          <link rel="shortcut icon" href="images/icon motor color 419fa3.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/manager.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <title>Manager home</title>



    </head>
    <body>
       


        <div class="nav-wrapper">
            <jsp:include page="staffDashboard.jsp"/>
        </div>

        <div class="main-content" id="main-content">
            <div class="home-manager--wrapper" >
                <div class="container" style="padding: 30px;">
                    <h2 class="main-title">Tổng quan</h2>
                    <div class="row stat-cards" >
                        <div class="col-md-3">
                            <div class="stat-cards-item">
                                <p class="stat-cards-info__num"><strong>${requestScope.countCustomer}</strong></p>
                                <p class="stat-cards-info__title">Khách hàng</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-cards-item">
                                <p class="stat-cards-info__num"><strong>${requestScope.countStaff}</strong></p>
                                <p class="stat-cards-info__title">Nhân viên</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-cards-item">
                                <p class="stat-cards-info__num"><strong>
                                        <fmt:formatNumber value="${requestScope.totalPayment}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                    </strong></p>
                                <p class="stat-cards-info__title">Doanh thu</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-cards-item">
                                <p class="stat-cards-info__num"><strong>${requestScope.totalAgency}</strong></p>
                                <p class="stat-cards-info__title">Đại lý </p>
                            </div>
                        </div>

                    </div>
                    <div class="row stat-cards"  style="margin-top: 20px;">
                        <div class="col-md-3">
                            <div class="stat-cards-item">
                                <p class="stat-cards-info__num"><strong>${requestScope.totalContracts}</strong></p>
                                <p class="stat-cards-info__title">Hợp đồng</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-cards-item">
                                <p class="stat-cards-info__num"><strong>${requestScope.totalCompensations}</strong></p>
                                <p class="stat-cards-info__title">Bồi thường</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stat-cards-item">
                                <p class="stat-cards-info__num"><strong>${requestScope.totalNews}</strong></p>
                                <p class="stat-cards-info__title">Tin tức</p>
                            </div>
                        </div>
                    </div>


                    <div style="padding: 20px; background-color: #fff; margin-top: 20px; border-radius: 10px">
                        <span class="title"><strong>Biểu đồ doanh thu</strong></span>

                        <canvas id="earningsChart"></canvas>
                            <c:forEach var="entry" items="${requestScope.monthlyPayment.entrySet()}">
                            <p style="display: none" class="month">${entry.key}</p>
                            <p style="display: none" class="earning">${entry.value}</p>
                        </c:forEach>
                    </div>

                    <main>
                        <div class="chart-container">
                            <h2>Thông kê khách hàng</h2>
                            <div class="chart">
                                <canvas id="user-gender-distribution"></canvas>
                                    <c:forEach var="entry" items="${requestScope.listCustomerByGender.entrySet()}">
                                    <p style="display: none" class="gender">${entry.key}</p>
                                    <p style="display: none" class="count-gender">${entry.value}</p>
                                </c:forEach>
                            </div>
                        </div>     

                        <div class="chart-container">
                            <h2>Thông kê tình trạng bồi thường</h2>
                            <div class="chart">
                                <canvas id="payment-status"></canvas>
                                    <c:forEach var="entry" items="${requestScope.countIsPayment.entrySet()}">
                                    <p style="display: none" class="pay-status">${entry.key}</p>
                                    <p style="display: none" class="pay-count">${entry.value}</p>
                                </c:forEach>
                            </div>
                        </div>
                    </main>


               
                </div>
            </div>
        </div>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
        <script>

                                                        const payment = document.querySelector('.payment');
                                                        var childNav = document.querySelector('.nav-wrapper .sticky-top');

                                                        if (childNav) {
                                                            childNav.classList.remove('sticky-top');
                                                        }


                                                        function submitAgencyForm(staffId) {
                                                            if (confirm("Bạn có chắc chắn muốn thay đổi làm việc của nhân viên này?")) {
                                                                document.getElementById("agencyForm-" + staffId).submit();
                                                            }
                                                        }

                                                        function submitStatusForm() {
                                                            if (confirm("Bạn có chắc chắn muốn thay đổi trạng thái làm việc của nhân viên này?")) {
                                                                document.getElementById("form-status").submit();
                                                            }
                                                        }



                                                        setTimeout(() => {
                                                            const successToast = document.getElementById('toast-success');
                                                            if (successToast) {
                                                                successToast.style.opacity = '0';
                                                                setTimeout(() => successToast.style.display = 'none', 1000);
                                                            }

                                                        }, 3000);






                                                        document.addEventListener("DOMContentLoaded", function () {
                                                            var labels = [];
                                                            var data = [];
                                                            var countGender = [];
                                                            var isPayLabel = [];
                                                            var countIsPay = [];


                                                            var monthElements = document.querySelectorAll('.month');
                                                            var earningElements = document.querySelectorAll('.earning');

                                                            var countGenderElements = document.querySelectorAll('.count-gender');

                                                            var isPayElements = document.querySelectorAll('.pay-status');
                                                            var countIsPayElements = document.querySelectorAll('.pay-count');

                                                            monthElements.forEach(function (monthElement, index) {
                                                                var month = monthElement.innerText;
                                                                var earning = parseFloat(earningElements[index].innerText.replace(/[^0-9.-]+/g, "")); // Loại bỏ ký tự không phải số
                                                                labels.push(month);
                                                                data.push(earning);
                                                            });

                                                            countGenderElements.forEach(function (element) {
                                                                countGender.push(element.innerText);
                                                            })

                                                            isPayElements.forEach(function (element, index) {
                                                                var isPay;
                                                                if (element.innerText === "pending") {
                                                                    isPay = "Đang xử lý";
                                                                } else if (element.innerText === "approved") {
                                                                    isPay = "Đã thanh toán";
                                                                } else {
                                                                    isPay = "Từ chối bồi thường";

                                                                }
                                                                var count = countIsPayElements[index].innerText;
                                                                isPayLabel.push(isPay);
                                                                countIsPay.push(count);
                                                            })


                                                            var ctx = document.getElementById('earningsChart').getContext('2d');
                                                            new Chart(ctx, {
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

                                                            const ctx1 = document.getElementById('user-gender-distribution').getContext('2d');
                                                            new Chart(ctx1, {
                                                                type: 'pie',
                                                                data: {
                                                                    labels: ['Nữ', 'Nam', 'Khác'],
                                                                    datasets: [{
                                                                            data: countGender,
                                                                            backgroundColor: ['#36A2EB', '#FF6384', '#FFCE56'],
                                                                        }]
                                                                },
                                                                options: {
                                                                    responsive: true,
                                                                    plugins: {
                                                                        legend: {
                                                                            position: 'top',
                                                                        },
                                                                        title: {
                                                                            display: true,
                                                                            text: 'Phân bổ giới tính người dùng'
                                                                        }
                                                                    }
                                                                }
                                                            });



                                                            const ctx3 = document.getElementById('payment-status').getContext('2d');
                                                            new Chart(ctx3, {
                                                                type: 'pie',
                                                                data: {
                                                                    labels: isPayLabel,
                                                                    datasets: [{
                                                                            data: countIsPay,
                                                                            backgroundColor: ['#2196F3', '#F44336'],
                                                                        }]
                                                                },
                                                                options: {
                                                                    responsive: true,
                                                                    plugins: {
                                                                        legend: {
                                                                            position: 'top',
                                                                        },
                                                                        title: {
                                                                            display: true,
                                                                            text: 'Tình trạng thanh toán'
                                                                        }
                                                                    }
                                                                }
                                                            });


                                                        });
        </script>


    </body>
</html>
