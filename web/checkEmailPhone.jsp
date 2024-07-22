<%-- 
    Document   : checkEmailPhone
    Created on : 11 thg 7, 2024, 14:01:02
    Author     : QUANG TRUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CheckEmailAndPhone</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                margin: 0;
                padding: 0;
                background-color: #f5f5f5;
                display: flex;
                flex-direction: row;
            }

            .staff-dashboard {
                width: 300px; /* Độ rộng của staff dashboard */
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .content {
                flex: 1; /* Chia tỷ lệ để content lấp đầy phần còn lại */
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 1200px;
                margin: 20px auto;
            }

            form {
                margin: 20px 0;
            }

            label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
            }

            input[type="text"] {
                width: 100%;
                padding: 8px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            input[type="submit"] {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                background-color: #007bff;
                color: #fff;
                font-size: 16px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            #result {
                margin-top: 20px;
                font-size: 16px;
                color: #333;
            }

        </style>
    </head>
    <body>
        <div class="staff-dashboard">
            <%-- Nội dung của staff dashboard ở đây --%>
            <jsp:include page="staffDashboard.jsp"/>
        </div>
        <div class="content">
            <form action="CheckUser" method="post">        
                <label for="phoneOrEmail">Nhập số điện thoại hoặc email:</label>
                <input type="text" id="phoneOrEmail" name="phoneOrEmail">
                <br>
                <input type="submit" value="Check">
            </form>
            <div id="result"></div>
        </div>
    </body>
</html>
