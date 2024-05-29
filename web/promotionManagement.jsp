<%-- 
    Document   : promotionManagement
    Created on : May 29, 2024, 1:34:28 AM
    Author     : thuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F-Care |News Promotion</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!--summernote-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.css" rel="stylesheet">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
        <link rel="stylesheet" href="CSS/staffDashboard.css"/>
        <style>
            
        </style>
    </head>
    <body class="">
        <div class="sidebar d-flex flex-column  align-items-center  bg-dark bg-gradient">
            <div class="sidenav-header border-bottom">
                <a href="home" class="navbar-brand d-flex justify-content-center align-items-center m-0" target="_blank">
                    <img src="images/dashboard icon.png" alt="logo" class="navbar-brand-img me-2 h-100"/>
                    <span class="ms-1 fw-bold fs-4 text-white">Staff Dashboard</span>
                </a>
            </div>

            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="#" class="nav-link text-white ps-3 pe-3 bg-gradient active">
                        <svg class="h-50" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 24 24" fill="none">
                        <path d="M8 5H6C5.46957 5 4.96086 5.21071 4.58579 5.58579C4.21071 5.96086 4 6.46957 4 7V19C4 19.5304 4.21071 20.0391 4.58579 20.4142C4.96086 20.7893 5.46957 21 6 21H18C18.5304 21 19.0391 20.7893 19.4142 20.4142C19.7893 20.0391 20 19.5304 20 19V7C20 6.46957 19.7893 5.96086 19.4142 5.58579C19.0391 5.21071 18.5304 5 18 5H16M8 5C8 4.46957 8.21071 3.96086 8.58579 3.58579C8.96086 3.21071 9.46957 3 10 3H14C14.5304 3 15.0391 3.21071 15.4142 3.58579C15.7893 3.96086 16 4.46957 16 5M8 5C8 5.53043 8.21071 6.03914 8.58579 6.41421C8.96086 6.78929 9.46957 7 10 7H14C14.5304 7 15.0391 6.78929 15.4142 6.41421C15.7893 6.03914 16 5.53043 16 5M8 11H16M8 15H12" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                        <span class="fs-5">Consultation</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link text-white ps-3 pe-3">
                        <svg class="h-50"xmlns="http://www.w3.org/2000/svg" viewBox="0 0 164 163" fill="none">
                        <path d="M146.8 36.0001H143.29C144.368 33.1194 144.947 30.0756 145 27.0001C144.811 19.6794 141.733 12.7308 136.438 7.67192C131.143 2.61306 124.062 -0.145015 116.74 7.68329e-05C109.545 0.155465 102.524 2.24246 96.4119 6.04255C90.3001 9.84263 85.3224 15.216 82 21.6001C78.6776 15.216 73.6999 9.84263 67.5881 6.04255C61.4762 2.24246 54.4552 0.155465 47.26 7.68329e-05C39.9383 -0.145015 32.8566 2.61306 27.5617 7.67192C22.2668 12.7308 19.1888 19.6794 19 27.0001C19.0532 30.0756 19.6315 33.1194 20.71 36.0001H17.2C14.8317 36.225 12.5315 36.9171 10.4323 38.0364C8.33316 39.1557 6.47669 40.68 4.97026 42.5212C3.46382 44.3624 2.3373 46.4839 1.65583 48.7632C0.97436 51.0424 0.751454 53.4342 1 55.8001V88.2001C0.579561 92.5582 1.70002 96.9259 4.16652 100.543C6.63301 104.161 10.2895 106.799 14.5 108V147.33C14.7778 151.412 16.6334 155.226 19.6739 157.964C22.7144 160.702 26.7011 162.15 30.79 162H133.21C137.358 162.147 141.396 160.65 144.446 157.836C147.497 155.021 149.313 151.116 149.5 146.97V108C153.711 106.799 157.367 104.161 159.833 100.543C162.3 96.9259 163.42 92.5582 163 88.2001V55.8001C163.249 53.4342 163.026 51.0424 162.344 48.7632C161.663 46.4839 160.536 44.3624 159.03 42.5212C157.523 40.68 155.667 39.1557 153.568 38.0364C151.469 36.9171 149.168 36.225 146.8 36.0001ZM145 55.8001V88.2001C145.108 88.7952 145.108 89.4049 145 90.0001H91V54.0001H145C145.108 54.5952 145.108 55.2049 145 55.8001ZM116.74 18.0001C119.29 17.8515 121.795 18.7123 123.715 20.3965C125.635 22.0807 126.815 24.4528 127 27.0001C126.815 29.5473 125.635 31.9195 123.715 33.6036C121.795 35.2878 119.29 36.1487 116.74 36.0001H94.6C96.1748 31.192 99.0994 26.9385 103.025 23.7469C106.951 20.5553 111.712 18.5603 116.74 18.0001ZM37 27.0001C37.1849 24.4528 38.3648 22.0807 40.2848 20.3965C42.2047 18.7123 44.7104 17.8515 47.26 18.0001C52.2722 18.5767 57.0138 20.579 60.9222 23.7695C64.8306 26.96 67.7417 31.2048 69.31 36.0001H47.26C44.7104 36.1487 42.2047 35.2878 40.2848 33.6036C38.3648 31.9195 37.1849 29.5473 37 27.0001ZM19 55.8001C18.892 55.2049 18.892 54.5952 19 54.0001H73V90.0001H19C18.892 89.4049 18.892 88.7952 19 88.2001V55.8001ZM32.5 108H73V144H32.5V108ZM91 144V108H131.5V144H91Z" fill="white"/>
                        </svg>
                        <span class="fs-5">Promotion</span>
                    </a>
                </li>
                <li class="nav-item">
                    <div class="text-white ps-4">
                        <h6 class="  mb-0 fw-bold">ACCOUNT PAGE</h6>
                        <span class="text-grey fs-6">Hello, </span>
                    </div>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link text-white ps-3 pe-3">
                        <svg class="h-50"xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 251 251" fill="none">
                        <path d="M163.072 31.6593C153.532 21.3595 140.207 15.6875 125.5 15.6875C110.715 15.6875 97.3458 21.3252 87.85 31.5613C78.2512 41.9101 73.5744 55.975 74.6725 71.1624C76.8491 101.126 99.6499 125.5 125.5 125.5C151.35 125.5 174.112 101.13 176.323 71.1722C177.435 56.122 172.729 42.0866 163.072 31.6593Z" fill="white"/>
                        <path d="M211.781 235.312H39.2187C36.9601 235.342 34.7232 234.867 32.671 233.924C30.6188 232.98 28.8028 231.59 27.3551 229.856C24.1686 226.047 22.8841 220.846 23.8352 215.585C27.9728 192.633 40.8855 173.352 61.1812 159.816C79.2121 147.801 102.052 141.188 125.5 141.188C148.948 141.188 171.788 147.806 189.819 159.816C210.114 173.347 223.027 192.628 227.165 215.581C228.116 220.841 226.831 226.042 223.645 229.851C222.198 231.586 220.382 232.977 218.33 233.921C216.277 234.866 214.04 235.341 211.781 235.312Z" fill="white"/>
                        </svg>
                        <span class="fs-5">Profile</span>
                    </a>
                    <a href="#" class="nav-link text-white ps-3 pe-3">
                        <svg class="h-50" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 504 386" fill="none">
                        <path d="M6.97502 176.021L174.975 8.02124C189.975 -6.97876 215.975 3.52123 215.975 25.0212L215.975 121.021L351.975 121.021C365.275 121.021 375.975 131.721 375.975 145.021L375.975 241.021C375.975 254.321 365.275 265.021 351.975 265.021L215.975 265.021L215.975 361.021C215.975 382.421 190.075 393.021 174.975 378.021L6.97502 210.021C-2.32498 200.621 -2.32498 185.421 6.97502 176.021ZM311.975 13.0212L311.975 53.0212C311.975 59.6212 317.375 65.0212 323.975 65.0212L407.975 65.0212C425.675 65.0212 439.975 79.3212 439.975 97.0212L439.975 289.021C439.975 306.721 425.675 321.021 407.975 321.021L323.975 321.021C317.375 321.021 311.975 326.421 311.975 333.021L311.975 373.021C311.975 379.621 317.375 385.021 323.975 385.021L407.975 385.021C460.975 385.021 503.975 342.021 503.975 289.021L503.975 97.0212C503.975 44.0212 460.975 1.02121 407.975 1.02122L323.975 1.02123C317.375 1.02123 311.975 6.42123 311.975 13.0212Z" fill="white"/>
                        </svg>
                        <span class="fs-5">Logout</span>
                    </a>
                </li>
            </ul>
        </div>

        <!-- Page content -->
        <div class="content fill-height">
            <h2>Main Content</h2>
            <p>This is the main content area.</p>
            <div id="summernote"></div>

        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!--summernote-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#summernote').summernote();
            });
        </script>
    </body>
</html>
