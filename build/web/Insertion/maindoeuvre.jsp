
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Maindoeuvre"%>
<%@page import="models.Style"%>
<%@page import="models.Typempiasa"%>

<%
    Maindoeuvre[] maindoeuvres = (Maindoeuvre[])request.getAttribute("maindoeuvres");
    Style[] styles = (Style[])request.getAttribute("styles");
    Typempiasa[] typempiasas = (Typempiasa[])request.getAttribute("typempiasas");
%>

<%@include file="./../Layout/header.jsp" %>


<main id="main" class="main">

    <div class="pagetitle">
        <h1>Insertion</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Layout/index.jsp">Accueil</a></li>
                <li class="breadcrumb-item active">Main d'oeuvre</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="  col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Main d'oeuvre</h4>
                        <p><code></code> </p>
                        <!-- Bordered Table -->
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Nom style</th>
                                    <th>Type mpiasa</th>
                                    <th>Horaire</th>
                                    <th>Isa defaut</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                            for(Maindoeuvre mo: maindoeuvres){ %>
                                <tr>
                                    <td><%=mo.getIdmaindoeuvre()%></td>
                                    <td><%=mo.getNomstyle() %></td>
                                    <td><%=mo.getNomtypempiasa() %></td>
                                    <td><%=mo.getHoraire() %></td>
                                    <td><%=mo.getIsadefaut() %></td>
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
                        <h5 class="card-title">Insertion main d'oeuvre</h5>

                        <!-- General Form Elements -->
                        <form action="${pageContext.request.contextPath}/InsertionMaindoeuvre" method="get">


                            <div class="row mb-3 mt-2">
                                <label for="inputText" class="col-form-label offset-1 h3">Style</label>
                                <div class=" offset-1 col-sm-10" id="style">
                                    <select name='idstyle' class='form-select'  required>
                                        <option disabled> Veuillez choisir le style </option>
                                        <% for(Style sty : styles){ %>
                                        <option value="<%=sty.getIdstyle()%>"><%=sty.getNom()%></option>                          
                                        <% } %>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3 mt-2">
                                <label for="inputText" class="col-form-label offset-1 h3">Type mpiasa</label>
                                <div class=" offset-1 col-sm-10" id="style">
                                    <select name='idtypempiasa' class='form-select'  required>
                                        <option disabled> Veuillez choisir le type mpiasa </option>
                                        <% for(Typempiasa tp : typempiasas){ %>
                                        <option value="<%=tp.getIdtypempiasa()%>"><%=tp.getNom()%></option>                          
                                        <% } %>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3 mt-2">
                                <label for="inputText" class="col-form-label offset-1 h3">Horaire</label>
                                <div class=" offset-1 col-sm-10" id="horaire">
                                    <input name='horaire' class='form-control' type='number'required>
                                </div>
                            </div>

                            <div class="row mb-3 mt-2">
                                <label for="inputText" class="col-form-label offset-1 h3">Isa defaut</label>
                                <div class=" offset-1 col-sm-10" id="isadefaut">
                                    <input name='isadefaut' class='form-control' type='number'required>
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