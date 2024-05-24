<%-- 
    Document   : addContract
    Created on : 22 thg 5, 2024, 23:33:32
    Author     : QUANG TRUNG
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Add Contract</title>
        <link rel="stylesheet" href="CSS/Contract.css"/>
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
        </div>
        <div class="box">
            <form action="processContract.jsp" method="post">
                <div class="group-14">
                    <label for="customer" class="text-wrapper-8">Khách hàng</label>
                    <input type="text" id="customerSearch" name="customer" list="customerList" required>
                    <datalist id="customerList">
                        <!-- Options will be populated by JavaScript -->
                    </datalist>
                </div>
                <!-- Other form fields -->
                <button type="submit">Tạo</button>
            </form>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>