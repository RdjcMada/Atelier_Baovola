/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.insertion;

import connexion.Connexion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Matiere;
import models.Style;
import models.Stylematiere;

/**
 *
 * @author Sahy
 */
public class InsertionStyle extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        Connexion co = new Connexion();
        try{
            String nom = request.getParameter("nom");
            String[] matieres = request.getParameterValues("matieres");
            co.openAll();
            co.getConnectionPostgres().setAutoCommit(false);
            
            Style style = new Style(nom);
            style.insert(co.getConnectionPostgres());
            
            for(String idmat : matieres){
                Stylematiere stym = new Stylematiere(String.valueOf(style.getIdstyle()) , idmat, co.getConnectionPostgres());
                stym.insert(co.getConnectionPostgres());
            }
            
            co.getConnectionPostgres().commit();
            out.println("<h3>Style inserée<h3>");
            out.print("<a href='Layout/index.jsp'>Retour a l'accueil</a>");
        }catch(Exception ex){
            try{
                co.getConnectionPostgres().rollback();
                out.print(ex);
                ex.printStackTrace();
            }catch(Exception exp){
                exp.printStackTrace();
                out.print(exp);
            }
            ex.printStackTrace();
            out.print(ex);
            out.print("<a href='Layout/index.jsp'>Retour a l'accueil</a>");
        }finally{
            try{
                co.getConnectionPostgres().setAutoCommit(true);
                co.closeAll();    
            }catch(Exception e){
                e.printStackTrace();
                out.print(e);
            }
        }
    }
        
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
