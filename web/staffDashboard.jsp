<%-- 
    Document   : staffDashboard
    Created on : May 30, 2024, 9:06:27 PM
    Author     : thuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<link rel="stylesheet" href="CSS/staffDashboardDhung.css"/>


<div class="dashboard flex-column flex-shrink-1 p-3 text-white bg-dark shadow-lg  " style="width: 280px;">
    <a href="#" class="d-flex align-items-center mb-3  me-md-auto text-white text-decoration-none">
        <img src="images/icon motor.png" class="bi me-2" width="40" height="40" alt="alt"/>
        <span class="fs-4">Staff Manager</span>
    </a>
    <hr class="m-0">
    <ul class="nav nav-pills flex-column mb-auto ">
        <li class="nav-item">
            <a href="staffManager" class="nav-link text-white">
                <img src="images/Home.png" class="bi me-2"width="16" height="16"alt="alt"/>
                Home 
            </a>
        </li>
        <li class="nav-item">
            <a href="ConsultationManagement" class="nav-link active" aria-current="page">
                <img src="images/Consultation icon.png"class="bi me-2" width="16" height="16" alt="alt"/> Consultation
            </a>
        </li>
        <li class="nav-item">
            <a href="PromotionManagement" class="nav-link text-white">
                <svg class="bi me-2" width="16" height="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 164 163" fill="none">
                <path d="M146.8 36.0001H143.29C144.368 33.1194 144.947 30.0756 145 27.0001C144.811 19.6794 141.733 12.7308 136.438 7.67192C131.143 2.61306 124.062 -0.145015 116.74 7.68329e-05C109.545 0.155465 102.524 2.24246 96.4119 6.04255C90.3001 9.84263 85.3224 15.216 82 21.6001C78.6776 15.216 73.6999 9.84263 67.5881 6.04255C61.4762 2.24246 54.4552 0.155465 47.26 7.68329e-05C39.9383 -0.145015 32.8566 2.61306 27.5617 7.67192C22.2668 12.7308 19.1888 19.6794 19 27.0001C19.0532 30.0756 19.6315 33.1194 20.71 36.0001H17.2C14.8317 36.225 12.5315 36.9171 10.4323 38.0364C8.33316 39.1557 6.47669 40.68 4.97026 42.5212C3.46382 44.3624 2.3373 46.4839 1.65583 48.7632C0.97436 51.0424 0.751454 53.4342 1 55.8001V88.2001C0.579561 92.5582 1.70002 96.9259 4.16652 100.543C6.63301 104.161 10.2895 106.799 14.5 108V147.33C14.7778 151.412 16.6334 155.226 19.6739 157.964C22.7144 160.702 26.7011 162.15 30.79 162H133.21C137.358 162.147 141.396 160.65 144.446 157.836C147.497 155.021 149.313 151.116 149.5 146.97V108C153.711 106.799 157.367 104.161 159.833 100.543C162.3 96.9259 163.42 92.5582 163 88.2001V55.8001C163.249 53.4342 163.026 51.0424 162.344 48.7632C161.663 46.4839 160.536 44.3624 159.03 42.5212C157.523 40.68 155.667 39.1557 153.568 38.0364C151.469 36.9171 149.168 36.225 146.8 36.0001ZM145 55.8001V88.2001C145.108 88.7952 145.108 89.4049 145 90.0001H91V54.0001H145C145.108 54.5952 145.108 55.2049 145 55.8001ZM116.74 18.0001C119.29 17.8515 121.795 18.7123 123.715 20.3965C125.635 22.0807 126.815 24.4528 127 27.0001C126.815 29.5473 125.635 31.9195 123.715 33.6036C121.795 35.2878 119.29 36.1487 116.74 36.0001H94.6C96.1748 31.192 99.0994 26.9385 103.025 23.7469C106.951 20.5553 111.712 18.5603 116.74 18.0001ZM37 27.0001C37.1849 24.4528 38.3648 22.0807 40.2848 20.3965C42.2047 18.7123 44.7104 17.8515 47.26 18.0001C52.2722 18.5767 57.0138 20.579 60.9222 23.7695C64.8306 26.96 67.7417 31.2048 69.31 36.0001H47.26C44.7104 36.1487 42.2047 35.2878 40.2848 33.6036C38.3648 31.9195 37.1849 29.5473 37 27.0001ZM19 55.8001C18.892 55.2049 18.892 54.5952 19 54.0001H73V90.0001H19C18.892 89.4049 18.892 88.7952 19 88.2001V55.8001ZM32.5 108H73V144H32.5V108ZM91 144V108H131.5V144H91Z" fill="white"/>
                </svg>
                Promotion 
            </a>
        </li>
        <li class="nav-item">
            <a href="#" class="nav-link text-white">
                <img src="images/Contract icon.png" class="bi me-2" width="16" height="16" alt="alt"/>
                Contract
            </a>
        </li>
        <li class="nav-item">
            <a href="#" class="nav-link text-white">
                <img src="images/customer icon.png" class="bi me-2" width="16" height="16" alt="alt"/>
                Customer
            </a>
        </li>
    </ul>
    <hr class=""> 
    <div class="dropup">
        <a style="cursor: pointer" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"id="dropdown-user" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="images/profile-circle 1.png" class="me-2" width="32" height="32" alt="alt"/>
            <strong>Staff</strong>
        </a>
        <ul class="dropdown-menu dropdown-menu-dark text-small shadow  " aria-labelledby="dropdown-user">
            <li>
                <a href="#" class="dropdown-item">Profile</a>
            </li>
            <li><hr class="dropdown-divider"></li>
            <li>
                <a href="#" class="dropdown-item">Sign out <img src="images/sign-out 1.png" width="16" height="16"" alt="alt"/></a>
            </li>
        </ul>
    </div>
</div>

