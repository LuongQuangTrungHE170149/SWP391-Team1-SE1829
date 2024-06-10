<%-- 
    Document   : success
    Created on : 30 thg 5, 2024, 13:50:31
    Author     : QUANG TRUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Confirm Contract Creation</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
            }
            h2 {
                text-align: center;
                margin-bottom: 20px;
            }
            .container {
                max-width: 600px;
                margin: 0 auto;
                border: 1px solid #ccc;
                padding: 20px;
                border-radius: 5px;
                background-color: #f9f9f9;
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
            }
            .btn-yes {
                background-color: #4CAF50;
                color: white;
            }
            .btn-no {
                background-color: #f44336;
                color: white;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>


            <h2>Đã đăng ký phương tiện</h2>
            <div class="container">
                <p>Bạn có muốn đăng ký bảo hiểm cho phương tiện không?</p>
                <div class="btn-container">
                        <input type="hidden" name="customerId" value="${param.customerId}">
                        <input type="hidden" name="vehicleId" value="${param.vehicleId}">
                <a href="addContract.jsp" class="btn btn-yes" >Yes</button>
                <a href="ListVehicleServlet?customerId=${param.customerId}" class="btn btn-no"  >No</button>
                
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>

</html>
