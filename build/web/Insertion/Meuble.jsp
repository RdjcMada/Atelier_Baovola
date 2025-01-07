


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Categorie"%>
<%@page import="models.Style"%>

<%
    Categorie[] categories = (Categorie[])request.getAttribute("categories");
    Style[] styles = (Style[])request.getAttribute("styles");
%>

<%@include file="./../Layout/header.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Insertion</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Layout/index.jsp">Accueil</a></li>
          <li class="breadcrumb-item active">Meuble</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class=" offset-3 col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Insertion Meuble </h5>

              <!-- General Form Elements -->
              <form action="InsertionMeuble" method="get">
                <div class="row mb-3 mt-5">
                  <label for="inputText" class="col-form-label offset-1 h3">Nom Meuble</label>
                  <div class=" offset-1 col-sm-10">
                    <input type="text" class="form-control" placeholder="Entrer le nom du meuble" name="nom">
                  </div>
                </div>
               
                  <div class="row mb-3 mt-2">
                  <label for="inputText" class="col-form-label offset-1 h3">Catégorie</label>
                  <div class=" offset-1 col-sm-10">
                      <select name='categorie' class='form-select' required>
                          <option disable> Veuillez choisir la catégorie </option>
                          <% for(Categorie cat : categories){ %>
                          <option value="<%=cat.getIdcategorie()%>"><%=cat.getNom()%></option>                          
                            <% } %>
                          
                      </select>
                  </div>
                </div>
                  
                    <div class="row mb-3 mt-2">
                  <label for="inputText" class="col-form-label offset-1 h3">Style</label>
                  <div class=" offset-1 col-sm-10">
                      <select name='style' class='form-select' required>
                          <option disable> Veuillez choisir la style </option>
                          <% for(Style sty : styles){ %>
                          <option value="<%=sty.getIdstyle()%>"><%=sty.getNom()%></option>                          
                            <% } %>
                          
                      </select>
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