
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="models.Meuble"%>
<%@page import="models.Volume"%>
<%@page import="models.Client"%>
<%@page import="models.Vente"%>

<%
    Vente[] vente = (Vente[])request.getAttribute("vente");
    Volume[] volume = (Volume[])request.getAttribute("volume");
    Meuble[] meuble = (Meuble[])request.getAttribute("meuble");
    Client[] client = (Client[])request.getAttribute("client");
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
                                    <th>Date</th>
                                    <th>Meuble</th>
                                    <th>Volume</th>
                                    <th>Client</th>
                                    <th>Genre</th>
                                    <th>Quantite</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                            for(Vente mv: vente){ %>
                                <tr>
                                    <td><%=mv.getDate() %></td>
                                    <td><%=mv.getNommeuble() %></td>
                                    <td><%=mv.getNomvolume() %></td>
                                    <td><%=mv.getNomclient() %></td>
                                    <td><%=mv.getNomgenre() %></td>
                                    <td><%=mv.getQuantite() %></td>
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
              <h5 class="card-title">Insertion Vente</h5>

              <!-- General Form Elements -->
              <form action="InsertionVente" method="get">
                  
                <div class="row mb-3 mt-2">
                  <label for="inputText" class="col-form-label offset-1 h3">Client</label>
                  <div class=" offset-1 col-sm-10">
                      <select name='idclient' class='form-select' placeholder='Choisir le Client' required>
                          <option disable> Veuillez choisir le client </option>
                          <% for(Client mat : client){ %>
                          <option value="<%=mat.getIdclient()%>"><%=mat.getNom()%></option>                          
                            <% } %>
                      </select>
                  </div>
                </div>
                
                <div class="row mb-3 mt-5">
                  <label for="inputText" class="col-form-label offset-1 h3">Date </label>
                  <div class=" offset-1 col-sm-10">
                    <input type="date" class="form-control" placeholder="Entrer la date de vente du meuble" name="date">
                  </div>
                </div>
                  
                <div class="row mb-3 mt-2">
                  <label for="inputText" class="col-form-label offset-1 h3">Meuble</label>
                  <div class=" offset-1 col-sm-10">
                      <select name='idmeuble' class='form-select' placeholder='Choisir le meuble' required>
                          <option disable> Veuillez choisir le meuble </option>
                          <% for(Meuble mat : meuble){ %>
                          <option value="<%=mat.getIdmeuble()%>"><%=mat.getNom()%></option>                          
                            <% } %>
                      </select>
                  </div>
                </div>
                                   
                <div class="row mb-3 mt-2">
                  <label for="inputText" class="col-form-label offset-1 h3">Volume</label>
                  <div class=" offset-1 col-sm-10">
                      <select name='idvolume' class='form-select' placeholder='Choisir le volume' required>
                          <option disable> Veuillez choisir le volume </option>
                          <% for(Volume mat : volume){ %>
                          <option value="<%=mat.getIdvolume()%>"><%=mat.getNom()%></option>                          
                            <% } %>
                      </select>
                  </div>
                </div>
                      
                <div class="row mb-3 mt-5">
                  <label for="inputText" class="col-form-label offset-1 h3">Quantite </label>
                  <div class=" offset-1 col-sm-10">
                    <input type="number" class="form-control" placeholder="Entrer la quantite" name="qtt">
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