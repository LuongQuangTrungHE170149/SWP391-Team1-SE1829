<%-- 
    Document   : userNotExist
    Created on : 26 thg 7, 2024, 05:24:47
    Author     : QUANG TRUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông báo</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                text-align: center;
                margin-top: 50px;
            }
            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                display: inline-block;
            }
            .button {
                background-color: #007BFF;
                color: #fff;
                border: none;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 5px;
                margin: 10px;
                cursor: pointer;
            }
            .button:hover {
                background-color: #0056b3;
            }
            .alert {
                color: #d9534f;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2 class="alert">Thông báo</h2>
            <p>Email hoặc số điện thoại bạn nhập không tồn tại trong hệ thống.</p>
            

            <form action="AddCustomerForm" method="post">
                
                <button type="submit" class="button">Tiếp tục</button>
            </form>

            <form action="AddContractForm" method="post">

                <button type="submit" class="button">Hủy bỏ</button>
            </form>
        </div>
    </body>
</html>
