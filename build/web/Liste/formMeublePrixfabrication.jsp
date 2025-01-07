<%@include file="./../Layout/header.jsp" %>
<main id="main" class="main">

    <div class="pagetitle">
        <h1>Liste</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Layout/index.jsp">Accueil</a></li>
                <li class="breadcrumb-item active">Formulaire recherche meuble par prix de fabrication</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class=" offset-2 col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"></h5>
                        <p><code> Recherche par Probleme </code> </p>

                        <form class="row g-3" action="../Probleme" method="get">
                            <div class="col-md-6">
                                <label for="typeservice" class="form-label"> Type de Service </label>
                                <select name="id_service_type"> 
                                    <option value="type"> Type </option>
                                </select> 
                            </div>
                            
                            <div class="col-md-6">
                                <label for="probleme" class="form-label"> Probleme </label>
                                  <select name="id_type_issue"> 
                                    <option value="type"> Probleme </option>
                                </select>
                            </div>
                            
                            <button type="submit" class="btn btn-primary">Rechercher</button>
                        </form>
                        
                        
                    </div>
        </div>
                
        <div class="row"> 
                
            <h2> Resultats </h2>
            
            <table class="table" border="1" width="800px">
                  
                <tr>
                    <th>idService</th>
                    <th>Ordinateur</th>
                    <th>DateDeposition</th>
                    <th>DateRestitution</th>
                    <th>Description</th>
                    <th>Status</th>
                </tr>
                
            <% for (int i=0;i<5;i++) { %>
                <tr>
                    <td> 1 </td>
                    <td> HP  </td>
                    <td> 07 Janvier 2025 </td>
                    <td> 15 Janvier 2025 </td>
                    <td> Reparation Ecran </td>
                    <td> En Cours </td>
                </tr>
            <% } %>
                
            </table>



        </div>

                
                
                </section>

                </main><!-- End #main -->

                <%@include file="./../Layout/footer.jsp" %>