<html>

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Meuble</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: NiceAdmin
        * Updated: Nov 17 2023 with Bootstrap v5.3.2
        * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center">

            <div class="d-flex align-items-center justify-content-between">
                <a href="${pageContext.request.contextPath}/Layout/index.jsp" class="logo d-flex align-items-center">
                    <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="">
                    <span class="d-none d-lg-block">Meuble</span>
                </a>
                <i class="bi bi-list toggle-sidebar-btn"></i>
            </div><!-- End Logo -->

            <div class="search-bar">
                <form class="search-form d-flex align-items-center" method="POST" action="#">
                    <input type="text" name="query" placeholder="Search" title="Enter search keyword">
                    <button type="submit" title="Search"><i class="bi bi-search"></i></button>
                </form>
            </div><!-- End Search Bar -->

            <nav class="header-nav ms-auto">
                <ul class="d-flex align-items-center">

                    <li class="nav-item d-block d-lg-none">
                        <a class="nav-link nav-icon search-bar-toggle " href="#">
                            <i class="bi bi-search"></i>
                        </a>
                    </li><!-- End Search Icon-->



                </ul>
            </nav><!-- End Icons Navigation -->

        </header><!-- End Header -->

        <!-- ======= Sidebar ======= -->
        <aside id="sidebar" class="sidebar">

            <ul class="sidebar-nav" id="sidebar-nav">
                <li class="nav-heading">Pages</li>

                <li class="nav-item">
                    <a class="nav-link " data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                        <i class="bi bi-journal-text"></i><span>Insertion</span><i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul id="forms-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">

                        <li>
                            <a href="${pageContext.request.contextPath}/Insertion/categorieInsertion.jsp">
                                <i class="bi bi-circle"></i><span> Catégorie </span>
                            </a>
                        </li>
                        <li>

                            <a href="${pageContext.request.contextPath}/Insertion/matiereInsertion.jsp">
                                <i class="bi bi-circle"></i><span> Matiere </span>
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/PreInsertionStyle">
                                <i class="bi bi-circle"></i><span> Style </span>
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/PreInsertionMeuble">
                                <i class="bi bi-circle"></i><span> Meuble </span>
                            </a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/Insertion/volume.jsp">
                                <i class="bi bi-circle"></i><span> Volume </span>
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/PreInsertionQuantiteMatiere">
                                <i class="bi bi-circle"></i><span> Quantité Matiere </span>
                            </a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/PreStock">
                                <i class="bi bi-circle"></i><span> Stock </span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/PreInsertionFabrication">
                                <i class="bi bi-circle"></i><span> Fabrication </span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/PrePrixVente">
                                <i class="bi bi-circle"></i><span> Prix de vente </span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/Insertion/typempiasa.jsp">
                                <i class="bi bi-circle"></i><span> Type mpiasa </span>
                            </a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/PreInsertionMaindoeuvre">
                                <i class="bi bi-circle"></i><span> Main d'oeuvre </span>
                            </a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/Insertion/profil.jsp">
                                <i class="bi bi-circle"></i><span> Profil </span>
                            </a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/PreInsertionPersonne">
                                <i class="bi bi-circle"></i><span> Personne </span>
                            </a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/PreClient">
                                <i class="bi bi-circle"></i><span> Client </span>
                            </a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/PreVente">
                                <i class="bi bi-circle"></i><span> Vente </span>
                            </a>
                        </li>
                        
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link " data-bs-target="#liste-nav" data-bs-toggle="collapse" href="#">
                        <i class="bi bi-layout-text-window-reverse"></i><span>Liste</span><i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul id="liste-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                        <li>
                            <a href="${pageContext.request.contextPath}/PreListeStyle">
                                <i class="bi bi-circle"></i><span>Liste styles</span>
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/Liste/formMeublePrixfabrication.jsp">
                                <i class="bi bi-circle"></i><span>Recherche par prix</span>
                            </a>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/PreListParMatiere">
                                <i class="bi bi-circle"></i><span>Liste par matière</span>

                            </a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/Liste/formBenefice.jsp">
                                <i class="bi bi-circle"></i><span>Liste par bénéfice</span>

                            </a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/PreStatistique">
                                <i class="bi bi-circle"></i><span> Statistique </span>
                            </a>
                        </li>
                        
                    </ul>
                </li>

                <!-- End Forms Nav -->

            </ul>

        </aside><!-- End Sidebar-->
