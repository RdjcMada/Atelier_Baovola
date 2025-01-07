<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="models.Stylematiere" %>
<%
    Stylematiere[] listestylematiere = (Stylematiere[])request.getAttribute("listestylematiere");
%>
<%@include file="./../Layout/header.jsp" %>
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Liste</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Layout/index.jsp">Accueil</a></li>
          <li class="breadcrumb-item active">Tableau liste style/matière</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class=" offset-2 col-lg-8">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">Style : <%=listestylematiere[0].getStyle().getNom()%></h4>
                  <p><code> Voici la liste des matières qui peut correspondre avec ce style</code> </p>
                  <!-- Bordered Table -->
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>Matières possibles</th>
                      </tr>
                    </thead>
                    <tbody>
                        <% 
                            for(Stylematiere stym: listestylematiere){ %>
                                <tr>
                                    <td><%=stym.getMatiere().getNom() %></td>
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
