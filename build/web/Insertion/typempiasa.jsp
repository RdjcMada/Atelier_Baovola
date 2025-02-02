


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./../Layout/header.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Insertion</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Layout/index.jsp">Accueil</a></li>
          <li class="breadcrumb-item active">Type mpiasa</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class=" offset-3 col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Insertion Type Mpiasa</h5>

              <!-- General Form Elements -->
              <form action="../InsertionTypempiasa" method="get">
                <div class="row mb-3 mt-5">
                  <label for="inputText" class="col-form-label offset-1 h3">Nom Type mpiasa</label>
                  <div class=" offset-1 col-sm-10">
                    <input type="text" class="form-control" placeholder="Entrer le nom du type" name="nom">
                  </div>
                </div>
               <div class="row mb-3 mt-5">
                  <label for="inputText" class="col-form-label offset-1 h3">Salaire par heure</label>
                  <div class=" offset-1 col-sm-10">
                    <input type="number" class="form-control" placeholder="Entrer salaire/h" name="salaireheure">
                  </div>
                </div>

                <div class="row mb-3 mt-5">
                  <div class="offset-5 col-sm-10">
                    <button type="submit" class="btn btn-primary" > Valider </button>
                  </div>
                </div>

              </form><!-- End General Form Elements -->

            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->
  
<%@include file="./../Layout/footer.jsp" %>