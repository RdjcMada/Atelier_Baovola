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
import java.util.Arrays;

/**
 *
 * @author Sahy
 */
@Table(nom = "style", view = "style")
public class Style extends BDDObject{
    @PrimaryKey
    @Column(name = "idstyle")
    private int idstyle;
    @Column(name = "nom")
    private String nom;
    
    
    public int getIdstyle() {
        return idstyle;
    }
    
    public void setIdstyleString(String idstyle)throws Exception{
        int id = Integer.parseInt(idstyle);
        this.setIdstyle(id);
    }

    public void setIdstyle(int idstyle) throws Exception{
        if(idstyle<0){
            throw new Exception("setIdstyle : valeur negative");
        }
        this.idstyle = idstyle;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) throws Exception{
        if(nom.equals("")){
            throw new Exception("setNom Style vide");
        }
        this.nom = nom;
    }
    

    public Style() {
    }
    
    

    public Style(int idstyle, String nom) throws Exception{
        this.setIdstyle(idstyle);
        this.setNom(nom);
    }
    
    public Style(String nom) throws Exception{
        this.setIdstyle(0);
        this.setNom(nom);
    }
    
    
    @Override
    public Style[] find(String filtre, Connection co)throws Exception{
        Object[] obj = super.find(filtre, co);
        
        return Arrays.copyOf(obj,obj.length,Style[].class);
    }
    
    public static Style findById(int id, Connection co)throws Exception{
        Style[] styles = new Style().find("idstyle="+id, co);
        if(styles.length == 0){
            throw new Exception("Style innexistant");
        }
        return styles[0];
    }
    
    
}
