<%-- 
    Document   : staffProfile
    Created on : Jun 8, 2024, 6:00:46 PM
    Author     : thuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F-Care | Update Profile</title>
        <style>
            .navbar-custom {
                background: rgb(0,167,209);
                background: linear-gradient(204deg, rgba(0,167,209,1) 0%, rgba(65,159,163,1) 100%);
            }
            .text-419FA3{
                color:#419FA3;
            }
            .image:hover{
                transform: scale(1.1);
                box-shadow: 0 10px 50px #23232333;
            }
        </style>
    </head>
    <body>
      
            <jsp:include page="staffDashboard.jsp"/>
            <div class="main-content" id="main-content">
                <!--navbar-->
                <div class="nav navbar bg-light justify-content-start sticky-top mb-3 px-2">
                    <div class="fs-3 fw-bold text-info">Staff Profile</div>
                </div>
                <!--end navbar-->
                <div>

                </div>
                <div class="container" style="width: 80%; height: 100%;">
                    <button type="button" class="btn btn-secondary btn-sm mt-4" data-mdb-ripple-init onclick="goBack()">Back</button>

                    <div class="row mt-4" style="align-content: center;">

                        <div class="col-lg-3 mb-3">
                            <div class="card shadow-4 mb-4">
                                <div class="card-body text-center">
                                    <c:if test="${user.gender == 1}">
                                        <img class="image rounded-circle img-fluid"  src="images/male-avatar.png" width="200" height="200" alt="male image"/>
                                    </c:if>
                                    <c:if test="${user.gender == 0}">
                                        <img class="image rounded-circle img-fluid"  src="images/female-avatar.png" width="200" height="200" alt="female image"/>
                                    </c:if>
                                    <h1 class="fw-bold  text-nowrap">${user.username} </h1>
                                    <p class="text-muted">${user.role} <i class="fa-regular fa-circle-check text-419FA3" style="width: 10px;"></i></p>
                                    <p class="text-muted">${user.address}</p>

                                </div>
                            </div>
                            <form action="changePasswordStaff" method="post" id="changePassword">
                                <input type="hidden" name="staffId" value="${user.id}"/>
                                <div class="card shadow-4">
                                    <div class="card-header">
                                        <h4 class="m-0">Change Password</h4> 
                                    </div>
                                    <div class="card-body">
                                        <p class="text-danger m-0">${invalidPassword}</p>
                                        <div class="form-outline mb-3" data-mdb-input-init>
                                            <input type="password" name="password" value="${password}" id="password" class="form-control" required/>
                                            <label class="form-label" for="paddword">Password</label>
                                        </div>

                                        <p class="text-danger m-0">${invalidNewPassword}</p>
                                        <div class="form-outline mb-3" data-mdb-input-init>
                                            <input type="password" name="newPassword"  id="newPassword" class="form-control" required/>
                                            <label class="form-label" for="newPassword">New Password</label>
                                        </div>

                                        <p class="text-danger m-0">${invalidConfirmPassword}</p>
                                        <div class="form-outline mb-3" data-mdb-input-init>
                                            <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" required/>
                                            <label class="form-label" for="confirmPassword">Confirm Password</label>
                                        </div>

                                        <p class="text-success m-0">${success}</p>
                                        <button type="submit" class="btn btn-primary btn-sm float-end">Change</button>
                                    </div>
                                </div>
                            </form>

                        </div>

                        <div class="col-lg-9">
                            <form action="updateStaffProfile" method="post">
                                <input type="hidden" name="staffId" value="${user.id}">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Username</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"> ${user.username}</p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Date Created</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><fmt:formatDate value="${user.dateCreated}" pattern="dd/MM/yyyy"/></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Full Name</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"> ${user.getFullName()}</p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Gender</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="1" ${user.gender == 1 ?'checked':''}/>
                                                    <label class="form-check-label" for="inlineRadio1">Male</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="0" ${user.gender == 0 ?'checked':''}/>
                                                    <label class="form-check-label" for="inlineRadio2">Female</label>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Date of Birth</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <input type="date" name="dob" value="${user.dob}" class="form-control" required>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Email</p>   
                                            </div>
                                            <div class="col-sm-9">
                                                <input type="text" name="email" value="${user.email}" class="form-control" required>
                                                <p class="text-danger m-0">${invalidEmail}</p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Phone</p>

                                            </div>
                                            <div class="col-sm-9">
                                                <input type="text" name="phone" value="${user.phone}" class="form-control" required>
                                                <p class="text-danger m-0">${invalidPhone}</p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Address</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <input type="text" name="address" value="${user.address}" class="form-control" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <p class="text-success m-0 float-start">${updateMessage}</p>
                                        <button type="submit" class="btn btn-primary btn-sm float-end " data-mdb-ripple-init>Update</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>

                </div>
            </div>
       

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- MDB -->
        <script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
        <script>
                        function goBack() {
                            window.history.back();
                        }
        </script>
    </body>
</html>
