<%-- 
    Document   : listeStyle
    Created on : 13 déc. 2023, 20:23:03
    Author     : Sahy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Style" %>
<%@include file="./../Layout/header.jsp" %>

<%
    Style[] listestyle = (Style[]) request.getAttribute("listestyle");
%>
<main id="main" class="main">

    <div class="pagetitle">
      <h1>Liste</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Layout/index.jsp">Accueil</a></li>
          <li class="breadcrumb-item active">Liste des styles</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class=" offset-2 col-lg-8">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Tableau liste style</h5>
                  <p><code> Voici la liste de tous les styles</code> </p>
                  <!-- Bordered Table -->
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>Style</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      <% for(Style sty : listestyle){ %>
                        <tr>
                            <td><%=sty.getNom() %></th>
                            <td><a href="${pageContext.request.contextPath}/PreListeMatiereStyle?idstyle=<%=sty.getIdstyle() %>">Voir Details</a></td>
                        </tr>
                      <% } %>
                      
                    </tbody>
                  </table>
                  <!-- End Bordered Table -->
        </div>
      </div>
    </section>

  </main><!-- End #main -->

<%@include file="./../Layout/footer.jsp" %>