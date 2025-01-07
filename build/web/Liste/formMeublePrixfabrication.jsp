<%@include file="./../Layout/header.jsp" %>
<main id="main" class="main">

    <div class="pagetitle">
        <h1>Liste</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Layout/index.jsp">Accueil</a></li>
                <li class="breadcrumb-item active">Formulaire recherche meuble par prix de fabrication</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class=" offset-2 col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"></h5>
                        <p><code> Recherche meuble par prix de fabrication</code> </p>

                        <form class="row g-3" action="../MeublePrixFabrication" method="get">
                            <div class="col-md-6">
                                <label for="prixmin" class="form-label">Prix min</label>
                                <input type="number" class="form-control" id="prixmin" name="prixmin" required>
                            </div>
                            <div class="col-md-6">
                                <label for="prixmax" class="form-label">Prix max</label>
                                <input type="number" class="form-control" id="prixmax" name="prixmax" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Rechercher</button>
                        </form>
                    </div>
                </div>
                </section>

                </main><!-- End #main -->

                <%@include file="./../Layout/footer.jsp" %>