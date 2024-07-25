<%-- 
    Document   : userExist
    Created on : 26 thg 7, 2024, 05:00:54
    Author     : QUANG TRUNG
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
        <p>Email hoặc số điện thoại bạn nhập đã tồn tại trong hệ thống.</p>
        <p>Bạn có muốn tiếp tục sử dụng thông tin này không?</p>
        
        <form action="AddVehicleForm" method="post">
            <input type="hidden" name="customerId" value="user.id">
            <button type="submit" class="button">Tiếp tục</button>
        </form>
        
        <form action="AddContractForm" method="post">
            
            <button type="submit" class="button">Hủy bỏ</button>
        </form>
    </div>
</body>
</html>
