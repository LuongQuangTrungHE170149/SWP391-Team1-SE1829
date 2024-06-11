<%-- 
    Document   : customerAdd
    Created on : Jun 11, 2024, 4:00:36 PM
    Author     : tranm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/agency.css">
        <link rel="stylesheet" href="/SWP391-Team1-SE1829/CSS/cutomerManage.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Add customer page</title>
    </head>
    <body>
        <div id="addCustomer-page">
          
                <jsp:include page="./header.jsp" />      
            

            <div class="container edit-add--wrapper">
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6 edit-form-wrapper">
                        <div class="add-form__header">
                            <h4 class="add-form__title">Thêm khách hàng</h4>
                            <a href="customerList" class="back-btn"> 
                                <span class="back-icon"><i class="fa-solid fa-chevron-left"></i></span>
                                Quay lại
                            </a>
                        </div>
                        <div class="form-wrapper">
                           
                            <form class="add-form-customer" action="customerAdd" method="post">
                               
                                <div style="margin-bottom: 20px">
                                    <label class="input-label" for="first-name">Họ</label></br>
                                    <input type="text" required="" id="first-name" class="input-full" name="firstName" />
                                    <span class="error-messeage"></span>
                                </div>
                                <div style="margin-bottom: 20px">
                                    <label class="input-label" for="last-name">Tên</label></br>
                                    <input type="text" required="" id="last-name" class="input-full" name="lastName"/>
                                    <span class="error-messeage"></span>

                                </div>
                                <div style="margin-bottom: 20px">
                                    <label class="input-label" for="customer-Address">Địa chỉ</label></br>
                                    <input type="text" required="" id="customer-Address" class="input-full" name="address" />
                                    <span class="error-messeage"></span>
                                </div>
                                <div style="margin-bottom: 20px">
                                    
                                    <label class="input-label" for="customer-dob">Năm sinh</label></br>
                                    <input type="text" required="" id="customer-dob" class="input-full" name="dob"/>
                                    <span class="error-messeage"></span>
                                </div>
                              
                                <div style="margin-bottom: 20px" class="input-wrapper">
                                    <div>
                                        <label class="input-label" for="customer-phone">Điện thoại</label></br>
                                        <input type="text" required="" id="customer-phone" class="input-half" name="phone"/>
                                        
                                        <span class="error-messeage"></span>
                                    </div>
                                    <div>
                                        <label class="input-label" for="customer-gender">Giới tính</label></br
                                        <select  name="gender">
                                            <select class="select-half" name="gender">
                                                <option value="0" >Nam</option>
                                                <option value="1">Nữ</option>
                                            </select>

                                        </select>


                                    </div>
                                </div>
                                <div style="margin-bottom: 20px">
                                    <label class="input-label" for="customer-Email">Email</label></br>
                                    <input type="email" required="" id="customer-Email" class="input-full" name="email"/>
                                   
                                </div>                              


                                <div style="display: flex; justify-content: space-between; width: 473px">
                                    <button type="submit" class="btn-wrapper btn-save">Sửa</button>                      
                                </div>
                            </form>
                        </div>


                    </div>
                    <div class="col-md-3"></div>
                </div>

            </div> 
        </div>



        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
    </body>
</html>
