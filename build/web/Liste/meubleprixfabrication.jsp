<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="models.MeubleVolume" %>
<%
    MeubleVolume[] meublevolumes = (MeubleVolume[])request.getAttribute("meublevolumes");
%>
<%@include file="./../Layout/header.jsp" %>
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Liste</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Layout/index.jsp">Accueil</a></li>
          <li class="breadcrumb-item active">Meuble par prix</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class=" offset-2 col-lg-8">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title"></h4>
                  <p><code></code> </p>
                  <!-- Bordered Table -->
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>Meuble</th>
                        <th>Volume</th>
                        <th>Prix de fabrication</th>
                      </tr>
                    </thead>
                    <tbody>
                        <% 
                            for(MeubleVolume mv: meublevolumes){ %>
                                <tr>
                                    <td><%=mv.getNommeuble() %></td>
                                    <td><%=mv.getNomvolume() %></td>
                                    <td><%=mv.getPrixfabrication() %></td>
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
