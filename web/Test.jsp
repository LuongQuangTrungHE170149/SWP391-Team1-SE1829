
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sidebar với Bootstrap</title>
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"rel="stylesheet"/>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"rel="stylesheet"/>
        <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.min.css"rel="stylesheet"/><body>
        <style>
            /* Custom CSS for Sidebar */
            .sidebar {
                height: 100%;
                width: 250px;
                position: fixed;
                top: 0;
                left: 0;
                background-color: #343a40;
                padding-top: 20px;
                transition: width 0.3s;
            }

            .sidebar a {
                padding: 10px 15px;
                text-decoration: none;
                font-size: 18px;
                color: white;
                display: block;
            }

            .sidebar a:hover {
                background-color: #575d63;
            }

            .sidebar.collapsed {
                width: 0;
            }

            .sidebar.collapsed a {
                display: none;
            }

            .main-content {
                margin-left: 250px;
                transition: margin-left 0.3s;
            }

            .main-content.collapsed {
                margin-left: 0;
            }
            .openbtn {
                font-size: 20px;
                cursor: pointer;
                background-color: #343a40;
                color: white;
                border: none;
                position: fixed;
                top: 15px;
                left: 15px;
                z-index: 1;
                padding: 10px 15px;
                display: none;
            }

            .openbtn.visible {
                display: block;
            }
        </style>
    </head>
<body>
    <div class="sidebar" id="sidebar">
        <a href="javascript:void(0)" class="closebtn" onclick="toggleSidebar()">close</a>
        <a href="#">Home</a>
        <a href="#">Services</a>
        <a href="#">Clients</a>
        <a href="#">Contact</a>
    </div>

    <div class="main-content" id="main-content">

        <div class="container-fluid">
            <h1>Main Content</h1>
            <button class="openbtn" id="openbtn" onclick="toggleSidebar()">open</button>
            <p>This is the main content area.</p>
        </div>
    </div>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
    <script>
                function toggleSidebar() {
                    var sidebar = document.getElementById("sidebar");
                    var mainContent = document.getElementById("main-content");
                    var openbtn = document.getElementById("openbtn");
                    sidebar.classList.toggle("collapsed");
                    mainContent.classList.toggle("collapsed");
                    openbtn.classList.toggle("visible");
                }
    </script>
</body>
</html>
