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
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
                background-color: #f4f4f4;
            }
            h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }
            .container {
                max-width: 600px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            label {
                display: block;
                margin-top: 10px;
                margin-bottom: 5px;
                font-weight: bold;
                color: #555;
            }
            input[type="text"],
            input[type="date"],
            input[type="number"],
            select,
            textarea {
                width: calc(100% - 20px);
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }
            textarea {
                height: 100px;
                resize: vertical;
            }
            .btn-container {
                text-align: center;
                margin-top: 20px;
            }
            .btn {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                background-color: #4CAF50;
                color: white;
                font-size: 16px;
            }
            .btn:hover {
                background-color: #45a049;
            }
            .inline-label {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }
            .inline-label label {
                flex: 0 0 120px;
                margin-right: 10px;
            }
            .inline-label span {
                flex: 1;
            }
        </style>
    </head>
    <body>
        <div>
            <jsp:include page="./header.jsp" />      
            <div class="container">
                <h2>Add New Contract</h2>
                <form action="AddContractServlet" method="post">
                    <div class="inline-label">
                        <label for="customerName">Khách hàng:</label>
                        <input type="hidden" name="customerId" id="customerId" value="${param.customerId}">
                        <span>${customerName}</span>
                    </div>
                    
                    <div class="inline-label">
                        <label for="vehicleModel">Nhãn hiệu xe:</label>
                        <span>${model}</span>
                    </div>
                    
                    <div class="inline-label">
                        <label for="vehicleLicensePlates">Biển số:</label>
                        <span>${licensePlates}</span>
                    </div>
    
                    <input type="hidden" name="vehicleId" id="vehicleId" value="${param.vehicleId}">
                    
                    <label for="agencyId">Đại lý:</label>
                    <select name="agencyId" id="agencyId">
                        <c:forEach var="agency" items="${agencies}">
                            <option value="${agency.getAgencyId()}">${agency.getAgencyName()}</option>
                        </c:forEach>
                    </select><br>
    
                    <label for="contractType">Contract Type:</label>
                    <select name="contractType" id="contractType">
                        <option value="1">1 năm</option>
                        <option value="2">2 năm</option>
                        <option value="5">5 năm</option>
                    </select><br>
    
                    <label for="startDate">Ngày bắt đầu :</label>
                    <input type="date" name="startDate" id="startDate" required><br>
    
                    <label for="payment">Số tiền thanh toán:</label>
                    <input type="number" name="payment" id="payment" required><br>
    
                    <label for="status">Trạng thái:</label>
                    <select name="status" id="status">
                        <option value="Wait Payment">Chưa Thanh Toán</option>
                        <option value="Pending">Chờ duyệt</option>
                        <option value="In Process">Đang hiệu lực</option>
                    </select><br>
                    
                    <label for="description">Mô tả:</label>
                    <textarea name="description" id="description"></textarea><br>
    
                    <div class="btn-container">
                        <input type="submit" value="Add Contract" class="btn">
                    </div>
                </form>
            </div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>