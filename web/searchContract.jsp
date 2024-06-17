<%-- 
    Document   : searchContract
    Created on : Jun 17, 2024, 3:52:55 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.min.css"
            rel="stylesheet"
            />
        <title>Search Contract Page</title>

    </head>
    <body>
        <jsp:include page="header.jsp" />


        <div class="container">
            <div style="margin-top: 20px" class="form-outline mb-4" data-mdb-input-init>
                <input type="search" class="form-control" id="datatable-search-input">
                <label class="form-label" for="datatable-search-input">Nhập mã hợp đồng hoặc mã người dùng để tra cứu</label>
            </div>
        </div>

        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.umd.min.js"
        ></script>
    </body>
</html>
