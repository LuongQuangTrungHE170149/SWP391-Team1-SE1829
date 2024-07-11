<%-- 
    Document   : login
    Created on : May 23, 2024, 1:55:29 PM
    Author     : trand
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Change Password</title>
    <link rel="stylesheet" href="register.css">
    <link rel="stylesheet" href="CSS/home.css"/>
    <link rel="stylesheet" href="CSS/header.css"/>
    <link rel="stylesheet" href="CSS/footer.css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .form-container {
            width: 100%;
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .form-heading {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }
        .form-content {
            margin-bottom: 15px;
        }
        .label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }
        .required {
            color: red;
        }
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .register-button {
            text-align: center;
        }
        button[type="submit"] {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button[type="submit"]:hover {
            background-color: #218838;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
    <script>
        function validatePassword() {
            var newPassword = document.forms["changePasswordForm"]["newPassword"].value;
            var rePassword = document.forms["changePasswordForm"]["rePassword"].value;
            if (newPassword != rePassword) {
                alert("New Password and Confirm Password do not match!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <jsp:include page="spinnerLoading.jsp"/>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="form-container">
        <p class="form-heading">
            <c:if test="${sessionScope.user ne null}">
                Change Password
            </c:if>
            <c:if test="${sessionScope.user eq null}">
                Forget Password
            </c:if>
        </p>
        <form name="changePasswordForm" action="changePassword" method="post" onsubmit="return validatePassword()">
            <div class="form-content">
                <c:if test="${sessionScope.user ne null}">
                    <div>
                        <label class="label">Old Password <span class="required">*</span></label>
                        <input type="password" name="oldPassword" required>
                    </div>
                </c:if>
                <div>
                    <label class="label">New Password <span class="required">*</span></label>
                    <input type="password" name="newPassword" required>
                </div>
                <div class="form-content">
                    <label class="label">Confirm Password <span class="required">*</span></label>
                    <input type="password" name="rePassword" required>
                </div>
            </div>
            <div class="register-button">
                <button type="submit">Change Password</button>
            </div>
            <p class="error-message">${message}</p>
        </form>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
