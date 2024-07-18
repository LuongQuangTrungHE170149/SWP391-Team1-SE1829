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
        <title>JSP Page</title>
    </head>
    <body>
       
    <form action="CheckUser" method="post">        
        <label for="phone">Nhập số điện thoại hoặc email:</label>
        <input type="text" id="phoneOrEmail" name="phoneOrEmail">
        <br>
        <input type="submit" value="Check">
    </form>
    <div id="result"></div>
    </body>
</html>
