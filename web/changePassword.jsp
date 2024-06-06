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
        <title>JSP Page</title>
        <link rel="stylesheet" href="register.css">
        <link rel="stylesheet" href="CSS/home.css"/>
        <link rel="stylesheet" href="CSS/header.css"/>
        <link rel="stylesheet" href="CSS/footer.css"/>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="form-container">
                <p class="form-heading">
                    Change Password
                <c:if test="${sessionScope.user ne null}">
                    Change Password
                </c:if>
                <c:if test="${sessionScope.user eq null}">
                    Forget Password
                </c:if>
            </p>
            <form action="changePassword" method="post">
                <div class="form-content" style="padding-top: 100px ">
                    <c:if test="${sessionScope.user ne null}">
                        <div>
                            <label class="label">Old Password <span class="required">*</span></label>
                            <input type="text" name="oldPassword" required>
                        </div>
                    </c:if>
                    <div>
                        <label class="label">Password <span class="required">*</span></label>
                        <input type="text" name="newPassword" required>
                    </div>
                    <div class="form-content">
                        <label class="label">Confirm Password <span class="required">*</span></label>
                        <input type="text" name="rePassword" required>
                    </div>
                </div>
                <div class="register-button">
                    <button type="submit">Change Password</button>
                </div>
                <p style="color: red">${message}</p>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

