
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Matiere"%>

<%
    Matiere[] matieres = (Matiere[])request.getAttribute("matieres");
%>

<%@include file="./../Layout/header.jsp" %>


<main id="main" class="main">

    <div class="pagetitle">
        <h1>Liste</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Layout/index.jsp">Accueil</a></li>
                <li class="breadcrumb-item active">form matiere</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class=" offset-3 col-lg-6">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Formulaire pour voir meuble ayant matiere</h5>

                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Matiere</th>
                                    <th>En stock</th>
                                    <th>Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Matiere mat : matieres){ %>
                                <tr>
                                    <td><%=mat.getNom()%></td>
                                    <td><%=mat.getEnstock()%></td>
                                    <td><a href="ListParMatiere?idmatiere=<%= mat.getIdmatiere() %>" >Voir details</a></td>
                                </tr>                     
                                <% } %>


                            </tbody>
                        </table>

                    </div>
                </div>

            </div>
        </div>
    </section>

</main><!-- End #main -->
<%@include file="./../Layout/footer.jsp" %>