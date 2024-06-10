<%-- 
    Document   : login
    Created on : May 23, 2024, 1:55:29 PM
    Author     : trand
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="register.css">
        <link rel="stylesheet" href="CSS/home.css"/>
        <link rel="stylesheet" href="CSS/header.css"/>
        <link rel="stylesheet" href="CSS/footer.css"/>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="form-container">
                <p class="form-heading">Forgot password</p>
                <form action="forgetPassword" method="post">
                    
                    <div class="form-content" style="padding-top: 100px ">
                        <div class="form-item">
                            <label class="usernameEmail">Username or email<span class="required">*</span></label>
                            <input type="text" id="usernameEmail" name="usernameEmail" required>
                        </div>
                    </div>
                    <p style="red">${message}</p>
                <div class="register-button">
                    <button type="submit">Forgot</button>
                </div>
                <p style="color: red">${message}</p>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>