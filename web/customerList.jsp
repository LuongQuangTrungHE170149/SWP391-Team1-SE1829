<%-- 
    Document   : customerList
    Created on : May 29, 2024, 9:38:49 PM
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
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/cutomerManage.css">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/agency.css">
        <link rel="stylesheet" href="CSS/header.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Customer list</title>
    </head>
    <body>


        <div class="nav-wrapper" style="height: 0">
            <jsp:include page="staffDashboard.jsp" />
        </div>

        <div id="listCustomer-page">
            <div class="container">
                <div>
                    <form action="" method="post">
                        <div class="list-agency--search">
                            <input  value="" placeholder="Tìm kiếm đại lý..." name="key"/>
                            <button type="submit" class="search-agency--btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </form>
                </div>


                <div>
                    <table class="styled-table">
                        <thead>
                            <tr>
                            
                                <th>Họ tên</th>
                                <th>Năm sinh</th>
                                <th>Giới tính</th>
                                <th>Email</th>
                                <th>Số điện thoại</th>
                                <th>Địa chỉ</th>           
                                <th></th>
                            </tr>
                        </thead>
                        <tbody >

                            <c:forEach var="cusomter" items="${requestScope.listCustomer}"  >
                                <tr>
                                   
                                    <td>${cusomter.getFullName()}</td>
                                    <td>${cusomter.getDate()}</td>
                                    <td>${cusomter.gender == 0 ? "Nam" : "Nữ"}</td>
                                    <td>${cusomter.email}</td>
                                    <td>${cusomter.phone}</td>
                                    <td>${cusomter.address}</td> 
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>


                </div>

            </div>



        </div>

        <script>
            var childNav = document.querySelector('.nav-wrapper .sticky-top');

            if (childNav) {
                childNav.classList.remove('sticky-top');
            }
        </script>
    </body>
</html>
