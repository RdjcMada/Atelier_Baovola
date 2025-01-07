
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Typempiasa"%>
<%@page import="models.Personne"%>

<%
    Typempiasa[] typempiasas = (Typempiasa[])request.getAttribute("typempiasas");
    Personne[] personnes = (Personne[]) request.getAttribute("personnes");
%>

<%@include file="./../Layout/header.jsp" %>


<main id="main" class="main">

    <div class="pagetitle">
        <h1>Insertion</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Layout/index.jsp">Accueil</a></li>
                <li class="breadcrumb-item active">Prix de vente</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="  col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title"></h4>
                        <p><code></code> </p>
                        <!-- Bordered Table -->
                        <table class="table datatable">
                            <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Date Entrée </th>
                                    <th>Type mpiasa</th>
                                    <th>Salaire de base</th>
                                    <th>Profil</th>
                                    <th>Taux horaire</th>
                                    <th>Salaire Total </th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                            for(Personne pe: personnes){ %>
                                <tr>
                                    <td><%=pe.getNom() %></td>
                                    <td><%=pe.getDateentree() %></td>
                                    <td><%=pe.getNomtypempiasa() %></td>
                                    <td><%=pe.getSalaireheure() %></td>
                                    <td><%=pe.getProfil().getNom() %></td>
                                    <td><%=pe.getProfil().getTauxhoraire() %></td>
                                    <td><%=pe.getSalaireTotal() %></td>
                                    
                                </tr>
                                <% } %>

                            </tbody>
                        </table>
                        <!-- End Bordered Table -->
                    </div>
                </div>
            </div>
        </div>
      <div class="row">
        <div class=" offset-3 col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Insertion Personne</h5>

              <!-- General Form Elements -->
              <form action="InsertionPersonne" method="get">
                <div class="row mb-3 mt-5">
                  <label for="inputText" class="col-form-label offset-1 h3">Nom Personne</label>
                  <div class=" offset-1 col-sm-10">
                    <input type="text" class="form-control" placeholder="Entrer le nom de la personne" name="nom">
                  </div>
                </div>
               
                 <div class="row mb-3 mt-5">
                  <label for="inputText" class="col-form-label offset-1 h3">Date d'entrée </label>
                  <div class=" offset-1 col-sm-10">
                      <input type="date" class="form-control" placeholder="Entrer la date d'entrée " name="dateentree">
                  </div>
                </div>
                  
                 <div class="row mb-3 mt-2">
                  <label for="inputText" class="col-form-label offset-1 h3">Type Mpiasa</label>
                  <div class=" offset-1 col-sm-10">
                      <select name='idtypempiasa' class='form-select' placeholder='Choisir type mpiasa' required>
                          <option disable> Veuillez choisir le type mpiasa </option>
                          <% for(Typempiasa tp : typempiasas){ %>
                          <option value="<%=tp.getIdtypempiasa()%>"><%=tp.getNom()%></option>                          
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