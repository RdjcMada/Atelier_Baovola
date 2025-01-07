<%-- 
    Document   : listeStyle
    Created on : 13 déc. 2023, 20:23:03
    Author     : Sahy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Vente" %>

<%@include file="./../Layout/header.jsp" %>

<%
    Vente[] vente = (Vente[]) request.getAttribute("vente");

    
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
        <div>
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Pie Chart</h5>

                        <!-- Pie Chart -->
                        <canvas id="pieChart" style="max-height: 400px;"></canvas>
                        <p> Total vente : <%=Vente.getVenteTotal(vente)%> </p>
                        <p> ventes hommes : <%=Vente.getVenteHommeTotal(vente)%>  </p>
                        <p> ventes femmes : <%=Vente.getVenteFemmeTotal(vente)%> </p>

                        <script>
                            document.addEventListener("DOMContentLoaded", () => {
                                new Chart(document.querySelector('#pieChart'), {
                                    type: 'pie',
                                    data: {
                                        labels: [
                                            'Homme',
                                            'Femmes',
                                        ],
                                        datasets: [{
                                                label: 'Nb vente',
                                                data: [<%=Vente.getVenteHommeTotal(vente)%>, <%=Vente.getVenteFemmeTotal(vente)%>],
                                                backgroundColor: [
                                                    'rgb(54, 162, 235)',
                                                    'rgb(255, 99, 132)'
                                                ],
                                                hoverOffset: 4
                                            }]
                                    }
                                });
                            });
                        </script>
                        <!-- End Pie CHart -->

                    </div>
                </div>
            </div>
        </div>
    </section>

</main><!-- End #main -->

<%@include file="./../Layout/footer.jsp" %>
</body>
</html>
