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
            <p class="form-heading">Login form</p>
            <form action="register" method="post">
                <div class="form-content">
                    <div class="form-item">
                        <label class="label">Username or email <span class="required">*</span></label>
                        <input type="text" name="username" required>
                    </div>
                    <label class="label">Password <span class="required">*</span></label>
                        <input type="text" name="password" required>
                    </div>
                
                <div class="register-button">
                    <button type="submit">Register</button>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

