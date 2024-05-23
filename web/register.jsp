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
            <p class="form-heading">Rgister form</p>
            <form action="register" method="post">
                <div class="form-content">
                    <div class="form-item">
                        <label class="label">Username <span class="required">*</span></label>
                        <input type="text" name="username" required>
                    </div>
                    <label class="label">Password <span class="required">*</span></label>
                        <input type="text" name="password" required>
                    </div>
                <label class="label">Confirm Password <span class="required">*</span></label>
                        <input type="text" name="Confirm Password" required>
                    </div>
                    <div class="form-item">
                        <label class="label">First Name <span class="required">*</span></label>
                        <input type="text" name="firstName" required>
                    </div>
                    <div class="form-item">
                        <label class="label">Last Name <span class="required">*</span></label>
                        <input type="text" name="lastName" required>
                    </div>
                    <div class="form-item">
                        <label class="label">Email Address <span class="required">*</span></label>
                        <input type="email" name="email" required>
                    </div>
                    <div class="form-item">
                        <label class="label">Phone Number <span class="required">*</span></label>
                        <input type="tel" name="phone" required>
                    </div>
                    <div class="form-item">
                        <label class="label">Date of Birth <span class="required">*</span></label>
                        <input type="date" name="dob" required>
                    </div>
                    <div class="form-item">
                        <label class="label">Address <span class="required">*</span></label>
                        <input type="text" name="address" required>
                    </div>
                    <div class="form-item">
                        <label class="label">Gender <span class="required">*</span></label>
                        <select name="gender" required>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
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
