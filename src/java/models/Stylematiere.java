/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import generalbdd.BDDObject;
import generalbdd.annotation.Column;
import generalbdd.annotation.PrimaryKey;
import generalbdd.annotation.Table;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sahy
 */
@Table(nom = "stylematiere", view = "stylematiere")
public class Stylematiere extends BDDObject{
    @PrimaryKey
    @Column(name = "idstylematiere")
    private int idstylematiere;
    @Column(name = "idstyle")
    private int idstyle;
    @Column(name = "idmatiere")
    private int idmatiere;
    
    Style style;
    Matiere matiere;

    public int getIdstylematiere() {
        return idstylematiere;
    }

    public void setIdstylematiere(int idstylematiere) {
        this.idstylematiere = idstylematiere;
    }

    public int getIdstyle() {
        return idstyle;
    }

    public void setIdstyleString(String idstyle, Connection co)throws Exception{
        this.setIdstyle(Integer.parseInt(idstyle), co);
    }
    
    public void setIdstyle(int idstyle, Connection co)throws Exception {
        this.idstyle = idstyle;
        this.refreshStyle(co);
    }

    public int getIdmatiere() {
        return idmatiere;
    }

    public void setIdmatiereString(String idmatiere, Connection co)throws Exception{
        this.setIdmatiere(Integer.parseInt(idmatiere), co);
    }
    
    public void setIdmatiere(int idmatiere, Connection co) throws Exception{
        this.idmatiere = idmatiere;
        this.refreshMatiere(co);
    }
    
    public Style getStyle() {
        return style;
    }

    public void refreshStyle(Connection co)throws Exception {
        this.style = Style.findById(this.getIdstyle(), co);
    }

    public Matiere getMatiere() {
        return matiere;
    }

    public void refreshMatiere(Connection co) throws Exception {
        this.matiere = Matiere.findById(this.getIdmatiere(), co);
    }
    
    public Stylematiere(){
        
    }

    public Stylematiere(int idstylematiere, int idstyle, int idmatiere, Connection co)throws Exception {
        this.setIdstylematiere(idstylematiere);
        this.setIdstyle(idstyle, co);
        this.setIdmatiere(idmatiere, co);
    }
    
    public Stylematiere(String idstyle, String idmatiere, Connection co)throws Exception {
        this.setIdstylematiere(0);
        this.setIdstyleString(idstyle, co);
        this.setIdmatiereString(idmatiere, co);
    }
    
    
    
    @Override
    public Stylematiere[] find(String filtre, Connection co)throws Exception{
        Statement state = co.createStatement();
        try{
            String sql = "select * from stylematiere where "+filtre;
            ResultSet res = state.executeQuery(sql);
            List<Stylematiere> valiny = new ArrayList<>();
            while(res.next()){
                int idstylematiere = res.getInt("idstylematiere");
                int idstyle = res.getInt("idstyle");
                int idmatiere = res.getInt("idmatiere");
                
                Stylematiere st = new Stylematiere(idstylematiere, idstyle, idmatiere, co);
                valiny.add(st);
            }
            return valiny.toArray(new Stylematiere[valiny.size()]);
        }catch(Exception e){
            throw e;
        }finally{
            try{
                state.close();
            }catch(Exception ex){
                throw ex;
            }
        }
    }
    
    public static Stylematiere findByIdstyleIdmatiere(int idstyle, int idmatiere, Connection co)throws Exception{
        Stylematiere[] liste = new Stylematiere().find("idstyle="+idstyle+" and idmatiere="+idmatiere, co);
        if(liste.length==0){
            return null;
        }
        return liste[0];
    }
    
}
