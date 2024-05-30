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
                <label for="model">Model:</label>
                <input type="text" id="model" name="model" required>

                <label for="licensePlates">License Plates:</label>
                <input type="text" id="licensePlates" name="licensePlates" required>

                <input type="submit" value="Add Vehicle">
            </form>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
