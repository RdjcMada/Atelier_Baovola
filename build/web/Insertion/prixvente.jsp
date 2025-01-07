
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Categorie"%>
<%@page import="models.Meuble"%>
<%@page import="models.Volume"%>
<%@page import="models.MeubleVolume"%>

<%
    MeubleVolume[] meublevolumes = (MeubleVolume[])request.getAttribute("meublevolumes");
    Volume[] volumes = (Volume[])request.getAttribute("volume");
    Meuble[] meuble = (Meuble[])request.getAttribute("meuble");
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
                                    <th>Meuble</th>
                                    <th>Categorie</th>
                                    <th>Style</th>
                                    <th>Volume</th>
                                    <th>Prix de fabrication</th>
                                    <th>Prix du main d'oeuvre</th>
                                    <th>Prix de revient</th>
                                    <th>Prix de vente</th>
                                    <th>Benefice</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                            for(MeubleVolume mv: meublevolumes){ %>
                                <tr>
                                    <td><%=mv.getNommeuble() %></td>
                                    <td><%=mv.getNomcategorie() %></td>
                                    <td><%=mv.getNomstyle() %></td>
                                    <td><%=mv.getNomvolume() %></td>
                                    <td><%=mv.getPrixfabrication() %></td>
                                    <td><%=mv.getTotalmaindoeuvre() %></td>
                                    <td><%=mv.getPrixrevient() %></td>
                                    <td><%=mv.getPrixvente() %></td>
                                    <td><%=mv.getBenefice() %></td>
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
                        <h5 class="card-title">Insertion prix de vente </h5>

                        <!-- General Form Elements -->
                        <form action="${pageContext.request.contextPath}/PrixVente" method="get">
                            <div class="row mb-3 mt-2">
                                <label for="inputText" class="col-form-label offset-1 h3">Meuble</label>
                                <div class=" offset-1 col-sm-10" id="meuble">
                                    <select name='idmeuble' class='form-select' required>
                                        <option disabled> Veuillez Choisir le meuble  </option>
                                        <% for(Meuble cat : meuble){ %>
                                        <option value="<%=cat.getIdmeuble()%>"><%=cat.getNom()%></option>                          
                                        <% } %>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3 mt-2">
                                <label for="inputText" class="col-form-label offset-1 h3">Volume</label>
                                <div class=" offset-1 col-sm-10" id="style">
                                    <select name='idvolume' class='form-select'  required>
                                        <option disabled> Veuillez choisir le volume </option>
                                        <% for(Volume sty : volumes){ %>
                                        <option value="<%=sty.getIdvolume()%>"><%=sty.getNom()%></option>                          
                                        <% } %>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3 mt-2">
                                <label for="inputText" class="col-form-label offset-1 h3">Prix de vente</label>
                                <div class=" offset-1 col-sm-10" id="style">
                                    <input name='prixvente' class='form-control' type='number'required>
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