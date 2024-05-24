<%-- 
    Document   : Error
    Created on : May 23, 2024, 4:37:39 PM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F-Care | Error</title>
        <link rel="stylesheet" href="CSS/footer.css"/>
        <link rel="stylesheet" href="CSS/header.css"/>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <h1>${error}</h1>
        <jsp:include page="footer.jsp"></jsp:include>

    </body>

</html>
