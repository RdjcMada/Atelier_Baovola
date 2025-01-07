


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Client"%>
<%@page import="models.Genre"%>

<%
    Genre[] genre = (Genre[])request.getAttribute("genre");
    Client[] client = (Client[])request.getAttribute("client");
%>

<%@include file="./../Layout/header.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Insertion</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Layout/index.jsp">Accueil</a></li>
          <li class="breadcrumb-item active">Client</li>
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
                                    <th>Client</th>
                                    <th>Genre</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                            for(Client mv: client){ %>
                                <tr>
                                    <td><%=mv.getNom() %></td>
                                    <td><%=mv.getNomgenre() %></td>
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
              <h5 class="card-title">Insertion Client </h5>

              <!-- General Form Elements -->
              <form action="InsertionClient" method="get">
                <div class="row mb-3 mt-5">
                  <label for="inputText" class="col-form-label offset-1 h3">Nom Client</label>
                  <div class=" offset-1 col-sm-10">
                    <input type="text" class="form-control" placeholder="Entrer le nom du client" name="nom">
                  </div>
                </div>
               
                  <div class="row mb-3 mt-2">
                  <label for="inputText" class="col-form-label offset-1 h3">Genre</label>
                  <div class=" offset-1 col-sm-10">
                      <select name='idgenre' class='form-select' required>
                          <option disable> Veuillez choisir le genre </option>
                          <% for(Genre cat : genre){ %>
                          <option value="<%=cat.getIdgenre()%>"><%=cat.getNom()%></option>                          
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