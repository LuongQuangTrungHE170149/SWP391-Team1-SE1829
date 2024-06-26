<%-- 
    Document   : addVehicle
    Created on : 30 thg 5, 2024, 13:13:39
    Author     : QUANG TRUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/header.css"/>
        <link rel="stylesheet" href="CSS/footer.css"/>
        <link rel="stylesheet" href="CSS/vehicle.css"/>
        <title>addVehicle</title>
    </head>
    <body>
        <jsp:include page="./header.jsp" />  
        <div class="container" style="padding-top: 200px;">
            <h2>Add New Vehicle</h2>

            <form action="AddVehicle" method="post">
                <input type="hidden" name="customerId" value="${param.customerId}">
                <label for="vehicleType">Vehicle Type:</label>
                <select id="vehicleType" name="vehicleType" required>
                    <option value="Xe moto 2 bánh dung tích nhỏ hơn 50cc">Xe moto 2 bánh dung tích nhỏ hơn 50cc</option>
                    <option value="Xe moto 2 bánh dung tích lớn hơn 50cc">Xe moto 2 bánh dung tích lớn hơn 50cc</option>
                    <option value="Xe điện">Xe điện</option>
                    <option value="Moto 3 bánh">Moto 3 bánh</option>
                    <option value="Các loại xe còn lại">Các loại xe còn lại</option>
                </select>
                <label for="licensePlates">Biển kiểm soát:</label>
                <input type="text" id="licensePlates" name="licensePlates" required>

                <label for="chassis">Số khung:</label>
                <input type="text" id="chassis" name="chassis" required>

                <label for="engine">Số máy:</label>
                <input type="text" id="engine" name="engine" required>
                <input type="submit" value="Add Vehicle">
            </form>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
