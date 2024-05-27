<%-- 
    Document   : addContract
    Created on : 22 thg 5, 2024, 23:33:32
    Author     : QUANG TRUNG
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Fetching data from the database
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SWP391_SE1829_Team1", "username", "password");
    Statement stmt = conn.createStatement();
    
    // Fetch customers
    ResultSet customers = stmt.executeQuery("SELECT id, CONCAT(firstName, ' ', lastName) AS customerName FROM Users WHERE role='Customer'");
    // Fetch agencies
    ResultSet agencies = stmt.executeQuery("SELECT AgencyId, AgencyName FROM Agencies");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Add Contract</title>
        <link rel="stylesheet" href="CSS/contract.css"/>
        <link rel="stylesheet" href="CSS/header.css"/>
        <link rel="stylesheet" href="CSS/footer.css"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#customerSearch").keyup(function () {
                    let query = $(this).val();
                    if (query.length > 2) { // Perform search when input length > 2
                        $.ajax({
                            url: 'CustomerSearchServlet',
                            type: 'GET',
                            data: {search: query},
                            success: function (data) {
                                $("#customerList").empty();
                                data.forEach(function (item) {
                                    $("#customerList").append('<option value="' + item + '"></option>');
                                });
                            }
                        });
                    }
                });
            });
        </script>
    </head>
    <body>
        <div>
            <jsp:include page="./header.jsp" />      
        <h2>Add New Contract</h2>
    <form action="AddContractServlet" method="post">
        <label for="customerId">Customer:</label>
        <select name="customerId" id="customerId">
            <c:forEach var="customer" items="${customers}">
                <option value="${customer.id}">${customer.customerName}</option>
            </c:forEach>
        </select><br>

        <label for="vehicleId">Vehicle:</label>
        <select name="vehicleId" id="vehicleId">
            <!-- To be filled dynamically with customer's vehicles via AJAX or JavaScript -->
        </select><br>

        <label for="agencyId">Agency:</label>
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

        <label for="startDate">Start Date:</label>
        <input type="date" name="startDate" id="startDate" required><br>

        <label for="description">Description:</label>
        <textarea name="description" id="description"></textarea><br>

        <label for="payment">Payment:</label>
        <input type="number" name="payment" id="payment" required><br>

        <label for="isPay">Is Pay:</label>
        <input type="checkbox" name="isPay" id="isPay"><br>

        <input type="submit" value="Add Contract">
    </form>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
<%
    customers.close();
    agencies.close();
    stmt.close();
    conn.close();
%>