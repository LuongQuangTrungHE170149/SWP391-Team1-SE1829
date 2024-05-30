<%-- 
    Document   : Error
    Created on : May 23, 2024, 4:37:39 PM
    Author     : Kha21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>F-Care | Error</title>

        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.min.css"rel="stylesheet"/>
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
    </head>
    <body>
        <!-- Navbar-->
        <nav class="navbar navbar-expand-lg navbar-light bg-body-tertiary">
            <div class="container-fluid justify-content-between">
                <!-- Left elements -->
                <div class="d-flex">
                    <!-- Brand -->
                    <a class="navbar-brand me-2 mb-1 d-flex align-items-center" href="#">
                        <img
                            src="https://mdbcdn.b-cdn.net/img/logo/mdb-transaprent-noshadows.webp"
                            height="20"
                            alt="MDB Logo"
                            loading="lazy"
                            style="margin-top: 2px;"
                            />
                    </a>

                    <!-- Search form -->
                    <form class="input-group w-auto my-auto d-none d-sm-flex">
                        <input
                            autocomplete="off"
                            type="search"
                            class="form-control rounded"
                            placeholder="Search"
                            style="min-width: 125px;"
                            />
                        <span class="input-group-text border-0 d-none d-lg-flex"
                              ><i class="fas fa-search"></i
                            ></span>
                    </form>
                </div>
                <!-- Left elements -->

                <!-- Center elements -->
                <ul class="navbar-nav flex-row d-none d-md-flex">
                    <li class="nav-item me-3 me-lg-1 active">
                        <a class="nav-link" href="#">
                            <span><i class="fas fa-home fa-lg"></i></span>
                            <span class="badge rounded-pill badge-notification bg-danger">1</span>
                        </a>
                    </li>

                    <li class="nav-item me-3 me-lg-1">
                        <a class="nav-link" href="#">
                            <span><i class="fas fa-flag fa-lg"></i></span>
                        </a>
                    </li>

                    <li class="nav-item me-3 me-lg-1">
                        <a class="nav-link" href="#">
                            <span><i class="fas fa-video fa-lg"></i></span>
                        </a>
                    </li>

                    <li class="nav-item me-3 me-lg-1">
                        <a class="nav-link" href="#">
                            <span><i class="fas fa-shopping-bag fa-lg"></i></span>
                        </a>
                    </li>

                    <li class="nav-item me-3 me-lg-1">
                        <a class="nav-link" href="#">
                            <span><i class="fas fa-users fa-lg"></i></span>
                            <span class="badge rounded-pill badge-notification bg-danger">2</span>
                        </a>
                    </li>
                </ul>
                <!-- Center elements -->

                <!-- Right elements -->
                <ul class="navbar-nav flex-row">
                    <li class="nav-item me-3 me-lg-1">
                        <a class="nav-link d-sm-flex align-items-sm-center" href="#">
                            <img
                                src="https://mdbcdn.b-cdn.net/img/new/avatars/1.webp"
                                class="rounded-circle"
                                height="22"
                                alt="Black and White Portrait of a Man"
                                loading="lazy"
                                />
                            <strong class="d-none d-sm-block ms-1">John</strong>
                        </a>
                    </li>
                    <li class="nav-item me-3 me-lg-1">
                        <a class="nav-link" href="#">
                            <span><i class="fas fa-plus-circle fa-lg"></i></span>
                        </a>
                    </li>
                    <li class="nav-item dropdown me-3 me-lg-1">
                        <a
                            data-mdb-dropdown-init
                            class="nav-link dropdown-toggle hidden-arrow"
                            href="#"
                            id="navbarDropdownMenuLink"
                            role="button"
                            aria-expanded="false"
                            >
                            <i class="fas fa-comments fa-lg"></i>

                            <span class="badge rounded-pill badge-notification bg-danger">6</span>
                        </a>
                        <ul
                            class="dropdown-menu dropdown-menu-end"
                            aria-labelledby="navbarDropdownMenuLink"
                            >
                            <li>
                                <a class="dropdown-item" href="#">Some news</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">Another news</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown me-3 me-lg-1">
                        <a
                            data-mdb-dropdown-init
                            class="nav-link dropdown-toggle hidden-arrow"
                            href="#"
                            id="navbarDropdownMenuLink"
                            role="button"
                            aria-expanded="false"
                            >
                            <i class="fas fa-bell fa-lg"></i>
                            <span class="badge rounded-pill badge-notification bg-danger">12</span>
                        </a>
                        <ul
                            class="dropdown-menu dropdown-menu-end"
                            aria-labelledby="navbarDropdownMenuLink"
                            >
                            <li>
                                <a class="dropdown-item" href="#">Some news</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">Another news</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown me-3 me-lg-1">
                        <a
                            data-mdb-dropdown-init
                            class="nav-link dropdown-toggle hidden-arrow"
                            href="#"
                            id="navbarDropdownMenuLink"
                            role="button"
                            aria-expanded="false"
                            >
                            <i class="fas fa-chevron-circle-down fa-lg"></i>
                        </a>
                        <ul
                            class="dropdown-menu dropdown-menu-end"
                            aria-labelledby="navbarDropdownMenuLink"
                            >
                            <li>
                                <a class="dropdown-item" href="#">Some news</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">Another news</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- Right elements -->
            </div>
        </nav>
        <!-- Navbar -->
        <h1>${error}</h1>
        <jsp:include page="footer.jsp"></jsp:include>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
        <script>
            import { Dropdown, initMDB } from "mdb-ui-kit";
            initMDB({Dropdown});
        </script>
    </body>

</html>
