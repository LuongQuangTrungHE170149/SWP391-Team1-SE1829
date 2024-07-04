<%-- 
    Document   : spinnerLoading
    Created on : Jul 1, 2024, 5:59:34 PM
    Author     : thuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Spinner</title>
        <style>
            .spinner {
                display: flex;
                justify-content: center;
                align-items: center;
                position: fixed;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
                background-color: rgba(255, 255, 255, 0.3);
                z-index: 9999;
            }

            .loader {
                border: 8px solid #70bcd4; /* Light grey */
                border-top: 8px solid #FFF; /* Blue */
                border-radius: 50%;
                width: 50px;
                height: 50px;
                animation: spin 1s linear infinite;
            }
            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }
        </style>
    </head>
    <body>
        <div id="loadingSpinner" class="spinner">
            <div class="loader"></div>
        </div>
        <script>
            // Hiển thị spinner khi trang đang tải
            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("loadingSpinner").style.display = "flex";
            });
           
            window.onload = function () {
                setTimeout(function () {
                    document.getElementById("loadingSpinner").style.display = "none";
                }, 1000);
            };

            setTimeout(function () {
                if (document.readyState === "complete") {
                    document.getElementById("loadingSpinner").style.display = "none";
                }
            }, 1500);
        </script>
    </body>
</html>
