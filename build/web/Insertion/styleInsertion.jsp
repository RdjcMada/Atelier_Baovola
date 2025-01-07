
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Matiere"%>

<%
    Matiere[] listematiere = (Matiere[])request.getAttribute("listematiere");
%>

<%@include file="./../Layout/header.jsp" %>


  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Insertion</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Layout/index.jsp">Accueil</a></li>
          <li class="breadcrumb-item active">Style</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class=" offset-3 col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Insertion Style</h5>

              <!-- General Form Elements -->
              <form action="${pageContext.request.contextPath}/InsertionStyle" method="get">
                <div class="row mb-3 mt-5">
                  <label for="inputText" class="col-form-label offset-1 h3">Nom Style</label>
                  <div class=" offset-1 col-sm-10">
                      <input type="text" class="form-control" placeholder="Entrer le nom du style" name="nom">
                  </div>
                </div>

                <div class="row mb-3 ">
                    <legend class="col-form-label offset-1 pt-0 mt-4">Liste des matières correspondants : </legend>
                    <div class=" offset-1 col-sm-10">
                        
                        <% for(int i=0 ;i<listematiere.length; i++){ %>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="matieres" id="gridCheck<%=(i+1)%>" value="<%=listematiere[i].getIdmatiere() %>">
                            <label class="form-check-label" for="gridCheck<%=(i+1)%>">
                                <%=listematiere[i].getNom() %>
                            </label>
                            </div>
                        <% } %>
                        
                    </div>
                  </div>
               

                  
                <div class="row mb-3 mt-5">
                  <div class="offset-5 col-sm-10">
                    <button type="submit" class="btn btn-primary">Valider</button>
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