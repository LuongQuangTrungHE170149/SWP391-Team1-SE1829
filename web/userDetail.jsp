<%-- 
    Document   : userProfile
    Created on : Jun 20, 2024, 12:15:50 PM
    Author     : trand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông tin người dùng</title>
</head>
<body>
    <c:choose>
        <c:when test="${not empty sessionScope.user}">
            <h2>Thông tin người dùng</h2>
            <p><strong>ID:</strong> ${sessionScope.user.id}</p>
            <p><strong>Username:</strong> ${sessionScope.user.username}</p>
            <p><strong>First Name:</strong> ${sessionScope.user.firstName}</p>
            <p><strong>Last Name:</strong> ${sessionScope.user.lastName}</p>
            <p><strong>Full Name:</strong> ${sessionScope.user.fullName}</p>
            <p><strong>Password:</strong> ${sessionScope.user.password}</p>
            <p><strong>Role:</strong> ${sessionScope.user.role}</p>
            <p><strong>Gender:</strong> ${sessionScope.user.gender}</p>
            <p><strong>Email:</strong> ${sessionScope.user.email}</p>
            <p><strong>Phone Number:</strong> ${sessionScope.user.phoneNumber}</p>
            <p><strong>Date of Birth:</strong> ${sessionScope.user.dob}</p>
            <p><strong>Address:</strong> ${sessionScope.user.address}</p>
        </c:when>
        <c:otherwise>
            <p>Không có thông tin người dùng.</p>
        </c:otherwise>
    </c:choose>
</body>
</html>