<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="models.Quantitematiere" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>

<%
    Quantitematiere[] quantiteMatiere = (Quantitematiere[])request.getAttribute("qttMatiere");
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
            <div class="card-body mt-5">
                  <p><code> Voici la liste des meubles ayant pour matière : <%=quantiteMatiere[0].getNommatiere()%> </code> </p>
                  <!-- Bordered Table -->
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>Nom Meuble</th>
                      </tr>
                    </thead>
                    <tbody>
                        <% 
                            List<String> uniqueName = new ArrayList<>();
                            for(Quantitematiere stym: quantiteMatiere){        
                                if(!uniqueName.contains(stym.getNommeuble())){
                                uniqueName.add(stym.getNommeuble());
                        %>
                                <tr>
                                    <td><%=stym.getNommeuble() %></td>
                                </tr>
                                
                        <%      } 
                            }
                        %>
                      
                    </tbody>
                  </table>
                  <!-- End Bordered Table -->
        </div>
      </div>
    </section>

  </main><!-- End #main -->

  <%@include file="./../Layout/footer.jsp" %>
