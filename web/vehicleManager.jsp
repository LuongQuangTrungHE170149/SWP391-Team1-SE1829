<%-- 
    Document   : vehicleManager
    Created on : 9 thg 6, 2024, 19:35:15
    Author     : QUANG TRUNG
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vehicle List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f9;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            margin: 20px 0;
            text-align: center;
        }
        form input[type="text"] {
            padding: 10px;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        form button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #28a745;
            color: white;
            cursor: pointer;
            margin-left: 10px;
        }
        form button:hover {
            background-color: #218838;
        }
        table {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 15px;
            text-align: left;
            vertical-align: middle;
        }
        th {
            background-color: #f8f8f8;
            color: #333;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        a {
            color: #007bff;
            text-decoration: none;
            margin-right: 10px;
        }
        a:hover {
            text-decoration: underline;
        }
        .actions {
            text-align: center;
            white-space: nowrap;
        }
        .actions a {
            margin-right: 10px;
            display: inline-block;
        }
        .actions a:last-child {
            margin-right: 0;
        }
        .container {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <jsp:include page="./header.jsp" />
    <div class="container">
        <h2>Vehicle List</h2>
        <form action="ListVehicleServlet" method="get">
            <input type="hidden" name="customerId" value="${param.customerId}">
            <input type="text" name="searchQuery" placeholder="Tìm kiếm bằng nhãn hiệu hoặc biển số" value="${param.searchQuery}">
            <button type="submit">Search</button>
        </form>
        <form action="addVehicle.jsp">
            <button type="submit">Add New Vehicle</button>
        </form>
        <table>
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Nhãn hiệu</th>
                    <th>Biển số</th>
                    <th style="width: 200px; text-align: center;">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="vehicle" items="${vehicleList}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${vehicle.model}</td>
                        <td>${vehicle.licensePlates}</td>
                        <td class="actions">
                            <c:choose>
                                <c:when test="${vehicle.hasContract}">
                                    <a href="viewContract.jsp?vehicleId=${vehicle.id}">View Contract</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="addContract.jsp?vehicleId=${vehicle.id}">Create Contract</a>
                                </c:otherwise>
                            </c:choose>
                            <a href="editVehicle.jsp?vehicleId=${vehicle.id}">Edit</a>
                            <a href="DeleteVehicleServlet?vehicleId=${vehicle.id}" onclick="return confirm('Bạn muốn xóa phương tiện này không?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>