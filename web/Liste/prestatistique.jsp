<%-- 
    Document   : listeStyle
    Created on : 13 déc. 2023, 20:23:03
    Author     : Sahy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Vente" %>
<%@page import="models.Meuble" %>
<%@page import="models.Volume" %>

<%@include file="./../Layout/header.jsp" %>

<%
    Vente[] vente = (Vente[]) request.getAttribute("vente");
    Meuble[] meuble = (Meuble[]) request.getAttribute("meuble");
    Volume[] volume = (Volume[]) request.getAttribute("volume");
    
%>
<main id="main" class="main">

    <div class="pagetitle">
        <h1>Liste</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Layout/index.jsp">Accueil</a></li>
                <li class="breadcrumb-item active">Liste des ventes</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Tableau liste vente</h5>
                        <p><code> Voici la liste de tous les ventes </code> </p>
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
                                <% for(Vente mv : vente){ %>
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
                        <h5 class="card-title">Choix produit statistique</h5>

                        <!-- General Form Elements -->
                        <form action="${pageContext.request.contextPath}/Statistique" method="get">
                            <div class="row mb-3 mt-2">
                                <label for="inputText" class="col-form-label offset-1 h3">Meuble</label>
                                <div class=" offset-1 col-sm-10" id="idmeuble">
                                    <select name='idmeuble' class='form-select' placeholder='Choisir le meuble' required>
                                        <option disable> Veuillez choisir le meuble </option>
                                        <% for(Meuble meu : meuble){ %>
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
                                        <% for(Volume vol : volume){ %>
                                        <option value="<%=vol.getIdvolume()%>"><%=vol.getNom()%></option>                          
                                        <% } %>
                                    </select> 
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
</body>
</html>
