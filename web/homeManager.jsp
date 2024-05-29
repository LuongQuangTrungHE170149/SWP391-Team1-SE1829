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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/manager.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Manager home</title>
    </head>
    <body>

        <jsp:include page="./header.jsp" />      


        <div id="homeManager-page">
            <div class="container home-manager--wrapper">
                <div class="row">
                    <div class="col-md-2">
                        <div class="nav-manager">
                            <div class="sidebar">
                                <ul class="nav-lists">
                                    <li class="list">
                                        <a href="#" class="nav-link">
                                            <span class="link">Dashboard</span>
                                        </a>
                                    </li>
                                    <li class="list">
                                        <a href="customerList" class="nav-link">
                                            <span class="link">Danh sách khách hàng</span>
                                        </a>
                                    </li>
                                    <li class="list">
                                        <a href="listAgency" class="nav-link">
                                            <span class="link">Danh sách đại lý</span>
                                        </a>
                                    </li>
                                    <li class="list">
                                        <a href="#" class="nav-link">
                                            <span class="link">Danh sách nhân viên</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="home-manager--content">
                            <div style="padding: 20px;">
                                <span class="title"><strong>Tổng quan</strong></span>
                                <div class="row" style="display: flex; justify-content: center;">

                                    <div class="col-md-3 ">
                                        <div style="background-color: #1e8e1ac2" class="wrapper">
                                            <span class="sub-title"><strong>Số khách hàng</strong></span>
                                            <span class="count">${requestScope.countCustomer}</span>
                                        </div>
                                    </div>
                                    <div class="col-md-3 ">
                                        <div style="background-color: #3f51b5bf" class="wrapper">
                                            <span class="sub-title"><strong>Số nhân viên</strong></span>
                                            <span class="count">${requestScope.countStaff}</span>
                                        </div>
                                    </div>
                                    <div class="col-md-3 ">
                                        <div style="background-color: #9e9e9eb5" class="wrapper">
                                            <span class="sub-title"><strong>Doanh thu</strong></span>
                                            <span class="count payment">
                                                <fmt:formatNumber value="${requestScope.totalPayment}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                            </span>


                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div style="padding: 20px;">
                                <span class="title"><strong>Biểu đồ doanh thu</strong></span>

                                <canvas id="earningsChart"></canvas>
                                    <c:forEach var="entry" items="${requestScope.monthlyPayment.entrySet()}">
                                    <p style="display: none" class="month">${entry.key}</p>
                                    <p style="display: none" class="earning">${entry.value}</p>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


        </div>


        <script>

            const payment = document.querySelector('.payment');

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
