
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row justify-content-center align-items-center h-100">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5">
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Registration Form</h3>
                                <form>

                                    <div class="row">
                                        <div class="col-md-6 mb-4">

                                            <div data-mdb-input-init class="form-outline">
                                                <input type="text" id="firstName" class="form-control form-control-lg" />
                                                <label class="form-label" for="firstName">First Name</label>
                                            </div>

                                        </div>
                                        <div class="col-md-6 mb-4">

                                            <div data-mdb-input-init class="form-outline">
                                                <input type="text" id="lastName" class="form-control form-control-lg" />
                                                <label class="form-label" for="lastName">Last Name</label>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 d-flex align-items-center">

                                            <div data-mdb-input-init class="form-outline datepicker w-100">
                                                <input type="text" class="form-control form-control-lg" id="birthdayDate" />
                                                <label for="birthdayDate" class="form-label">Birthday</label>
                                            </div>

                                        </div>
                                        <div class="col-md-6 mb-4">

                                            <h6 class="mb-2 pb-1">Gender: </h6>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="femaleGender"
                                                       value="option1" checked />
                                                <label class="form-check-label" for="femaleGender">Female</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="maleGender"
                                                       value="option2" />
                                                <label class="form-check-label" for="maleGender">Male</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="otherGender"
                                                       value="option3" />
                                                <label class="form-check-label" for="otherGender">Other</label>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 pb-2">

                                            <div data-mdb-input-init class="form-outline">
                                                <input type="email" id="emailAddress" class="form-control form-control-lg" />
                                                <label class="form-label" for="emailAddress">Email</label>
                                            </div>

                                        </div>
                                        <div class="col-md-6 mb-4 pb-2">

                                            <div data-mdb-input-init class="form-outline">
                                                <input type="tel" id="phoneNumber" class="form-control form-control-lg" />
                                                <label class="form-label" for="phoneNumber">Phone Number</label>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-12">

                                            <select class="select form-control-lg">
                                                <option value="1" disabled>Choose option</option>
                                                <option value="2">Subject 1</option>
                                                <option value="3">Subject 2</option>
                                                <option value="4">Subject 3</option>
                                            </select>
                                            <label class="form-label select-label">Choose option</label>

                                        </div>
                                    </div>

                                    <div class="mt-4 pt-2">
                                        <input data-mdb-ripple-init class="btn btn-primary btn-lg" type="submit" value="Submit" />
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--email change password-->
        <div style="height: 100vh; align-content: center; ">
            <div style="width: 85%;border: 1px solid #eee; border-radius: 8px; margin: auto;">
                <div class="card-body" style="padding: 24px;">
                    <h2 style="text-align: center; margin-bottom: 0;">F-Care Insurance</h2>
                    <p style="text-align: center">Thay đổi mật khẩu</p>
                    <hr>
                    <p>xin chào <strong>Kha21</strong></p>
                    <p>Bạn vừa thực hiện đổi mật khẩu mới!</p>
                    <p style="color: #ccc"><i>Lưu ý <b>không chia sẻ</b> email này với bất kì ai!</i></p>
                    <p style="text-align: center;">Đây là mật khẩu của bạn</p>
                    <p style="text-align: center; font-size: 32px; margin: 24px 16px; background-color: #7bc4d3;">1234</p>
                </div>
            </div>
        </div>
        <!--end email change password-->
        <jsp:include page="footer.jsp"/>
    </body>
</html>