<%-- 
    Document   : addContract
    Created on : 22 thg 5, 2024, 23:33:32
    Author     : QUANG TRUNG
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Add Contract</title>
        <link rel="stylesheet" href="CSS/contract.css"/>
        <link rel="stylesheet" href="CSS/header.css"/>
        <link rel="stylesheet" href="CSS/footer.css"/>

    </head>
    <body>
        <div>
            <jsp:include page="./header.jsp" />      
        <h2>Add New Contract</h2>
    <form action="AddContractServlet" method="post">
        <label for="customerId">Khách hàng</label>
        <select name="customerId" id="customerId">
            <c:forEach var="customer" items="${customers}">
                <option value="${customer.id}">${customer.customerName}</option>
            </c:forEach>
        </select><br>

        <label for="vehicleId">Xe:</label>
        <select name="vehicleId" id="vehicleId">
            <!-- To be filled dynamically with customer's vehicles via AJAX or JavaScript -->
        </select><br>

        <label for="agencyId">Đại lý:</label>
        <select name="agencyId" id="agencyId">
            <c:forEach var="agency" items="${agencies}">
                <option value="${agency.AgencyId}">${agency.AgencyName}</option>
            </c:forEach>
        </select><br>

        <label for="contractType">Contract Type:</label>
        <select name="contractType" id="contractType">
            <option value="1">1 Year</option>
            <option value="2">2 Years</option>
            <option value="5">5 Years</option>
        </select><br>

        <label for="startDate">Ngày bắt đầu :</label>
        <input type="date" name="startDate" id="startDate" required><br>

        <label for="description">Mô tả:</label>
        <textarea name="description" id="description"></textarea><br>

        <label for="payment">Số tiền thanh toán:</label>
        <input type="number" name="payment" id="payment" required><br>

        <label for="isPay">Trạng thái:</label>
        <select name="status" id="status">
            <option value="Wait Payment">Chưa Thanh Toán</option>
            <option value="Pending">Chờ duyệt</option>
            <option value="In Process">Đang hiệu lực</option>
        </select>

        <input type="submit" value="Add Contract">
    </form>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
