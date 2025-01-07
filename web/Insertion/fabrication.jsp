
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Meuble"%>
<%@page import="models.Volume"%>


<%
    Meuble[] meubles = (Meuble[])request.getAttribute("meubles");
    Volume[] volumes = (Volume[])request.getAttribute("volumes");
%>

<%@include file="./../Layout/header.jsp" %>


  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Insertion</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Layout/index.jsp">Accueil</a></li>
          <li class="breadcrumb-item active">Fabrication</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class=" offset-3 col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Insertion quantité </h5>

              <!-- General Form Elements -->
              <form action="${pageContext.request.contextPath}/InsertionFabrication" method="get">
                <div class="row mb-3 mt-2">
                  <label for="inputText" class="col-form-label offset-1 h3">Meuble</label>
                  <div class=" offset-1 col-sm-10" id="idmeuble">
                      <select name='idmeuble' class='form-select' placeholder='Choisir le meuble' required>
                          <option disable> Veuillez choisir le meuble </option>
                          <% for(Meuble meu : meubles){ %>
                          <option value="<%=meu.getIdmeuble()%>"><%=meu.getNom()%></option>                          
                            <% } %>
                      </select>
                  </div>
                </div>
                  
                <div class="row mb-3 mt-2">
                  <label for="inputText" class="col-form-label offset-1 h3">Volume</label>
                  <div class=" offset-1 col-sm-10">
                      <select name='idvolume' class='form-select' placeholder='Choisir le volume' required>
                          <option disable> Veuillez choisir le volume </option>
                          <% for(Volume vol : volumes){ %>
                          <option value="<%=vol.getIdvolume()%>"><%=vol.getNom()%></option>                          
                            <% } %>
                      </select> 
                  </div>
                </div>
                
                <div class="row mb-3 mt-5">
                  <label for="inputText" class="col-form-label offset-1 h3">Quantité</label>
                  <div class=" offset-1 col-sm-10">
                      <input type="number" class="form-control" placeholder="Entrer la quantité" name="quantite">
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