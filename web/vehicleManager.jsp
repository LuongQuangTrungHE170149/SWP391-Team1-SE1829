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
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <jsp:include page="./header.jsp" />  
    <h2>Vehicle List</h2>
    <table>
        <thead>
            <tr>
                <th>STT</th>
                <th>Nhãn hiệu</th>
                <th>Biển số</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="vehicle" items="${vehicleList}">
                <tr>
                    <td>${vehicle.id}</td>
                    <td>${vehicle.model}</td>
                    <td>${vehicle.licensePlates}</td>
                    <td>
                        <a href="createContract.jsp?vehicleId=${vehicle.id}">Create Contract</a>
                        <a href="editVehicle.jsp?vehicleId=${vehicle.id}">Edit</a>
                        <a href="deleteVehicleServlet?vehicleId=${vehicle.id}" onclick="return confirm('Are you sure you want to delete this vehicle?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>